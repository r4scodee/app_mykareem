import 'package:flutter/material.dart';
import '../../core/api_service.dart';
import '../../core/models/surah.dart';
import '../../app_theme.dart';
import '../../widgets/surah_tile.dart';
import '../pages/surah_detail_page.dart';

class SurahPage extends StatefulWidget {
  const SurahPage({super.key});

  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  final ApiService api = ApiService();
  late Future<List<Surah>> futureSurah;

  @override
  void initState() {
    super.initState();
    futureSurah = api.fetchSurahList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text("Daftar Surah"),
        centerTitle: true,
        backgroundColor: AppTheme.purple,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Surah>>(
        future: futureSurah,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Gagal memuat surah: ${snapshot.error}",
                textAlign: TextAlign.center,
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Tidak ada data surah"));
          }

          final surahList = snapshot.data!;
          return ListView.separated(
            itemCount: surahList.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final surah = surahList[index];
              return SurahTile(
                number: surah.number,
                title: surah.name,
                subtitle: "${surah.translation} • ${surah.revelation}",
                ayahCount: surah.numberOfVerses,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          SurahDetailPage(surahNumber: surah.number),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
