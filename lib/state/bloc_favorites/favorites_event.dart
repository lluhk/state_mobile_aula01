// state/bloc_favorites/favorites_event.dart
// Eventos do BLoC de favoritos — mesmo padrão do CounterEvent do projeto base.

abstract class FavoritesEvent {}

// Disparado quando o usuário clica no botão de favorito
class ToggleFavoriteEvent extends FavoritesEvent {
  final int index;
  ToggleFavoriteEvent(this.index);
}

// Desafio opcional: filtro
class ToggleFilterEvent extends FavoritesEvent {}
