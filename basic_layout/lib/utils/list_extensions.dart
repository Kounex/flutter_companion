extension ListStuff<E> on List<E> {
  Iterable<T> mapIndexed<T>(T f(E element, int index)) sync* {
    var index = 0;

    for (final item in this) {
      yield f(item, index);
      index = index + 1;
    }
  }
}
