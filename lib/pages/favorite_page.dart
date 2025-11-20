import 'package:flutter/material.dart';
import '../../core/favorite_service.dart';
import '../app_theme.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  FavoriteService service = FavoriteService();

  List surahFav = [];
  List ayatFav = [];
  List doaFav = [];

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    surahFav = await service.getSurahFavorites();
    ayatFav = await service.getAyatFavorites();
    doaFav = await service.getDoaFavorites();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Saya"),
        centerTitle: true,
        backgroundColor: AppTheme.purple,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text("Surah Favorit",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ...surahFav.map(_buildSurahCard),
          const SizedBox(height: 20),
          const Text("Ayat Favorit",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ...ayatFav.map(_buildAyatCard),
          const SizedBox(height: 20),
          const Text("Doa Favorit",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ...doaFav.map(_buildDoaCard),
        ],
      ),
    );
  }

  Widget _buildSurahCard(item) {
    return Card(
      child: ListTile(
        title: Text(item["name"]),
        subtitle: Text(item["translation"]),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () async {
            await service.removeSurahFavorite(item["number"]);
            loadFavorites();
          },
        ),
      ),
    );
  }

  Widget _buildAyatCard(item) {
    return Card(
      child: ListTile(
        title: Text(item["arab"],
            textAlign: TextAlign.right, style: const TextStyle(fontSize: 20)),
        subtitle: Text("${item["surahName"]} — Ayat ${item["number"]}"),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () async {
            await service.removeAyatFavorite(item["surah"], item["number"]);
            loadFavorites();
          },
        ),
      ),
    );
  }

  Widget _buildDoaCard(item) {
    return Card(
      child: ListTile(
        title: Text(item["title"]),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () async {
            await service.removeDoaFavorite(item["id"]);
            loadFavorites();
          },
        ),
      ),
    );
  }
}
