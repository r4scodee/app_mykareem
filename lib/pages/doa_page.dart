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
  {
    "title": "Doa Masuk Kamar Mandi",
    "arabic": "اللّٰهُمَّ إِنِّيْ أَعُوْذُ بِكَ مِنَ الْخُبُثِ وَالْخَبَائِثِ",
    "latin": "Allahumma inni a'udzu bika minal khubutsi wal khoba'its",
    "translation": "Ya Allah, aku berlindung kepada-Mu dari gangguan jin laki-laki dan jin perempuan."
  },
  {
    "title": "Doa Keluar Kamar Mandi",
    "arabic": "غُفْرَانَكَ",
    "latin": "Ghufranaka",
    "translation": "Aku memohon ampun kepada-Mu (wahai Allah)."
  },
  {
    "title": "Doa Masuk Rumah",
    "arabic": "بِسْمِ اللّٰهِ وَلَجْنَا، وَبِسْمِ اللّٰهِ خَرَجْنَا، وَعَلَى اللّٰهِ رَبِّنَا تَوَكَّلْنَا",
    "latin": "Bismillah wa lajnā, wa bismillah kharajnā, wa 'alallāhi rabbina tawakkalnā",
    "translation": "Dengan nama Allah kami masuk, dengan nama Allah kami keluar, dan kepada Allah Tuhan kami, kami bertawakal."
  },
  {
    "title": "Doa Keluar Rumah",
    "arabic":
        "بِسْمِ اللّٰهِ تَوَكَّلْتُ عَلَى اللّٰهِ، لَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللّٰهِ",
    "latin":
        "Bismillah, tawakkaltu ‘alallah, laa hawla wa laa quwwata illa billah",
    "translation":
        "Dengan nama Allah, aku bertawakal kepada Allah. Tiada daya dan kekuatan kecuali dengan pertolongan Allah."
  },
  {
    "title": "Doa Untuk Kedua Orang Tua",
    "arabic":
        "رَبِّ ارْحَمْهُمَا كَمَا رَبَّيَانِيْ صَغِيْرًا",
    "latin":
        "Rabbir hamhuma kama rabbayānī shaghīrā",
    "translation":
        "Wahai Tuhanku, sayangilah kedua orang tuaku sebagaimana mereka menyayangiku di waktu kecil."
  },
  {
    "title": "Doa Sebelum Makan",
    "arabic": "بِسْمِ اللّٰهِ",
    "latin": "Bismillah",
    "translation": "Dengan nama Allah."
  },
  {
    "title": "Doa Sesudah Makan",
    "arabic":
        "الْـحَمْـدُ لِلّٰهِ الَّذِيْ أَطْعَمَنَا وَسَقَانَا وَجَعَلَنَا مِنَ الْمُسْلِمِيْنَ",
    "latin":
        "Alhamdulillahil ladzi at’amana wa saqana wa ja’alana minal muslimin",
    "translation":
        "Segala puji bagi Allah yang telah memberi kami makan, minum, dan menjadikan kami sebagai muslim."
  },
  {
    "title": "Doa Masuk Masjid",
    "arabic":
        "اللّٰهُمَّ افْتَحْ لِيْ أَبْوَابَ رَحْمَتِكَ",
    "latin":
        "Allahummaftah lii abwaba rahmatik",
    "translation": "Ya Allah, bukakanlah untukku pintu-pintu rahmat-Mu."
  },
  {
    "title": "Doa Keluar Masjid",
    "arabic":
        "اللّٰهُمَّ إِنِّيْ أَسْأَلُكَ مِنْ فَضْلِكَ",
    "latin":
        "Allahumma inni as'aluka min fadhlik",
    "translation": "Ya Allah, aku memohon kepada-Mu karunia-Mu."
  },
  {
    "title": "Doa Naik Kendaraan",
    "arabic":
        "سُبْحَانَ الَّذِيْ سَخَّرَ لَنَا هٰذَا وَمَا كُنَّا لَهُ مُقْرِنِيْنَ وَإِنَّا إِلَىٰ رَبِّنَا لَمُنْقَلِبُوْنَ",
    "latin":
        "Subhanalladzi sakhkhara lana hadza wa ma kunna lahu muqrinin. Wa inna ila rabbina lamunqalibun",
    "translation":
        "Mahasuci Allah yang telah menundukkan semua ini untuk kami padahal kami sebelumnya tidak mampu. Dan sesungguhnya kami akan kembali kepada Tuhan kami."
  },
  {
    "title": "Doa Perlindungan",
    "arabic":
        "بِسْمِ اللّٰهِ الَّذِيْ لَا يَضُرُّ مَعَ اسْمِهِ شَيْءٌ فِي الْأَرْضِ وَلَا فِي السَّمَاءِ وَهُوَ السَّمِيْعُ الْعَلِيْمُ",
    "latin":
        "Bismillahil ladzi la yadurru ma'asmihi shay'un fil ardhi wa la fissama’i wa huwa sami’ul ‘alim",
    "translation":
        "Dengan nama Allah yang dengan nama-Nya tidak ada sesuatu pun di bumi dan langit yang dapat membahayakan. Dia Maha Mendengar, Maha Mengetahui."
  },
  {
    "title": "Doa Ketika Marah",
    "arabic": "أَعُوْذُ بِاللّٰهِ مِنَ الشَّيْطَانِ الرَّجِيْمِ",
    "latin": "A'udzu billahi minasy-syaitanir-rajim",
    "translation": "Aku berlindung kepada Allah dari setan yang terkutuk."
  },
  {
    "title": "Doa Ketika Hujan",
    "arabic": "اللّٰهُمَّ صَيِّبًا نَافِعًا",
    "latin": "Allahumma shayiban nafi’an",
    "translation": "Ya Allah, turunkanlah hujan yang bermanfaat."
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
