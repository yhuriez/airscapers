


import 'dart:math';

extension ListExtension<T> on List<T> {

  List<List<T>> partition(int itemPerPart) {
    List<List<T>> result = [];

    for(int index = 0; index < (length / itemPerPart) + 1; index++) {
      result.add(sublist(index * itemPerPart, min((index + 1) * itemPerPart, length)));
    }

    return result;
  }

  Map<K, V> associate<K, V>(K Function(T) keySelector, V Function(T) valueSelector) {
    return Map<K, V>.fromIterable(
      this,
      key: (item) => keySelector(item as T),
      value: (item) => valueSelector(item as T),
    );
  }

  Map<K, T> associateBy<K>(K Function(T) keySelector) {
    return Map<K, T>.fromIterable(
      this,
      key: (item) => keySelector(item as T),
      value: (item) => item as T,
    );
  }
}