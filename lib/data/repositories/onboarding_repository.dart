import '../models/learning_goal.dart';

abstract final class OnboardingRepository {
  static const supportedLanguages = {'de': 'Deutsch'};

  static const learningGoals = [
    LearningGoal(
      id: 'travel',
      emoji: '✈️',
      title: 'Tunesien besuchen',
      subtitle: 'Im Alltag schnell verstehen und sprechen.',
    ),
    LearningGoal(
      id: 'family',
      emoji: '❤️',
      title: 'Familie & Partner',
      subtitle: 'Mit Menschen sprechen, die mir wichtig sind.',
    ),
    LearningGoal(
      id: 'friends',
      emoji: '💬',
      title: 'Freunde & Alltag',
      subtitle: 'Locker mitreden und Gespräche verstehen.',
    ),
    LearningGoal(
      id: 'roots',
      emoji: '🇹🇳',
      title: 'Meine Wurzeln',
      subtitle: 'Tounsi und tunesische Kultur besser kennenlernen.',
    ),
  ];
}
