import 'package:flutter/material.dart';

import '../features/explore/explore_screen.dart';
import '../features/profile/profile_screen.dart';
import '../features/speak/speak_screen.dart';
import '../features/today/today_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({
    super.key,
    required this.languageCode,
    required this.learningGoal,
  });

  final String languageCode;
  final String learningGoal;

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      TodayScreen(
        languageCode: widget.languageCode,
        learningGoal: widget.learningGoal,
      ),
      const SpeakScreen(),
      const ExploreScreen(),
      ProfileScreen(
        languageCode: widget.languageCode,
        learningGoal: widget.learningGoal,
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: currentIndex, children: pages),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() => currentIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.wb_sunny_outlined),
            selectedIcon: Icon(Icons.wb_sunny_rounded),
            label: 'Heute',
          ),
          NavigationDestination(
            icon: Icon(Icons.mic_none_rounded),
            selectedIcon: Icon(Icons.mic_rounded),
            label: 'Sprechen',
          ),
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            selectedIcon: Icon(Icons.explore_rounded),
            label: 'Entdecken',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded),
            label: 'Ich',
          ),
        ],
      ),
    );
  }
}
