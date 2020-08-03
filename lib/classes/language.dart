class Language {
  final int id;
  final String name;
  final String flag;
  final String languageCode;

  Language(this.id, this.name, this.flag, this.languageCode);

  static List<Language> langugeList = [
    Language(1, '🇺🇸', 'English', 'en'),
    Language(2, '🇻🇳', 'Việt nam', 'vi'),
    Language(3, '🇰🇷', '한국', 'ko'),
    Language(4, '🇯🇵', 'みんな', 'ja'),
  ];
}
