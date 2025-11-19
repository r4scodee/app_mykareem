class Ayah {
  final int number;
  final String text;
  final String translation;
  final String audioUrl;

  Ayah({
    required this.number,
    required this.text,
    required this.translation,
    required this.audioUrl,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) {
    return Ayah(
      number: json['nomor'] ?? json['number'],
      text: json['teks'] ?? json['ar'] ?? json['text'] ?? '',
      translation: json['terjemahan'] ?? json['translation'] ?? '',
      audioUrl: json['audio'] ?? '',
    );
  }
}