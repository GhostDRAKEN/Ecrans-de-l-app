import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/Articles_body/intro_puberte.dart';
import 'package:untitled/Articles_body/anatomie_sexuelle.dart';
import 'package:untitled/Articles_body/chang_physiques.dart';
import 'package:untitled/Articles_body/chang_emot_psy.dart';
class AnatomieScreen extends StatelessWidget {
  const AnatomieScreen({super.key});

  List<Map<String, dynamic>> get menuItems => [
    {
      'icon': FontAwesomeIcons.bookOpen,
      'color': Colors.orange,
      'title': 'Introduction à la Puberté',
      'subtitle': 'Comprendre les changements',
      'page': const IntroductionPage(),
    },
    {
      'icon': FontAwesomeIcons.child,
      'color': Colors.teal,
      'title': 'Changements Physiques',
      'subtitle': 'Les transformations du corps',
      'page': const ChangementsPhysiquesPage(),
    },
    {
      'icon': FontAwesomeIcons.heart,
      'color': Colors.red,
      'title': 'Changements Émotionnels',
      'subtitle': 'Les émotions et la puberté',
      'page': const ChangementsEmotionnelPage(),
    },
    {
      'icon': FontAwesomeIcons.dna,
      'color': Colors.white,
      'title': 'Anatomie Sexuelle',
      'subtitle': 'Comprendre l\'anatomie',
      'page': const AnatomieSexuelle(),
    },
  ];

  void _navigateToPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Anatomie et Puberté',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Container(    
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF6A1B9A),
              Color(0xFF4527A0),
              Color(0xFF283593),
              Color(0xFF1565C0),
            ],
            stops: [0.1, 0.4, 0.7, 0.9],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 100), // Espace pour l'AppBar
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: InkWell(
                      onTap: () => _navigateToPage(context, item['page']),
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: item['color'].withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: FaIcon(
                                item['icon'],
                                color: item['color'],
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['title'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    item['subtitle'],
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.7),
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.chevron_right,
                              color: Colors.white70,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}