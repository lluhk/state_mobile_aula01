// state/bloc_favorites/favorites_bloc.dart
// BLoC de favoritos — mesmo padrão do CounterBloc do projeto base.

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/product.dart';
import 'favorites_event.dart';
import 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesBlocState> {
  FavoritesBloc()
      : super(FavoritesBlocState(products: [
          Product(name: 'Notebook',  price: 3500.00),
          Product(name: 'Mouse',     price: 120.00),
          Product(name: 'Teclado',   price: 250.00),
          Product(name: 'Monitor',   price: 900.00),
          Product(name: 'Headset',   price: 350.00),
          Product(name: 'Webcam',    price: 280.00),
          Product(name: 'Mousepad',  price: 80.00),
          Product(name: 'Hub USB',   price: 150.00),
        ])) {
    on<ToggleFavoriteEvent>((event, emit) {
      final updated = List<Product>.from(state.products);
      updated[event.index].favorite = !updated[event.index].favorite;
      emit(FavoritesBlocState(
        products: updated,
        showFavoritesOnly: state.showFavoritesOnly,
      ));
    });

    on<ToggleFilterEvent>((event, emit) {
      emit(FavoritesBlocState(
        products: state.products,
        showFavoritesOnly: !state.showFavoritesOnly,
      ));
    });
  }
}
