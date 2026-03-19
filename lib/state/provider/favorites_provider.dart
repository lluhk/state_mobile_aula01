// state/provider/favorites_provider.dart
//
// Gerenciamento de favoritos com Provider.
// Mesmo padrão do CounterProvider do projeto base:
// ChangeNotifier + notifyListeners() atualiza a UI automaticamente.

import 'package:flutter/material.dart';
import '../../domain/entities/product.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<Product> _products = [
    Product(name: 'Notebook',  price: 3500.00),
    Product(name: 'Mouse',     price: 120.00),
    Product(name: 'Teclado',   price: 250.00),
    Product(name: 'Monitor',   price: 900.00),
    Product(name: 'Headset',   price: 350.00),
    Product(name: 'Webcam',    price: 280.00),
    Product(name: 'Mousepad',  price: 80.00),
    Product(name: 'Hub USB',   price: 150.00),
  ];

  bool _showFavoritesOnly = false;

  /// Sempre retorna a lista completa (usada para toggle por índice)
  List<Product> get allProducts => List.unmodifiable(_products);

  /// Retorna a lista a ser exibida conforme o filtro
  List<Product> get displayed => _showFavoritesOnly
      ? _products.where((p) => p.favorite).toList()
      : List.unmodifiable(_products);

  int get favoriteCount => _products.where((p) => p.favorite).length;
  bool get showFavoritesOnly => _showFavoritesOnly;

  void toggleFavorite(int originalIndex) {
    _products[originalIndex].favorite = !_products[originalIndex].favorite;
    notifyListeners();
  }

  void toggleFilter() {
    _showFavoritesOnly = !_showFavoritesOnly;
    notifyListeners();
  }
}
