import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/tounsi_pattern.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({
    super.key,
    required this.languageCode,
    required this.learningGoal,
  });

  final String languageCode;
  final String learningGoal;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
      children: [
        const TounsiPattern(height: 34),
        const SizedBox(height: 8),
        Text('Heute', style: Theme.of(context).textTheme.headlineLarge),
        const SizedBox(height: 8),
        Text(
          'Ein paar Minuten Tounsi reichen für heute.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 26),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '☕  Heute sprechen',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: AppColors.ink,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Im Café',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: AppColors.olive,
                  ),
                ),
                const SizedBox(height: 8),
                const Text('3 kurze Sätze, die du sofort benutzen kannst.'),
                const SizedBox(height: 20),
                FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.play_arrow_rounded),
                  label: const Text('Starten'),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text('Dein Rhythmus', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        const _StatRow(
          icon: Icons.local_fire_department_outlined,
          label: 'Serie',
          value: '1 Tag',
        ),
        const SizedBox(height: 10),
        const _StatRow(
          icon: Icons.schedule_rounded,
          label: 'Heute gelernt',
          value: '0 Min.',
        ),
        const SizedBox(height: 10),
        const _StatRow(
          icon: Icons.chat_bubble_outline_rounded,
          label: 'Gesprochene Sätze',
          value: '0',
        ),
      ],
    );
  }
}

class _StatRow extends StatelessWidget {
  const _StatRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: AppColors.olive),
        title: Text(label),
        trailing: Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
