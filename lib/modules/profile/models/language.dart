class Language {
  final String nameCountry;
  final String imgCountry;
  bool isPicked;
  bool isMain;

  Language({
    required this.nameCountry,
    required this.imgCountry,
    this.isMain = false,
    this.isPicked = false,
  });
}
