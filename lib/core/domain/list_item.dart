sealed class ListItem {}

class HeaderItem extends ListItem {}

class ContentItem<T> extends ListItem {
  final T content;

  ContentItem(this.content);
}

class LoadingItem extends ListItem {}

class ErrorItem extends ListItem {
  final String message;

  ErrorItem(this.message);
}

class EmptyItem extends ListItem {}
