// presentation/viewmodels/product_viewmodel.dart
//
// ViewModel responsável por coordenar o estado da tela.
// Usa ChangeNotifier (Provider) para notificar a interface sempre que o
// estado mudar — sem que a UI precise saber COMO o estado é atualizado.
//
// Conforme o material de aula: o ViewModel não realiza chamadas HTTP,
// não manipula JSON e não depende de modelos externos.

import 'package:flutter/foundation.dart';
import '../../domain/entities/product.dart';
import 'product_state.dart';

class ProductViewModel extends ChangeNotifier {
  ProductState _state = ProductState(
    products: [
      Product(name: 'Notebook',   price: 3500.00),
      Product(name: 'Mouse',      price: 120.00),
      Product(name: 'Teclado',    price: 250.00),
      Product(name: 'Monitor',    price: 900.00),
      Product(name: 'Headset',    price: 350.00),
      Product(name: 'Webcam',     price: 280.00),
      Product(name: 'Mousepad',   price: 80.00),
      Product(name: 'Hub USB',    price: 150.00),
    ],
  );

  ProductState get state => _state;

  /// Alterna o status de favorito do produto na posição [index].
  /// Cria uma nova lista para preservar a imutabilidade do estado.
  void toggleFavorite(int index) {
    final updatedList = List<Product>.from(_state.products);
    updatedList[index].favorite = !updatedList[index].favorite;
    _state = _state.copyWith(products: updatedList);
    notifyListeners();
  }

  /// Alterna o filtro de exibição (todos / apenas favoritos).
  void toggleFilter() {
    _state = _state.copyWith(showFavoritesOnly: !_state.showFavoritesOnly);
    notifyListeners();
  }
}
