import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/surah.dart';

class ApiService {
  final String baseUrl = 'https://api.quran.gading.dev';

  /// Ambil daftar semua surah
  Future<List<Surah>> fetchSurahList() async {
    final url = Uri.parse('$baseUrl/surah');
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final data = json.decode(res.body);
      final List list = data['data'];
      return list.map((e) => Surah.fromJson(e)).toList();
    } else {
      throw Exception('Gagal memuat daftar surah (status ${res.statusCode})');
    }
  }

  /// Ambil detail surah berdasarkan nomor
  Future<Surah> fetchSurahDetail(int id) async {
    final url = Uri.parse('$baseUrl/surah/$id');
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final data = json.decode(res.body);
      final obj = data['data'];
      return Surah.fromJson(obj);
    } else {
      throw Exception('Gagal memuat detail surah (status ${res.statusCode})');
    }
  }
}
