import 'package:flutter/material.dart';
import '../../core/api_service.dart';
import '../../core/models/surah.dart';
import '../../app_theme.dart';

class SurahDetailPage extends StatefulWidget {
  final int surahNumber;

  const SurahDetailPage({super.key, required this.surahNumber});

  @override
  State<SurahDetailPage> createState() => _SurahDetailPageState();
}

class _SurahDetailPageState extends State<SurahDetailPage> {
  final ApiService api = ApiService();
  late Future<Surah> futureSurah;

  @override
  void initState() {
    super.initState();
    futureSurah = api.fetchSurahDetail(widget.surahNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text("Detail Surah"),
        backgroundColor: AppTheme.purple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: FutureBuilder<Surah>(
        future: futureSurah,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Gagal memuat detail surah:\n${snapshot.error}",
                textAlign: TextAlign.center,
              ),
            );
          }

          if (!snapshot.hasData) {
            return const Center(child: Text("Data tidak ditemukan"));
          }

          final surah = snapshot.data!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: AppTheme.purple,
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      surah.name,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "${surah.translation} • ${surah.revelation}",
                      style: const TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${surah.numberOfVerses} ayat",
                      style:
                          const TextStyle(color: Colors.white60, fontSize: 12),
                    ),
                  ],
                ),
              ),

              // Daftar ayat
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: surah.verses.length ?? 0,
                  itemBuilder: (context, index) {
                    final ayat = surah.verses[index];

                    // API Quran Gading
                    final arab = ayat['text']?['arab'] ?? '';
                    final arti = ayat['translation']?['id'] ?? '';
                    final nomor = ayat['number']?['inSurah'] ?? index + 1;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Ayat Arab
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              arab,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontSize: 28,
                                fontFamily: 'Scheherazade',
                                height: 1.6,
                              ),
                            ),
                          ),

                          const SizedBox(height: 6),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Nomor ayat
                              Container(
                                width: 28,
                                height: 28,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppTheme.purple.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  nomor.toString(),
                                  style: const TextStyle(
                                    color: AppTheme.purple,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              const SizedBox(width: 10),

                              // Arti ayat
                              Expanded(
                                child: Text(
                                  arti,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    height: 1.4,
                                  ),
                                ),
                              ),

                              // ❤️ Icon Favorite
                              IconButton(
                                icon: const Icon(
                                  Icons.favorite_border,
                                  color: Colors.redAccent,
                                ),
                                onPressed: () {
                                  // sementara notif dulu
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Ditambahkan ke Favorite: Ayat $nomor"),
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
