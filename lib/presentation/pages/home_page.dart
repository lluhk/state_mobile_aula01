// presentation/pages/home_page.dart
//
// Tela inicial — mantém as três demos originais do projeto base
// e adiciona as três novas telas de favoritos (Atividade 05).

import 'package:flutter/material.dart';
import 'provider_page.dart';
import 'riverpod_page.dart';
import 'bloc_page.dart';
import 'provider_favorites_page.dart';
import 'riverpod_favorites_page.dart';
import 'bloc_favorites_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('State Management')),
      body: ListView(
        children: [
          // ── Exemplos originais do projeto base ──────────────────────
          const _SectionHeader(title: 'Exemplos originais (contador)'),
          _NavTile(
            title: 'Provider — Contador',
            icon: Icons.add_circle_outline,
            color: Colors.blue,
            destination: const ProviderPage(),
          ),
          _NavTile(
            title: 'Riverpod — Contador',
            icon: Icons.add_circle_outline,
            color: Colors.purple,
            destination: const RiverpodPage(),
          ),
          _NavTile(
            title: 'BLoC — Contador',
            icon: Icons.add_circle_outline,
            color: Colors.teal,
            destination: const BlocPage(),
          ),

          const Divider(height: 32),

          // ── Atividade 05: sistema de favoritos ───────────────────────
          const _SectionHeader(title: 'Atividade 05 — Favoritos'),
          _NavTile(
            title: 'Provider — Favoritos',
            icon: Icons.favorite_border,
            color: Colors.orange,
            destination: const ProviderFavoritesPage(),
          ),
          _NavTile(
            title: 'Riverpod — Favoritos',
            icon: Icons.favorite_border,
            color: Colors.deepPurple,
            destination: const RiverpodFavoritesPage(),
          ),
          _NavTile(
            title: 'BLoC — Favoritos',
            icon: Icons.favorite_border,
            color: Colors.green,
            destination: const BlocFavoritesPage(),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: Colors.grey),
      ),
    );
  }
}

class _NavTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Widget destination;

  const _NavTile({
    required this.title,
    required this.icon,
    required this.color,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.15),
        child: Icon(icon, color: color, size: 20),
      ),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => destination),
      ),
    );
  }
}
