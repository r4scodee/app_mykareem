import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteService {
  static const String keySurah = "favorite_surah";
  static const String keyAyat = "favorite_ayat";
  static const String keyDoa = "favorite_doa";

  // ================= SURAH =================
  Future<List<Map<String, dynamic>>> getSurahFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(keySurah);
    if (jsonString == null) return [];
    return List<Map<String, dynamic>>.from(json.decode(jsonString));
  }

  Future<void> addSurahFavorite(Map<String, dynamic> surah) async {
    final prefs = await SharedPreferences.getInstance();
    final list = await getSurahFavorites();

    // hindari duplikat
    if (!list.any((e) => e["number"] == surah["number"])) {
      list.add(surah);
      prefs.setString(keySurah, json.encode(list));
    }
  }

  Future<void> removeSurahFavorite(int number) async {
    final prefs = await SharedPreferences.getInstance();
    final list = await getSurahFavorites();
    list.removeWhere((e) => e["number"] == number);
    prefs.setString(keySurah, json.encode(list));
  }

  // ================= AYAT =================
  Future<List<Map<String, dynamic>>> getAyatFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(keyAyat);
    if (jsonString == null) return [];
    return List<Map<String, dynamic>>.from(json.decode(jsonString));
  }

  Future<void> addAyatFavorite(Map<String, dynamic> ayat) async {
    final prefs = await SharedPreferences.getInstance();
    final list = await getAyatFavorites();

    // hindari duplikat
    if (!list.any(
        (e) => e["surah"] == ayat["surah"] && e["number"] == ayat["number"])) {
      list.add(ayat);
      prefs.setString(keyAyat, json.encode(list));
    }
  }

  Future<void> removeAyatFavorite(int surah, int number) async {
    final prefs = await SharedPreferences.getInstance();
    final list = await getAyatFavorites();
    list.removeWhere((e) => e["surah"] == surah && e["number"] == number);
    prefs.setString(keyAyat, json.encode(list));
  }

  // ================= DOA =================
  Future<List<Map<String, dynamic>>> getDoaFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(keyDoa);
    if (jsonString == null) return [];
    return List<Map<String, dynamic>>.from(json.decode(jsonString));
  }

  Future<void> addDoaFavorite(Map<String, dynamic> doa) async {
    final prefs = await SharedPreferences.getInstance();
    final list = await getDoaFavorites();

    if (!list.any((e) => e["id"] == doa["id"])) {
      list.add(doa);
      prefs.setString(keyDoa, json.encode(list));
    }
  }

  Future<void> removeDoaFavorite(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final list = await getDoaFavorites();
    list.removeWhere((e) => e["id"] == id);
    prefs.setString(keyDoa, json.encode(list));
  }
}
