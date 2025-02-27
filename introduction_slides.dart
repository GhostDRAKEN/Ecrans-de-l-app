import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons/lucide_icons.dart';

class IntroductionSlides extends StatefulWidget {
  const IntroductionSlides({super.key});

  @override
  IntroductionSlidesState createState() => IntroductionSlidesState();
}

class IntroductionSlidesState extends State<IntroductionSlides> {
  int currentSlide = 0;

  final slides = [
    {
      'icon': LucideIcons.heart,
      'title': "L'Éducation Transforme",
      'subtitle': "Chaque moment d'apprentissage est une opportunité de grandir",
      'background': const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.pink, Colors.purple],
      ),
      'iconColor': Colors.pink,
    },
    {
      'icon': LucideIcons.shield,
      'title': "Protéger par la Connaissance",
      'subtitle': "La compréhension est notre bouclier contre l'ignorance",
      'background': const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.blue, Colors.indigo],
      ),
      'iconColor': Colors.blue,
    },
    {
      'icon': LucideIcons.arrowRight,
      'title': "Votre Parcours Commence Ici",
      'subtitle': "Ensemble, construisons un avenir plus éclairé",
      'background': const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.green, Colors.teal],
      ),
      'iconColor': Colors.green,
    },
  ];

  void handleNextSlide() {
    setState(() {
      if (currentSlide < slides.length - 1) {
        currentSlide++;
      } else {
        Navigator.pushReplacementNamed(context, '/inscription'); // Naviguer vers l'écran d'inscription
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> currentSlideData = slides[currentSlide] as Map<String, dynamic>;

    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          gradient: currentSlideData['background'] as LinearGradient,
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  currentSlideData['icon'] as IconData,
                  size: 96,
                  color: Colors.white,
                ).animate().scale(duration: const Duration(milliseconds: 600)).fade(duration: const Duration(milliseconds: 600)),
                const SizedBox(height: 24),
                Text(
                  currentSlideData['title'] as String,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ).animate().slideY(begin: 0.5, end: 0, duration: const Duration(milliseconds: 600)).fade(duration: const Duration(milliseconds: 600)),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    currentSlideData['subtitle'] as String,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ).animate().slideY(begin: 0.5, end: 0, duration: const Duration(milliseconds: 600)).fade(duration: const Duration(milliseconds: 600)),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: handleNextSlide,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white24,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    currentSlide < slides.length - 1 ? 'Suivant' : 'Commencer',
                  ),
                ).animate().scale(duration: const Duration(milliseconds: 600)).fade(duration: const Duration(milliseconds: 600)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
