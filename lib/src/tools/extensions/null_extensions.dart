extension ValidNullString on String? {
  String get orEmptyString{
    return this ?? "";
  }
}

extension ValidNullInt on int? {
  int get orIntZero{
    return this ?? 0;
  }
}

extension ValidNullDouble on double? {
  double get orDoubleZero{
    return this ?? 0;
  }
}

extension ValidNullBoolean on bool? {
  bool get orFalse{
    return this ?? false;
  }
}
