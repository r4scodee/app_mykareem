import 'package:flutter/material.dart';
import '../../app_theme.dart';

class OnboardPage extends StatefulWidget {
  @override
  _OnboardPageState createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  final PageController _controller = PageController();
  int _current = 0;

  final List<Map<String, String>> slides = [
    {
      'image': 'assets/images/onboard1.png',
      'title': 'Selamat Datang di MyKareem',
      'subtitle': 'Baca Al-Qur\u2019an, dengarkan mufassir dan atur jadwal shalat harianmu.'
    },
    {
      'image': 'assets/images/onboard2.png',
      'title': 'Audio Tilawah Berkualitas',
      'subtitle': 'Dengarkan bacaan Syeikh favorit dengan kontrol audio yang nyaman.'
    },
    {
      'image': 'assets/images/onboard3.png',
      'title': 'Pengingat Waktu Shalat',
      'subtitle': 'Fitur jadwal shalat dan countdown yang membantu ibadah tepat waktu.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/signin'),
                child: Text('Skip', style: TextStyle(color: AppTheme.deepPurple)),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: slides.length,
                onPageChanged: (i) => setState(() => _current = i),
                itemBuilder: (context, index) {
                  final slide = slides[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppTheme.lightPurple,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(slide['image']!, fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(height: 28),
                        Text(slide['title']!, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppTheme.deepPurple)),
                        SizedBox(height: 12),
                        Text(slide['subtitle']!, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600])),
                      ],
                    ),
                  );
                },
              ),
            ),
            _buildIndicator(),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_current == slides.length - 1) {
                      Navigator.pushReplacementNamed(context, '/signin');
                    } else {
                      _controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                    }
                  },
                  child: Text(_current == slides.length - 1 ? 'Mulai Sekarang' : 'Lanjut'),
                ),
              ),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(slides.length, (i) {
        final active = i == _current;
        return AnimatedContainer(
          duration: Duration(milliseconds: 250),
          margin: EdgeInsets.symmetric(horizontal: 6),
          width: active ? 20 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: active ? AppTheme.purple : AppTheme.lightPurple,
            borderRadius: BorderRadius.circular(8),
          ),
        );
      }),
    );
  }
}
