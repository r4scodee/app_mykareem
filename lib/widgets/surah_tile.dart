import 'package:flutter/material.dart';
import '../app_theme.dart';

class SurahTile extends StatelessWidget {
  final int number;
  final String title;
  final String subtitle;
  final int ayahCount;
  final VoidCallback onTap;

  const SurahTile({
    super.key,
    required this.number,
    required this.title,
    required this.subtitle,
    required this.ayahCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: AppTheme.purple.withOpacity(0.2),
        child: Text(
          number.toString(),
          style: const TextStyle(color: AppTheme.purple, fontWeight: FontWeight.bold),
        ),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle),
      trailing: Text(
        "$ayahCount ayat",
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
    );
  }
}
