import '../models/lesson.dart';
import '../models/phrase.dart';

abstract final class LessonRepository {
  static const greetingLesson = Lesson(
    id: 'greetings_001',
    title: 'Begrüßung',
    subtitle: 'Hallo sagen und einfache Antworten verstehen',
    emoji: '👋',
    phrases: [
      Phrase(
        id: 'greeting_aslema',
        tounsi: 'Aslema',
        arabic: 'عسلامة',
        translations: {'de': 'Hallo'},
        note: 'Eine sehr typische tunesische Begrüßung.',
      ),
      Phrase(
        id: 'greeting_bslama',
        tounsi: 'Bslama',
        arabic: 'بسلامة',
        translations: {'de': 'Tschüss'},
        note: 'Wird beim Verabschieden verwendet.',
      ),
      Phrase(
        id: 'greeting_chna7welek',
        tounsi: 'Chnahwelek?',
        arabic: 'شنوة حوالك؟',
        translations: {'de': 'Wie geht es dir?'},
        note: 'Alltägliche, lockere Frage.',
      ),
      Phrase(
        id: 'greeting_labes',
        tounsi: 'Labes',
        arabic: 'لاباس',
        translations: {'de': 'Gut / Alles okay'},
        note: 'Sehr häufige Antwort im Alltag.',
      ),
      Phrase(
        id: 'greeting_aychek',
        tounsi: 'Aychek',
        arabic: 'عايشك',
        translations: {'de': 'Danke'},
        note: 'Sehr typisch im tunesischen Alltag.',
      ),
      Phrase(
        id: 'greeting_ey',
        tounsi: 'Ey',
        arabic: 'إي',
        translations: {'de': 'Ja'},
      ),
      Phrase(
        id: 'greeting_le',
        tounsi: 'Lé',
        arabic: 'لا',
        translations: {'de': 'Nein'},
      ),
    ],
  );

  static const lessons = [greetingLesson];
}
