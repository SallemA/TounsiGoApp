import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/tounsi_pattern.dart';
import '../../data/repositories/lesson_repository.dart';
import '../lessons/lesson_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final greetingLesson = LessonRepository.greetingLesson;

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
      children: [
        const TounsiPattern(height: 34),
        const SizedBox(height: 6),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TounsiGo',
                    style: Theme.of(context).textTheme.headlineLarge
                        ?.copyWith(fontSize: 34),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Tounsi hören, verstehen und sprechen.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              style: IconButton.styleFrom(
                backgroundColor: AppColors.card,
                side: const BorderSide(color: AppColors.border),
              ),
              icon: const Icon(Icons.dark_mode_outlined),
            ),
          ],
        ),
        const SizedBox(height: 28),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('🇹🇳', style: TextStyle(fontSize: 22)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Deine erste Lektion',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  'Begrüßung',
                  style: Theme.of(context).textTheme.bodyLarge
                      ?.copyWith(fontSize: 17),
                ),
                const SizedBox(height: 4),
                Text(
                  '${greetingLesson.phrases.length} wichtige Ausdrücke',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 22),
                FilledButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) =>
                            LessonDetailScreen(lesson: greetingLesson),
                      ),
                    );
                  },
                  icon: const Icon(Icons.play_arrow_rounded),
                  label: const Text('Lektion starten'),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 28),
        Text('So lernst du', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 14),
        const _LearningStep(
          icon: Icons.visibility_rounded,
          title: 'Sehen',
          text: 'Tounsi, arabische Schrift und Bedeutung zusammen.',
        ),
        const SizedBox(height: 10),
        const _LearningStep(
          icon: Icons.volume_up_rounded,
          title: 'Hören',
          text: 'Im nächsten Schritt ergänzen wir echtes Audio.',
        ),
        const SizedBox(height: 10),
        const _LearningStep(
          icon: Icons.repeat_rounded,
          title: 'Wiederholen',
          text: 'Kurze Lektionen ohne komplizierte Grammatik.',
        ),
        const SizedBox(height: 28),
        const TounsiPattern(height: 32),
      ],
    );
  }
}

class _LearningStep extends StatelessWidget {
  const _LearningStep({
    required this.icon,
    required this.title,
    required this.text,
  });

  final IconData icon;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFE6EEE9),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: AppColors.olive),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text(text),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
