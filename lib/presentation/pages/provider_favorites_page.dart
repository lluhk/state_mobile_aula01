// presentation/pages/provider_favorites_page.dart
//
// Tela de favoritos com Provider.
// Observa o estado via context.watch — mesmo padrão da ProviderPage base.
// A interface é reconstruída automaticamente a cada notifyListeners().

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../state/provider/favorites_provider.dart';

class ProviderFavoritesPage extends StatelessWidget {
  const ProviderFavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = context.watch<FavoritesProvider>();
    final displayed = prov.displayed;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos — Provider'),
        actions: [
          // Desafio opcional: contador de favoritos + botão de filtro
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                tooltip: prov.showFavoritesOnly
                    ? 'Mostrar todos'
                    : 'Mostrar favoritos',
                icon: Icon(prov.showFavoritesOnly
                    ? Icons.filter_alt
                    : Icons.filter_alt_outlined),
                onPressed: () =>
                    context.read<FavoritesProvider>().toggleFilter(),
              ),
              if (prov.favoriteCount > 0)
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                    child: Text('${prov.favoriteCount}',
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
                // Busca o índice real na lista completa para o toggle
                final originalIndex = prov.allProducts
                    .indexWhere((p) => p.name == product.name);

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  // Desafio opcional: destaque visual para favoritos
                  color: product.favorite ? Colors.amber.shade50 : null,
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
                      onPressed: () => context
                          .read<FavoritesProvider>()
                          .toggleFavorite(originalIndex),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
