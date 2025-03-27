part of 'articles_bloc.dart';

sealed class ArticlesEvent {
  // Рецензенту: держим все события, доступные для внешнего пользователя BLoC,
  // в конструкторах основного класса. В IDE можно будет ввести "ArticlesEvent.",
  // и автодополнение покажет все доступные варианты.

  // Конструкторы событий специально не константные, чтобы в местах вызова
  // было меньше кода: нет необходимости каждый раз писать const и ругаться
  // с линтером, если const не написан.
  factory ArticlesEvent.dataUpdateRequested() = _DataUpdateRequested;
}

class _DataUpdateRequested implements ArticlesEvent {}

class _RetrievalDateVisibilityCheckRequested implements ArticlesEvent {}
