import 'package:flutter/material.dart';
import '../app_theme.dart';

class DoaPage extends StatelessWidget {
  const DoaPage({super.key});

  // Dummy data doa
  final List<Map<String, String>> doaList = const [
    {
      "title": "Doa Sebelum Tidur",
      "arabic": "بِاسْمِكَ اللّٰهُمَّ أَحْيَا وَبِاسْمِكَ أَمُوْتُ",
      "latin": "Bismika Allahumma ahya wa bismika amut",
      "translation": "Dengan nama-Mu ya Allah aku hidup dan dengan nama-Mu aku mati."
    },
    {
      "title": "Doa Bangun Tidur",
      "arabic": "الْـحَمْـدُ لِلّٰهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ",
      "latin": "Alhamdu lillahil ladzi ahyana ba'da ma amatana wa ilaihin-nusyur",
      "translation": "Segala puji bagi Allah yang telah menghidupkan kami setelah mematikan kami, dan kepada-Nya kami akan kembali."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text("Kumpulan Doa"),
        backgroundColor: AppTheme.purple,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: doaList.length,
        itemBuilder: (context, index) {
          final doa = doaList[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doa["title"]!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  doa["arabic"]!,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'ScheherazadeNew',
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  doa["latin"]!,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  doa["translation"]!,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
