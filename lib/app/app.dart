import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import '../features/onboarding/onboarding_flow.dart';
import 'main_shell.dart';

class TounsiGoApp extends StatefulWidget {
  const TounsiGoApp({super.key});

  @override
  State<TounsiGoApp> createState() => _TounsiGoAppState();
}

class _TounsiGoAppState extends State<TounsiGoApp> {
  bool onboardingCompleted = false;
  String languageCode = 'de';
  String learningGoal = 'travel';

  void finishOnboarding({
    required String languageCode,
    required String learningGoal,
  }) {
    setState(() {
      this.languageCode = languageCode;
      this.learningGoal = learningGoal;
      onboardingCompleted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TounsiGo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: onboardingCompleted
          ? MainShell(languageCode: languageCode, learningGoal: learningGoal)
          : OnboardingFlow(onFinished: finishOnboarding),
    );
  }
}
