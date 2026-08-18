class Phrase {
  const Phrase({
    required this.id,
    required this.tounsi,
    required this.arabic,
    required this.translations,
    this.note,
  });

  final String id;
  final String tounsi;
  final String arabic;
  final Map<String, String> translations;
  final String? note;

  String translationFor(String languageCode) {
    return translations[languageCode] ??
        translations['de'] ??
        translations.values.first;
  }
}
