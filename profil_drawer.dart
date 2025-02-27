import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/models/models.dart';

class ProfileDrawer extends StatelessWidget {
  final Utilisateur utilisateur;
  final VoidCallback onClose;

  ProfileDrawer({super.key, required this.utilisateur, required this.onClose});
  final List<Map<String, dynamic>> achievements = [
    {
      'id': 1,
      'titre': "Premier Quiz",
      'description': "A complété son premier quiz",
      'icon': FontAwesomeIcons.bookOpen,
      'iconColor': Colors.purple[400],
    },
    {
      'id': 2,
      'titre': "Expert Relations",
      'description': "Module Relations terminé",
      'icon': FontAwesomeIcons.heart,
      'iconColor': Colors.pink[400],
    },
    {
      'id': 3,
      'titre': "Champion",
      'description': "3 quiz parfaits",
      'icon': FontAwesomeIcons.trophy,
      'iconColor': Colors.yellow[400],
    }
  ];

  final List<Map<String, dynamic>> modules = [
    {
      'nom': "Relations",
      'progres': 0,
      'icon': FontAwesomeIcons.heart,
      'iconColor': Colors.pink[400],
    },
    {
      'nom': "Santé Sexuelle",
      'progres': 0,
      'icon': FontAwesomeIcons.shield,
      'iconColor': Colors.green[400],
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Overlay semi-transparent
        GestureDetector(
          onTap: onClose,
          child: Container(
            color: Colors.black.withOpacity(0.5),
          ),
        ),

        // Drawer
        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          child: Container(
            width: 320,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF4a148c), Color(0xFF880e4f)],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              children: [
                // En-tête
                Container(
                  padding: const EdgeInsets.all(16.0),
                  color: const Color(0xFF4a148c),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Profil',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close, color: Colors.white),
                            onPressed: onClose,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white.withOpacity(0.2),
                            child: const Text('👤', style: TextStyle(fontSize: 32)),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                utilisateur.nom,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: Colors.yellow),
                                  const SizedBox(width: 4),
                                  Text(
                                    '${utilisateur.xp} XP',
                                    style: const TextStyle(color: Colors.yellow),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Contenu
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Progression des Modules
                        _buildSectionTitle('Progression des Modules', FontAwesomeIcons.bookOpen),
                        ...modules.map((module) => _buildProgressModule(module)),

                        const SizedBox(height: 20),

                        // Succès Débloqués
                        _buildSectionTitle('Succès Débloqués', FontAwesomeIcons.trophy),
                        ...achievements.map((achievement) => _buildAchievementCard(achievement)),

                        const SizedBox(height: 20),

                        // Statistiques
                        _buildSectionTitle('Statistiques', FontAwesomeIcons.star),
                        _buildStats(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 18),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressModule(Map<String, dynamic> module) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(module['icon'], color: module['iconColor']),
                  const SizedBox(width: 8),
                  Text(
                    module['nom'],
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
              Text(
                '${module['progres']}%',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: module['progres'] / 100,
            color: Colors.purple[400],
            backgroundColor: Colors.white.withOpacity(0.2),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementCard(Map<String, dynamic> achievement) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(achievement['icon'], color: achievement['iconColor']),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  achievement['titre'],
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  achievement['description'],
                  style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStats() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: [
        _buildStatCard('0', 'Quiz Complétés'),
        _buildStatCard('0%', 'Score Moyen'),
      ],
    );
  }

  Widget _buildStatCard(String value, String label) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
