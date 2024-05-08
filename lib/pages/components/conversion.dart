class Conversion {
  Conversion(
      {required this.conversionTo,
      required this.conversionFrom,
      this.name});
  String? name;
  double Function(double a) conversionTo;
  double Function(double a) conversionFrom;
}

List<String> Names(Map<String, Conversion> conversion) {
  List<String> names = [];
  conversion.forEach((key, value) {
    names.add(key);
  });

  return names;
}
