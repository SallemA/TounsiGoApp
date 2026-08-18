import 'phrase.dart';

class Lesson {
  const Lesson({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.emoji,
    required this.phrases,
  });

  final String id;
  final String title;
  final String subtitle;
  final String emoji;
  final List<Phrase> phrases;
}
