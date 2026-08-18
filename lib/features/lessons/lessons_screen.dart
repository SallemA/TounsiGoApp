import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/tounsi_pattern.dart';
import '../../data/repositories/lesson_repository.dart';
import 'lesson_detail_screen.dart';

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const plannedLessons = [
      ('🙋', 'Kennenlernen', '8 Lektionen', 0.0),
      ('☕', 'Essen & Trinken', '10 Lektionen', 0.0),
      ('123', 'Zahlen', '6 Lektionen', 0.0),
      ('👨‍👩‍👧', 'Familie', '6 Lektionen', 0.0),
      ('🏠', 'Alltag', '9 Lektionen', 0.0),
    ];

    final greetingLesson = LessonRepository.greetingLesson;

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
      children: [
        const TounsiPattern(height: 34),
        const SizedBox(height: 8),
        Text('Lernen', style: Theme.of(context).textTheme.headlineLarge),
        const SizedBox(height: 6),
        Text(
          'Lerne Tounsi Schritt für Schritt mit echten Alltagssätzen.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 22),
        _LessonCard(
          icon: greetingLesson.emoji,
          title: greetingLesson.title,
          subtitle: '${greetingLesson.phrases.length} Ausdrücke',
          progress: 0.0,
          isAvailable: true,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => LessonDetailScreen(lesson: greetingLesson),
              ),
            );
          },
        ),
        const SizedBox(height: 12),
        for (final lesson in plannedLessons) ...[
          _LessonCard(
            icon: lesson.$1,
            title: lesson.$2,
            subtitle: lesson.$3,
            progress: lesson.$4,
            isAvailable: false,
          ),
          const SizedBox(height: 12),
        ],
      ],
    );
  }
}

class _LessonCard extends StatelessWidget {
  const _LessonCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.progress,
    required this.isAvailable,
    this.onTap,
  });

  final String icon;
  final String title;
  final String subtitle;
  final double progress;
  final bool isAvailable;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isAvailable ? 1 : 0.62,
      child: Card(
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          leading: Container(
            width: 52,
            height: 52,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFF3E8D5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(icon, style: const TextStyle(fontSize: 26)),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              color: AppColors.ink,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(isAvailable ? subtitle : '$subtitle · demnächst'),
          ),
          trailing: Icon(
            isAvailable
                ? Icons.chevron_right_rounded
                : Icons.lock_outline_rounded,
          ),
          onTap: isAvailable ? onTap : null,
        ),
      ),
    );
  }
}
