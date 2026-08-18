import 'package:flutter/material.dart';

import '../../core/widgets/tounsi_pattern.dart';
import '../../data/repositories/onboarding_repository.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.languageCode,
    required this.learningGoal,
  });

  final String languageCode;
  final String learningGoal;

  String get languageLabel =>
      OnboardingRepository.supportedLanguages[languageCode] ?? languageCode;

  String get goalLabel => OnboardingRepository.learningGoals
      .firstWhere((goal) => goal.id == learningGoal)
      .title;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
      children: [
        const TounsiPattern(height: 34),
        const SizedBox(height: 8),
        Text('Ich', style: Theme.of(context).textTheme.headlineLarge),
        const SizedBox(height: 24),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.language_rounded),
                title: const Text('Deine Sprache'),
                trailing: Text(languageLabel),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.flag_outlined),
                title: const Text('Dein Lernziel'),
                subtitle: Text(goalLabel),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Card(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.schedule_rounded),
                title: Text('Tägliches Ziel'),
                trailing: Text('10 Min.'),
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(Icons.notifications_none_rounded),
                title: Text('Benachrichtigungen'),
                trailing: Text('Aus'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Card(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.info_outline_rounded),
                title: Text('Über TounsiGo'),
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(Icons.lock_outline_rounded),
                title: Text('Datenschutz'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
