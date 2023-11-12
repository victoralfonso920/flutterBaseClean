
extension ValidNullString on String? {
  String get orEmptyString{
   return this ?? "";
  }
}

extension StringExtensions on String {
  bool get isNullOrEmpty {
    bool hasSpace = RegExp(r'\s').hasMatch(this);
    return isEmpty || hasSpace;
  }
}