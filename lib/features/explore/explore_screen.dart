import 'package:flutter/material.dart';

import '../../core/widgets/tounsi_pattern.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
      children: [
        const TounsiPattern(height: 34),
        const SizedBox(height: 8),
        Text('Entdecken', style: Theme.of(context).textTheme.headlineLarge),
        const SizedBox(height: 8),
        Text(
          'Wörter, Kultur und typische Situationen aus Tunesien.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 24),
        const _ExploreTile(
          emoji: '🗣️',
          title: 'Alltagswörter',
          subtitle: 'Die Wörter, die du ständig hören wirst.',
        ),
        const SizedBox(height: 12),
        const _ExploreTile(
          emoji: '🍽️',
          title: 'Essen & Trinken',
          subtitle: 'Tunisische Gerichte und wichtige Begriffe.',
        ),
        const SizedBox(height: 12),
        const _ExploreTile(
          emoji: '💬',
          title: 'Tounsi im Chat',
          subtitle: 'Später: Arabizi wie 3, 7 und 9 verstehen.',
        ),
      ],
    );
  }
}

class _ExploreTile extends StatelessWidget {
  const _ExploreTile({
    required this.emoji,
    required this.title,
    required this.subtitle,
  });

  final String emoji;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(18),
        leading: Text(emoji, style: const TextStyle(fontSize: 32)),
        title: Text(title, style: Theme.of(context).textTheme.titleMedium),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(subtitle),
        ),
        trailing: const Icon(Icons.chevron_right_rounded),
      ),
    );
  }
}
