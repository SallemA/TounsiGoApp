import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/tounsi_pattern.dart';

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const lessons = [
      ('👋', 'Begrüßung', '7 Lektionen', 0.55),
      ('🙋', 'Kennenlernen', '8 Lektionen', 0.28),
      ('☕', 'Essen & Trinken', '10 Lektionen', 0.10),
      ('123', 'Zahlen', '6 Lektionen', 0.05),
      ('👨‍👩‍👧', 'Familie', '6 Lektionen', 0.0),
      ('🏠', 'Alltag', '9 Lektionen', 0.0),
    ];

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
      children: [
        const TounsiPattern(height: 34),
        const SizedBox(height: 8),
        Text('Lernen', style: Theme.of(context).textTheme.headlineLarge),
        const SizedBox(height: 22),
        for (final lesson in lessons) ...[
          Card(
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
                child: Text(lesson.$1, style: const TextStyle(fontSize: 26)),
              ),
              title: Text(
                lesson.$2,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  color: AppColors.ink,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(lesson.$3),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: LinearProgressIndicator(
                        value: lesson.$4,
                        minHeight: 6,
                        backgroundColor: const Color(0xFFF0E3CF),
                        color: AppColors.olive,
                      ),
                    ),
                  ],
                ),
              ),
              trailing: const Icon(Icons.chevron_right_rounded),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ],
    );
  }
}
