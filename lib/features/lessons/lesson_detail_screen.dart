import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/tounsi_pattern.dart';
import '../../data/models/lesson.dart';
import '../../data/models/phrase.dart';

class LessonDetailScreen extends StatefulWidget {
  const LessonDetailScreen({super.key, required this.lesson});

  final Lesson lesson;

  @override
  State<LessonDetailScreen> createState() => _LessonDetailScreenState();
}

class _LessonDetailScreenState extends State<LessonDetailScreen> {
  int currentIndex = 0;

  Phrase get currentPhrase => widget.lesson.phrases[currentIndex];

  bool get isFirst => currentIndex == 0;
  bool get isLast => currentIndex == widget.lesson.phrases.length - 1;

  void goBack() {
    if (!isFirst) {
      setState(() => currentIndex--);
    }
  }

  void goNext() {
    if (!isLast) {
      setState(() => currentIndex++);
    } else {
      _showFinishedDialog();
    }
  }

  Future<void> _showFinishedDialog() async {
    await showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Sehr gut!'),
          content: const Text(
            'Du hast die erste Begrüßungslektion abgeschlossen.',
          ),
          actions: [
            FilledButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text('Zurück zu Lernen'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final phrase = currentPhrase;
    final progress = (currentIndex + 1) / widget.lesson.phrases.length;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lesson.title),
        backgroundColor: AppColors.cream,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const TounsiPattern(height: 28),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
              child: Row(
                children: [
                  Expanded(
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
                  const SizedBox(width: 12),
                  Text(
                    '${currentIndex + 1}/${widget.lesson.phrases.length}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      color: AppColors.olive,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 220),
                transitionBuilder: (child, animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: _PhraseCard(key: ValueKey(phrase.id), phrase: phrase),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: isFirst ? null : goBack,
                      icon: const Icon(Icons.arrow_back_rounded),
                      label: const Text('Zurück'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: goNext,
                      icon: Icon(
                        isLast
                            ? Icons.check_rounded
                            : Icons.arrow_forward_rounded,
                      ),
                      label: Text(isLast ? 'Fertig' : 'Weiter'),
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

class _PhraseCard extends StatelessWidget {
  const _PhraseCard({super.key, required this.phrase});

  final Phrase phrase;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 6),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('🇹🇳', style: TextStyle(fontSize: 30)),
              const SizedBox(height: 24),
              Text(
                phrase.arabic,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.w700,
                  color: AppColors.olive,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                phrase.tounsi,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: AppColors.terracotta,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                phrase.translationFor('de'),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium
                    ?.copyWith(color: AppColors.ink, fontSize: 24),
              ),
              if (phrase.note != null) ...[
                const SizedBox(height: 18),
                Text(
                  phrase.note!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
              const SizedBox(height: 30),
              IconButton.filledTonal(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Audio für "${phrase.tounsi}" kommt im nächsten Schritt.',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.volume_up_rounded),
                iconSize: 30,
                tooltip: 'Anhören',
              ),
              const SizedBox(height: 8),
              Text('Anhören', style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}
