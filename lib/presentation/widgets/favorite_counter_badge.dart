// presentation/widgets/favorite_counter_badge.dart
//
// Badge exibido na AppBar mostrando quantos produtos estão favoritados.
// Desafio opcional: contador de produtos favoritos.

import 'package:flutter/material.dart';

class FavoriteCounterBadge extends StatelessWidget {
  final int count;
  final bool filterActive;
  final VoidCallback onToggleFilter;

  const FavoriteCounterBadge({
    super.key,
    required this.count,
    required this.filterActive,
    required this.onToggleFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
          tooltip: filterActive ? 'Mostrar todos' : 'Mostrar favoritos',
          icon: Icon(
            filterActive ? Icons.filter_alt_rounded : Icons.filter_alt_outlined,
          ),
          onPressed: onToggleFilter,
        ),
        if (count > 0)
          Positioned(
            right: 6,
            top: 6,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.red.shade400,
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
              child: Text(
                '$count',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
