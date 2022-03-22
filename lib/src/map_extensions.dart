extension MapFirstWhere<K, V> on Map<K, V> {
  /// [test] 関数がtrueを最初に返却したEntryを返却する.
  MapEntry<K, V>? firstWhere(bool Function(MapEntry<K, V> entry) test) {
    for (final kv in entries) {
      if (test(kv)) {
        return kv;
      }
    }
    return null;
  }
}

extension MapWhere<K, V> on Map<K, V> {
  /// [test] 関数がtrueを返却した [MapEntry<K, V>] をすべて返却する.
  Iterable<MapEntry<K, V>> where(bool Function(MapEntry<K, V> entry) test) {
    return entries.where(test);
  }
}
