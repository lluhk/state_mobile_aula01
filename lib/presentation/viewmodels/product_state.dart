// presentation/viewmodels/product_state.dart
//
// Representa o estado imutável da tela de produtos.
// Padrão copyWith conforme o material de aula (Arquitetura - Aula 2, Código 2).

import '../../domain/entities/product.dart';

class ProductState {
  final List<Product> products;
  final bool showFavoritesOnly;

  const ProductState({
    this.products = const [],
    this.showFavoritesOnly = false,
  });

  /// Retorna apenas os produtos a serem exibidos conforme o filtro ativo.
  List<Product> get displayedProducts =>
      showFavoritesOnly
          ? products.where((p) => p.favorite).toList()
          : List.unmodifiable(products);

  /// Quantidade de produtos marcados como favorito.
  int get favoriteCount => products.where((p) => p.favorite).length;

  ProductState copyWith({
    List<Product>? products,
    bool? showFavoritesOnly,
  }) {
    return ProductState(
      products: products ?? this.products,
      showFavoritesOnly: showFavoritesOnly ?? this.showFavoritesOnly,
    );
  }
}
