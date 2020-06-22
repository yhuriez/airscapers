


List<D> mapTypedList<D>(dynamic value, D Function(dynamic) transform) {
  if(value == null) return [];

  return (value as List)
      .map(transform)
      .toList();
}