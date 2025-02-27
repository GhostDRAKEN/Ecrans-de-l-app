import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/Articles_body/communication.dart';
import 'package:untitled/Articles_body/emotions_sentiments.dart';
import 'package:untitled/Articles_body/respect_mutuel.dart';
import 'package:untitled/Articles_body/limites_perso.dart';
class RelationsPage extends StatelessWidget {
  const RelationsPage({super.key});

  List<Map<String, dynamic>> get menuItems => [
    {
      'icon': FontAwesomeIcons.heart,
      'color': Colors.red,
      'title': 'Émotions et sentiments',
      'subtitle': 'Exprimer ses émotions et sentiments de manière ouverte et honnête.',
      'page': const EmotionsPage(), // Remplacez par la page correspondante si nécessaire
    },
    {
      'icon': FontAwesomeIcons.comments,
      'color': Colors.blue,
      'title': 'Communication',
      'subtitle': 'Une communication efficace est essentielle dans toutes les relations.',
      'page': const CommunicationPage(), // Remplacez par la page correspondante si nécessaire
    },
    {
      'icon': FontAwesomeIcons.handshake,
      'color': Colors.green,
      'title': 'Respect mutuel',
      'subtitle': 'Le respect mutuel est la base de toute relation saine.',
      'page': const RespectPage(), // Remplacez par la page correspondante si nécessaire
    },
    {
      'icon': FontAwesomeIcons.stop,
      'color': Colors.orange,
      'title': 'Limites personnelles',
      'subtitle': 'Respecter les limites personnelles de chacun est crucial.',
      'page': const LimitesPage(), // Remplacez par la page correspondante si nécessaire
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
        title: const Text('Relations',
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
              Color(0xFF1565C0), // Bleu électrique
              Color(0xFFB91D73), // Rose profond
              Color(0xFF7F00FF), // Violet intense
              Color(0xFF4B0082), // Indigo profond
            ],
            stops: [0.1, 0.4, 0.7, 0.9],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 80.0, 16.0, 16.0),
          child: ListView.builder(
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
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.white.withOpacity(0.15),
                          Colors.white.withOpacity(0.05),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: item['color'].withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: FaIcon(item['icon'], color: item['color'], size: 24),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                item['title'],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black26,
                                      offset: Offset(0, 2),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item['subtitle'],
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            height: 1.5,
                            letterSpacing: 0.3,
                            shadows: [
                              Shadow(
                                color: Colors.black26,
                                offset: Offset(0, 1),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
