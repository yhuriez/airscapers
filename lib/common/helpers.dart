


List<D> mapTypedList<D>(dynamic value, D Function(dynamic) transform) {
  if(value == null) return [];

  return (value as List)
      .map(transform)
      .toList();
}


String formatDuration(Duration duration) {
  return "${twoDigits(duration.inMinutes)} : ${twoDigits(duration.inSeconds.remainder(60))}";
}

String twoDigits(int n) => (n >= 10) ? "$n" : "0$n";