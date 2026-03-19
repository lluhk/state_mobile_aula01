// domain/entities/product.dart
// Modelo de produto conforme o enunciado da Atividade 05.

class Product {
  final String name;
  final double price;
  bool favorite;

  Product({
    required this.name,
    required this.price,
    this.favorite = false,
  });
}
