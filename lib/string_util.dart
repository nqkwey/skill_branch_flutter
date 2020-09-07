extension MyString on String {
  String capitalize() => this[0].toUpperCase() + this.substring(1).toLowerCase();

  bool isEmptyOrNull() => this == null || this.isEmpty;
}
