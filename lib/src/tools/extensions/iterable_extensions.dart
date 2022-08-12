extension IterableExtensions<T> on Iterable<T>? {
  /// Returns `true` if this nullable iterable is either `null` or empty.
  bool isNullOrEmpty() {
    return this == null || this!.isEmpty;
  }

  /// Returns `false` if this nullable iterable is either `null` or empty.
  bool isNotNullOrEmpty() {
    return this != null && this!.isNotEmpty;
  }
  /// Returns count of elements that matches the given [predicate].
  /// Returns -1 if iterable is null
  int countWhere(bool predicate(T element)) {
    if (this == null) return -1;
    return this!.where(predicate).length;
  }
  // Convert iterable to set
  Set<T> toSet() => Set.from(this!);

  /// Returns a list containing all elements that are not null
  List<T> filterNotNull() {
    if (this == null) return <T>[];
    final result = <T>[];
    this!.forEach((e) {
      if (e != null) {
        result.add(e);
      }
    });
    return result;
  }
  /// Returns a list containing first [n] elements.
  List<T> take(int n) {
    if (this == null) return <T>[];
    if (n <= 0) return [];

    var list = <T>[];
    if (this is Iterable) {
      if (n >= this!.length) return this!.toList();

      var count = 0;
      var thisList = this!.toList();
      for (var item in thisList) {
        list.add(item);
        if (++count == n) break;
      }
    }
    return list;
  }

  /// Returns first element or null otherwise
  T? get firstOrNull => this.isNullOrEmpty() ? null : this!.first;

  /// Returns first element by given predicate or null otherwise
  T? firstWhereOrNull(bool Function(T element) test) {
    if (this == null) return null;
    final list = this!.where(test);
    return list.isEmpty ? null : list.first;
  }
}