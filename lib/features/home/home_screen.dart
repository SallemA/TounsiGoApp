import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/tounsi_pattern.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
      children: [
        const TounsiPattern(height: 34),
        const SizedBox(height: 6),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TounsiGo',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontSize: 34),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Tounsi hören, verstehen und sprechen.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              style: IconButton.styleFrom(
                backgroundColor: AppColors.card,
                side: const BorderSide(color: AppColors.border),
              ),
              icon: const Icon(Icons.dark_mode_outlined),
            ),
          ],
        ),
        const SizedBox(height: 28),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('🇹🇳', style: TextStyle(fontSize: 22)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Deine nächste Lektion',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  'Begrüßung & Kennenlernen',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 17),
                ),
                const SizedBox(height: 22),
                FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.play_arrow_rounded),
                  label: const Text('Weiterlernen'),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 28),
        Text('Dein Fortschritt', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 14),
        const ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          child: LinearProgressIndicator(
            value: 0.10,
            minHeight: 9,
            backgroundColor: Color(0xFFF1E1C9),
            color: AppColors.olive,
          ),
        ),
        const SizedBox(height: 8),
        Text('10 % des ersten Levels',
            style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 30),
        Row(
          children: [
            Expanded(
              child:
                  Text('Lektionen', style: Theme.of(context).textTheme.titleLarge),
            ),
            TextButton(onPressed: () {}, child: const Text('Alle anzeigen')),
          ],
        ),
        const SizedBox(height: 12),
        const Row(
          children: [
            Expanded(child: _CategoryCard('👋', 'Begrüßung', Color(0xFFF0E9D7))),
            SizedBox(width: 10),
            Expanded(child: _CategoryCard('🙋', 'Kennenlernen', Color(0xFFF8E2D6))),
            SizedBox(width: 10),
            Expanded(child: _CategoryCard('☕', 'Essen', Color(0xFFF5E8CB))),
            SizedBox(width: 10),
            Expanded(child: _CategoryCard('123', 'Zahlen', Color(0xFFE2ECE6))),
          ],
        ),
        const SizedBox(height: 26),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const Text(
                  'عسلامة',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                    color: AppColors.olive,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Aslema',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: AppColors.terracotta,
                  ),
                ),
                const SizedBox(height: 4),
                Text('Hallo', style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: 18),
                IconButton.filledTonal(
                  onPressed: () {},
                  icon: const Icon(Icons.volume_up_rounded),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 18),
        const TounsiPattern(height: 32),
      ],
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard(this.emoji, this.title, this.tint);
  final String emoji;
  final String title;
  final Color tint;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      padding: const EdgeInsets.all(10),
      decoration:
          BoxDecoration(color: tint, borderRadius: BorderRadius.circular(18)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 28)),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              color: AppColors.ink,
            ),
          ),
        ],
      ),
    );
  }
}
