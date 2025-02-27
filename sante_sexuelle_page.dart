import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/Articles_body/hygiene.dart';
import 'package:untitled/Articles_body/depistage.dart';
import 'package:untitled/Articles_body/contraception.dart';
import 'package:untitled/Articles_body/protection.dart';
class SanteSexuellePage extends StatelessWidget {
  const SanteSexuellePage({super.key});

  List<Map<String, dynamic>> get menuItems => [
    {
      'icon': FontAwesomeIcons.soap,
      'color': Colors.teal,
      'title': 'Hygiène',
      'subtitle': 'Maintenir une bonne hygiène pour prévenir les infections.',
       'page': const HygienePage(), // Remplacez par la page correspondante si elle existe
    },
    {
      'icon': FontAwesomeIcons.vial,
      'color': Colors.orange,
      'title': 'Dépistage',
      'subtitle': 'Importance des dépistages réguliers pour les IST.',
       'page': DepistagePage(), // Remplacez par la page correspondante si elle existe
    },
    {
      'icon': FontAwesomeIcons.shieldHalved,
      'color': Colors.blue,
      'title': 'Protection',
      'subtitle': 'Utiliser des préservatifs pour se protéger et protéger les autres.',
       'page': ProtectionPage(), // Remplacez par la page correspondante si elle existe
    },
    {
      'icon': FontAwesomeIcons.pills,
      'color': Colors.purple,
      'title': 'Contraception',
      'subtitle': 'Les différentes méthodes de contraception.',
       'page': ContraceptionPage(), // Remplacez par la page correspondante si elle existe
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
        title: const Text('Santé Sexuelle',
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
              Color(0xFF1A237E), // Bleu profond
              Color(0xFF0D47A1), // Bleu royal
              Color(0xFF006064), // Cyan foncé
              Color(0xFF004D40), // Teal foncé
            ],
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
                      onTap: item['page'] != null
                          ? () => _navigateToPage(context, item['page'])
                          : null,
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
