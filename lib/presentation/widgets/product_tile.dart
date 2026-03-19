// presentation/widgets/product_tile.dart
//
// Widget reutilizável que representa um item da lista de produtos.
// Exibe nome, preço, destaque visual para favoritos e botão de toggle.

import 'package:flutter/material.dart';
import '../../domain/entities/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final VoidCallback onToggleFavorite;

  const ProductTile({
    super.key,
    required this.product,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
        color: product.favorite
            ? theme.colorScheme.primaryContainer.withOpacity(0.45)
            : theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: product.favorite
              ? theme.colorScheme.primary.withOpacity(0.6)
              : Colors.grey.shade200,
          width: product.favorite ? 1.5 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        // Ícone indicador de favorito à esquerda
        leading: Icon(
          product.favorite ? Icons.star_rounded : Icons.star_outline_rounded,
          color: product.favorite ? Colors.amber.shade600 : Colors.grey,
          size: 28,
        ),
        title: Text(
          product.name,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight:
                product.favorite ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        subtitle: Text(
          'R\$ ${product.price.toStringAsFixed(2)}',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        // Botão de toggle à direita
        trailing: IconButton(
          tooltip: product.favorite
              ? 'Remover dos favoritos'
              : 'Adicionar aos favoritos',
          icon: Icon(
            product.favorite
                ? Icons.favorite_rounded
                : Icons.favorite_border_rounded,
            color: product.favorite ? Colors.red.shade400 : Colors.grey,
          ),
          onPressed: onToggleFavorite,
        ),
      ),
    );
  }
}
