import 'package:flutter/material.dart';

void main() {
  runApp(const TounsiGoApp());
}

class TounsiGoApp extends StatelessWidget {
  const TounsiGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TounsiGo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE63946),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final pages = const [
    HomeScreen(),
    LearnScreen(),
    PracticeScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: currentIndex,
          children: pages,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Start',
          ),
          NavigationDestination(
            icon: Icon(Icons.school_outlined),
            selectedIcon: Icon(Icons.school),
            label: 'Lernen',
          ),
          NavigationDestination(
            icon: Icon(Icons.psychology_outlined),
            selectedIcon: Icon(Icons.psychology),
            label: 'Üben',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Einstellungen',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        const SizedBox(height: 12),
        Text(
          'TounsiGo',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Tounsi hören, verstehen und sprechen.',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 32),

        Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '🇹🇳 Deine nächste Lektion',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Begrüßung & Kennenlernen',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
                FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Weiterlernen'),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 24),

        Text(
          'Dein Fortschritt',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),

        const LinearProgressIndicator(
          value: 0.10,
        ),

        const SizedBox(height: 8),
        const Text('10 % des ersten Levels'),
      ],
    );
  }
}

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text(
          'Lernen',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 24),

        const LessonTile(
          icon: '👋',
          title: 'Begrüßung',
          subtitle: 'Hallo, Tschüss, Wie geht es dir?',
        ),
        const LessonTile(
          icon: '🙋',
          title: 'Kennenlernen',
          subtitle: 'Name, Herkunft und einfache Fragen',
        ),
        const LessonTile(
          icon: '☕',
          title: 'Essen & Trinken',
          subtitle: 'Bestellen und wichtige Wörter',
        ),
        const LessonTile(
          icon: '🔢',
          title: 'Zahlen',
          subtitle: 'Die wichtigsten Zahlen im Alltag',
        ),
      ],
    );
  }
}

class LessonTile extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;

  const LessonTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Text(
          icon,
          style: const TextStyle(fontSize: 32),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.record_voice_over,
              size: 80,
            ),
            const SizedBox(height: 20),
            Text(
              'Üben',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Hier kommen später Hörübungen, Quiz und Aussprachetraining.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text(
          'Einstellungen',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 24),
        const ListTile(
          leading: Icon(Icons.language),
          title: Text('Deine Sprache'),
          subtitle: Text('Deutsch'),
          trailing: Icon(Icons.chevron_right),
        ),
        const Divider(),
        const ListTile(
          leading: Icon(Icons.dark_mode_outlined),
          title: Text('Darstellung'),
          subtitle: Text('Systemeinstellung'),
          trailing: Icon(Icons.chevron_right),
        ),
        const Divider(),
        const ListTile(
          leading: Icon(Icons.info_outline),
          title: Text('Über TounsiGo'),
          trailing: Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}