// presentation/pages/riverpod_favorites_page.dart
//
// Tela de favoritos com Riverpod.
// Usa ref.watch para observar o estado — mesmo padrão da RiverpodPage base.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../state/riverpod_favorites/favorites_riverpod.dart';

class RiverpodFavoritesPage extends ConsumerWidget {
  const RiverpodFavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(favoritesProvider);
    final displayed = state.displayed;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos — Riverpod'),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                tooltip: state.showFavoritesOnly
                    ? 'Mostrar todos'
                    : 'Mostrar favoritos',
                icon: Icon(state.showFavoritesOnly
                    ? Icons.filter_alt
                    : Icons.filter_alt_outlined),
                onPressed: () =>
                    ref.read(favoritesProvider.notifier).toggleFilter(),
              ),
              if (state.favoriteCount > 0)
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                    child: Text('${state.favoriteCount}',
                        style: const TextStyle(
                            color: Colors.white, fontSize: 10)),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: displayed.isEmpty
          ? const Center(child: Text('Nenhum favorito ainda.'))
          : ListView.builder(
              itemCount: displayed.length,
              itemBuilder: (context, listIndex) {
                final product = displayed[listIndex];
                final originalIndex = state.products
                    .indexWhere((p) => p.name == product.name);

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  color: product.favorite ? Colors.blue.shade50 : null,
                  child: ListTile(
                    leading: Icon(
                      product.favorite
                          ? Icons.star_rounded
                          : Icons.star_outline_rounded,
                      color: product.favorite ? Colors.amber : Colors.grey,
                    ),
                    title: Text(
                      product.name,
                      style: TextStyle(
                          fontWeight: product.favorite
                              ? FontWeight.bold
                              : FontWeight.normal),
                    ),
                    subtitle: Text(
                        'R\$ ${product.price.toStringAsFixed(2)}'),
                    trailing: IconButton(
                      icon: Icon(
                        product.favorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: product.favorite ? Colors.red : Colors.grey,
                      ),
                      onPressed: () => ref
                          .read(favoritesProvider.notifier)
                          .toggleFavorite(originalIndex),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
