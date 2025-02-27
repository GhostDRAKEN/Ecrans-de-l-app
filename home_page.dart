// home_page.dart
import 'package:flutter/material.dart';
import 'package:untitled/models/models.dart';
import 'package:untitled/widgets/profil_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/services/database_helper.dart';
import 'package:untitled/screens/contenu/sante_sexuelle_page.dart';
import 'package:untitled/screens/contenu/relations_page.dart';
import 'package:untitled/screens/contenu/consentement_page.dart';
import 'package:untitled/screens/contenu/anatomie_page.dart';
import 'package:untitled/screens/defis_page.dart';
import 'package:untitled/screens/profile_screen.dart';  // Nouvel import

class HomePage extends StatefulWidget {
  final Utilisateur utilisateur;

  const HomePage({super.key, required this.utilisateur});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool isProfileDrawerOpen = false;
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    _loadArticles();
  }

  Future<void> _loadArticles() async {
    final loadedArticles = await DatabaseHelper.instance.readAllArticles();
    setState(() {
      articles = loadedArticles;
    });
  }

  void _openProfileDrawer() {
    setState(() {
      isProfileDrawerOpen = true;
    });
  }

  void _closeProfileDrawer() {
    setState(() {
      isProfileDrawerOpen = false;
    });
  }

  void _navigateToPage(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  List<Map<String, dynamic>> get menuItems => [
    {
      'icon': FontAwesomeIcons.child,
      'color': Colors.purple,
      'title': 'Anatomie et Puberté',
      'subtitle': 'Comprendre son corps',
      'page': const AnatomieScreen(),
    },
    {
      'icon': FontAwesomeIcons.shield,
      'color': Colors.green,
      'title': 'Santé Sexuelle',
      'subtitle': 'Prévention et bien-être',
      'page': const SanteSexuellePage(),
    },
    {
      'icon': FontAwesomeIcons.heartPulse,
      'color': Colors.blue,
      'title': 'Consentement',
      'subtitle': 'Comprendre et respecter',
      'page': ConsentementPage(),
    },
    {
      'icon': FontAwesomeIcons.heart,
      'color': Colors.pink,
      'title': 'Relations',
      'subtitle': 'Comprendre les relations saines',
      'page': const RelationsPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF4a148c),
              Color(0xFF6a1b9a),
            ],
          ),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.menu, color: Colors.white),
                          onPressed: _openProfileDrawer,
                        ),
                        const Text(
                          'Éducation Santé',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.yellow, size: 20),
                            const SizedBox(width: 4),
                            Text(
                              '${widget.utilisateur.xp} XP',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.shield, color: Colors.white70),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Comprendre pour mieux se protéger. 🛡️',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: menuItems.length,
                    itemBuilder: (context, index) {
                      final item = menuItems[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: InkWell(
                          onTap: () => _navigateToPage(item['page']),
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  item['icon'],
                                  color: item['color'],
                                  size: 24,
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

                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    border: Border(
                      top: BorderSide(
                        color: Colors.white.withOpacity(0.1),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.home, color: Colors.white),
                          const SizedBox(height: 4),
                          const Text(
                            'Accueil',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DefisPage(utilisateur: widget.utilisateur),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star, color: Colors.white.withOpacity(0.5)),
                            const SizedBox(height: 4),
                            Text(
                              'Défis',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(utilisateur: widget.utilisateur),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.shield, color: Colors.white.withOpacity(0.5)),
                            const SizedBox(height: 4),
                            Text(
                              'Profil',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (isProfileDrawerOpen)
              ProfileDrawer(
                utilisateur: widget.utilisateur,
                onClose: _closeProfileDrawer,
              ),
          ],
        ),
      ),
    );
  }
}