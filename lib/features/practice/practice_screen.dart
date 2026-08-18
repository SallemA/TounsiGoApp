import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/tounsi_pattern.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
      children: [
        const TounsiPattern(height: 34),
        const SizedBox(height: 8),
        Text('Üben', style: Theme.of(context).textTheme.headlineLarge),
        const SizedBox(height: 22),
        const _PracticeCard(
          Icons.headphones_rounded,
          'Hörverständnis',
          'Höre Tounsi und wähle die richtige Bedeutung.',
        ),
        const SizedBox(height: 14),
        const _PracticeCard(
          Icons.mic_rounded,
          'Aussprache',
          'Sprich nach und trainiere echte Alltagssätze.',
        ),
        const SizedBox(height: 14),
        const _PracticeCard(
          Icons.style_rounded,
          'Karteikarten',
          'Wiederhole Wörter und Sätze in deinem Tempo.',
        ),
      ],
    );
  }
}

class _PracticeCard extends StatelessWidget {
  const _PracticeCard(this.icon, this.title, this.text);
  final IconData icon;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                color: const Color(0xFFE4ECE6),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(icon, color: AppColors.olive),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 6),
                  Text(text),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.olive,
                    ),
                    child: const Text('Starten'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
