import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/models/models.dart';

class DefiModel {
  final String titre;
  final String description;
  final int xpRecompense;
  final bool estComplete;
  final IconData icone;

  DefiModel({
    required this.titre,
    required this.description,
    required this.xpRecompense,
    this.estComplete = false,
    required this.icone,
  });
}

class DefisPage extends StatefulWidget {
  final Utilisateur utilisateur;

  const DefisPage({super.key, required this.utilisateur});

  @override
  DefisPageState createState() => DefisPageState();
}

class DefisPageState extends State<DefisPage> {
  final List<DefiModel> defis = [
    DefiModel(
      titre: 'Premier pas',
      description: 'Complétez votre premier module d\'apprentissage',
      xpRecompense: 50,
      icone: FontAwesomeIcons.personWalking, // Utilisation d'une icône existante
    ),
    DefiModel(
      titre: 'Expert en anatomie',
      description: 'Terminez tous les chapitres du module Anatomie',
      xpRecompense: 100,
      icone: FontAwesomeIcons.book,
    ),
    DefiModel(
      titre: 'Quiz master',
      description: 'Obtenez un score parfait dans un quiz',
      xpRecompense: 75,
      icone: FontAwesomeIcons.crown,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Défis'),
        backgroundColor: const Color(0xFF4a148c),
        elevation: 0,
      ),
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
        child: Column(
          children: [
            // Progress Section
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Progression',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${widget.utilisateur.xp} XP accumulés',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.emoji_events,
                    color: Colors.amber,
                    size: 40,
                  ),
                ],
              ),
            ),

            // Challenges List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: defis.length,
                itemBuilder: (context, index) {
                  final defi = defis[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: Icon(
                        defi.icone,
                        color: defi.estComplete ? Colors.green : Colors.white70,
                        size: 30,
                      ),
                      title: Text(
                        defi.titre,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Text(
                            defi.description,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '+${defi.xpRecompense} XP',
                                style: const TextStyle(
                                  color: Colors.amber,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: defi.estComplete
                          ? const Icon(Icons.check_circle,
                          color: Colors.green, size: 24)
                          : const Icon(Icons.chevron_right,
                          color: Colors.white70),
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
