extension SetIterableFlatten<T> on Iterable<Set<T>> {
  /// SetのListを1つのSetにまとめる.
  Set<T> flatten() {
    final result = <T>{};
    // ignore: prefer_foreach
    for (final set in this) {
      result.addAll(set);
    }
    return result;
  }
}
