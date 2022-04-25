extension ListExtensions<T> on List<T> {
  T? get firstOrNull => isEmpty ? null : first;
}

extension IterableExtensions<E> on Iterable<E?> {
  List<E> sorted(int Function(E a, E b) compare) => List<E>.from(this)..sort(compare);

  E? firstOrNullWhere(bool Function(E?) test) => firstWhere(test, orElse: () => null);
}
