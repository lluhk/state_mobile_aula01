// state/riverpod_favorites/favorites_riverpod.dart
//
// Gerenciamento de favoritos com Riverpod.
// Mesmo padrão do counterProvider do projeto base,
// agora usando StateNotifier para controlar a lista de produtos.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/product.dart';

// Estado da tela: lista de produtos + filtro
class FavoritesState {
  final List<Product> products;
  final bool showFavoritesOnly;

  FavoritesState({required this.products, this.showFavoritesOnly = false});

  List<Product> get displayed =>
      showFavoritesOnly
          ? products.where((p) => p.favorite).toList()
          : List.unmodifiable(products);

  int get favoriteCount => products.where((p) => p.favorite).length;

  FavoritesState copyWith({List<Product>? products, bool? showFavoritesOnly}) {
    return FavoritesState(
      products: products ?? this.products,
      showFavoritesOnly: showFavoritesOnly ?? this.showFavoritesOnly,
    );
  }
}

class FavoritesNotifier extends StateNotifier<FavoritesState> {
  FavoritesNotifier()
      : super(FavoritesState(products: [
          Product(name: 'Notebook',  price: 3500.00),
          Product(name: 'Mouse',     price: 120.00),
          Product(name: 'Teclado',   price: 250.00),
          Product(name: 'Monitor',   price: 900.00),
          Product(name: 'Headset',   price: 350.00),
          Product(name: 'Webcam',    price: 280.00),
          Product(name: 'Mousepad',  price: 80.00),
          Product(name: 'Hub USB',   price: 150.00),
        ]));

  void toggleFavorite(int index) {
    final updated = List<Product>.from(state.products);
    updated[index].favorite = !updated[index].favorite;
    state = state.copyWith(products: updated);
  }

  void toggleFilter() {
    state = state.copyWith(showFavoritesOnly: !state.showFavoritesOnly);
  }
}

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, FavoritesState>(
  (ref) => FavoritesNotifier(),
);
