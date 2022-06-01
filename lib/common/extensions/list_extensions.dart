


import 'dart:math';

extension ListExtension<T> on List<T> {

  List<List<T>> partition(int itemPerPart) {
    List<List<T>> result = [];

    for(int index = 0; index < (length / itemPerPart) + 1; index++) {
      result.add(sublist(index * itemPerPart, min((index + 1) * itemPerPart, length)));
    }

    return result;
  }
}