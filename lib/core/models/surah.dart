class Surah {
  final int number;
  final String name;
  final String translation;
  final String revelation;
  final int numberOfVerses;
  final List<dynamic> verses; // tetap dynamic biar fleksibel

  Surah({
    required this.number,
    required this.name,
    required this.translation,
    required this.revelation,
    required this.numberOfVerses,
    required this.verses,
  });

  factory Surah.fromJson(Map<String, dynamic> json) {
    final data = json;

    return Surah(
      number: data['number'],
      name: data['name']?['transliteration']?['id'] ?? 'Tidak diketahui',
      translation: data['name']?['translation']?['id'] ?? '-',
      revelation: data['revelation']?['id'] ?? '-',
      numberOfVerses: data['numberOfVerses'] ?? 0,
      verses: data['verses'] ?? [],
    );
  }
}
