import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/tounsi_pattern.dart';
import '../../data/repositories/onboarding_repository.dart';

class OnboardingFlow extends StatefulWidget {
  const OnboardingFlow({super.key, required this.onFinished});

  final void Function({
    required String languageCode,
    required String learningGoal,
  })
  onFinished;

  @override
  State<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  final pageController = PageController();
  int currentPage = 0;
  String languageCode = 'de';
  String learningGoal = 'travel';

  void nextPage() {
    if (currentPage < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 260),
        curve: Curves.easeOut,
      );
    } else {
      widget.onFinished(languageCode: languageCode, learningGoal: learningGoal);
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const TounsiPattern(height: 42),
            Expanded(
              child: PageView(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (page) {
                  setState(() => currentPage = page);
                },
                children: [
                  const _WelcomePage(),
                  _LanguagePage(
                    value: languageCode,
                    onChanged: (value) {
                      setState(() => languageCode = value);
                    },
                  ),
                  _GoalPage(
                    value: learningGoal,
                    onChanged: (value) {
                      setState(() => learningGoal = value);
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 22),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 180),
                        width: currentPage == index ? 26 : 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: currentPage == index
                              ? AppColors.terracotta
                              : AppColors.sand,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: nextPage,
                      child: Text(currentPage == 2 ? 'Los geht’s' : 'Weiter'),
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

class _WelcomePage extends StatelessWidget {
  const _WelcomePage();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 104,
            height: 104,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFF6E3D7),
              borderRadius: BorderRadius.circular(34),
            ),
            child: const Text('🇹🇳', style: TextStyle(fontSize: 54)),
          ),
          const SizedBox(height: 30),
          Text(
            'TounsiGo',
            style: Theme.of(context).textTheme.headlineLarge
                ?.copyWith(fontSize: 42),
          ),
          const SizedBox(height: 14),
          Text(
            'Sprich Tounsi.\nVon Anfang an.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium
                ?.copyWith(color: AppColors.terracotta, height: 1.15),
          ),
          const SizedBox(height: 18),
          Text(
            'Keine komplizierte Grammatik. Lerne die Sprache, '
            'die du in Tunesien wirklich hörst.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}

class _LanguagePage extends StatelessWidget {
  const _LanguagePage({required this.value, required this.onChanged});

  final String value;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        const SizedBox(height: 20),
        Text('Deine Sprache', style: Theme.of(context).textTheme.headlineLarge),
        const SizedBox(height: 10),
        Text(
          'In welcher Sprache sollen Erklärungen und Übersetzungen angezeigt werden?',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 28),
        RadioGroup<String>(
          groupValue: value,
          onChanged: (newValue) {
            if (newValue != null) {
              onChanged(newValue);
            }
          },
          child: Column(
            children: [
              for (final goal in OnboardingRepository.learningGoals)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Card(
                    child: RadioListTile<String>(
                      value: goal.id,
                      title: Text(goal.title),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(goal.subtitle),
                      ),
                      secondary: Text(
                        goal.emoji,
                        style: const TextStyle(fontSize: 28),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Weitere Sprachen kommen später hinzu.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

class _GoalPage extends StatelessWidget {
  const _GoalPage({required this.value, required this.onChanged});

  final String value;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        const SizedBox(height: 12),
        Text(
          'Was möchtest du können?',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 10),
        Text(
          'Dein Ziel hilft uns später, passende Situationen vorzuschlagen.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 24),
        RadioGroup<String>(
          groupValue: value,
          onChanged: (newValue) {
            if (newValue != null) {
              onChanged(newValue);
            }
          },
          child: Column(
            children: [
              for (final goal in OnboardingRepository.learningGoals)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Card(
                    child: RadioListTile<String>(
                      value: goal.id,
                      title: Text(goal.title),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(goal.subtitle),
                      ),
                      secondary: Text(
                        goal.emoji,
                        style: const TextStyle(fontSize: 28),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
