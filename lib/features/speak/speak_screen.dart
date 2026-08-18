import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/tounsi_pattern.dart';
import '../../data/repositories/conversation_repository.dart';

class SpeakScreen extends StatelessWidget {
  const SpeakScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
      children: [
        const TounsiPattern(height: 34),
        const SizedBox(height: 8),
        Text('Sprechen', style: Theme.of(context).textTheme.headlineLarge),
        const SizedBox(height: 8),
        Text(
          'Lerne ganze Sätze für echte Situationen.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 24),
        _ConversationCard(
          emoji: '☕',
          title: 'Im Café',
          subtitle: 'Bestellen, bedanken und freundlich sprechen',
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const ConversationScreen()),
            );
          },
        ),
        const SizedBox(height: 12),
        const _ConversationCard(
          emoji: '🚕',
          title: 'Im Taxi',
          subtitle: 'Ziel sagen und einfache Fragen verstehen',
        ),
        const SizedBox(height: 12),
        const _ConversationCard(
          emoji: '🛍️',
          title: 'Einkaufen',
          subtitle: 'Fragen, Preise verstehen und reagieren',
        ),
      ],
    );
  }
}

class _ConversationCard extends StatelessWidget {
  const _ConversationCard({
    required this.emoji,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  final String emoji;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(18),
        leading: Text(emoji, style: const TextStyle(fontSize: 34)),
        title: Text(title, style: Theme.of(context).textTheme.titleMedium),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(subtitle),
        ),
        trailing: Icon(
          onTap != null
              ? Icons.chevron_right_rounded
              : Icons.lock_outline_rounded,
        ),
        onTap: onTap,
      ),
    );
  }
}

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({super.key});

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final phrases = ConversationRepository.cafeConversation;
    final phrase = phrases[currentIndex];
    final progress = (currentIndex + 1) / phrases.length;
    final isLast = currentIndex == phrases.length - 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Im Café'),
        backgroundColor: AppColors.cream,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const TounsiPattern(height: 28),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 9,
                  backgroundColor: const Color(0xFFF0E3CF),
                  color: AppColors.olive,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '🎧 Hör zu',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: AppColors.mutedInk,
                          ),
                        ),
                        const SizedBox(height: 26),
                        Text(
                          phrase.arabic,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            color: AppColors.olive,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          phrase.tounsi,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: AppColors.terracotta,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          phrase.translationFor('de'),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontSize: 22),
                        ),
                        const SizedBox(height: 28),
                        Wrap(
                          spacing: 12,
                          children: [
                            IconButton.filledTonal(
                              onPressed: () {},
                              icon: const Icon(Icons.volume_up_rounded),
                              tooltip: 'Anhören',
                            ),
                            IconButton.filled(
                              onPressed: () {},
                              icon: const Icon(Icons.mic_rounded),
                              tooltip: 'Nachsprechen',
                              style: IconButton.styleFrom(
                                backgroundColor: AppColors.olive,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Audio und Mikrofon sind in dieser Version noch Platzhalter.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.mutedInk,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: currentIndex == 0
                          ? null
                          : () => setState(() => currentIndex--),
                      child: const Text('Zurück'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton(
                      onPressed: () {
                        if (isLast) {
                          Navigator.of(context).pop();
                        } else {
                          setState(() => currentIndex++);
                        }
                      },
                      child: Text(isLast ? 'Fertig' : 'Weiter'),
                    ),
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
