import 'package:flutter/material.dart';
import '../../core/widgets/tounsi_pattern.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
      children: [
        const TounsiPattern(height: 34),
        const SizedBox(height: 8),
        Text('Einstellungen',
            style: Theme.of(context).textTheme.headlineLarge),
        const SizedBox(height: 22),
        const _Tile(Icons.language_rounded, 'Deine Sprache', 'Deutsch'),
        const _Tile(Icons.palette_outlined, 'Design', 'Hell'),
        const _Tile(Icons.schedule_rounded, 'Tägliches Ziel', '10 Minuten'),
        const _Tile(Icons.notifications_none_rounded, 'Benachrichtigungen', 'Aus'),
        const SizedBox(height: 18),
        const _Tile(Icons.info_outline_rounded, 'Über TounsiGo', null),
        const _Tile(Icons.lock_outline_rounded, 'Datenschutz', null),
      ],
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile(this.icon, this.title, this.value);
  final IconData icon;
  final String title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (value != null) Text(value!),
            const SizedBox(width: 6),
            const Icon(Icons.chevron_right_rounded),
          ],
        ),
      ),
    );
  }
}
