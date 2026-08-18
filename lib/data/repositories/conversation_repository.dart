import '../models/phrase.dart';

abstract final class ConversationRepository {
  static const cafeConversation = [
    Phrase(
      id: 'cafe_hello',
      tounsi: 'Aslema',
      arabic: 'عسلامة',
      translations: {'de': 'Hallo'},
    ),
    Phrase(
      id: 'cafe_order',
      tounsi: 'Nheb café, aychek.',
      arabic: 'نحب قهوة، عايشك.',
      translations: {'de': 'Ich möchte einen Kaffee, bitte.'},
    ),
    Phrase(
      id: 'cafe_thanks',
      tounsi: 'Aychek',
      arabic: 'عايشك',
      translations: {'de': 'Danke'},
    ),
  ];
}
