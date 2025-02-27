import 'package:flutter/material.dart';
import 'package:untitled/screens/home_page.dart';  // Ajustez le chemin selon votre structure
import 'package:untitled/models/models.dart';      // Ajustez le chemin selon votre structure

class InscriptionScreen extends StatefulWidget {
  const InscriptionScreen({super.key});

  @override
  State<InscriptionScreen> createState() => _InscriptionScreenState();
}

class _InscriptionScreenState extends State<InscriptionScreen> {
  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final _pseudoController = TextEditingController();
  final _ageController = TextEditingController();
  String _selectedGender = '';

  void _handleSubmit() {
    // Créer un nouvel utilisateur avec les données du formulaire
    final utilisateur = Utilisateur(
      id: DateTime.now().millisecondsSinceEpoch.toString(), // Génère un ID unique basé sur le timestamp
      nom: _nomController.text,
      prenom: _prenomController.text,
      pseudo: _pseudoController.text,
      age: int.tryParse(_ageController.text) ?? 0,
      genre: _selectedGender,
      xp: 0,  // XP initial à 0
    );

    // Navigation vers HomePage avec l'utilisateur créé
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(utilisateur: utilisateur),
      ),
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white.withOpacity(0.2),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 16,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
      ),
    );
  }

  Widget _buildGenderOption(String type, IconData icon) {
    final isSelected = _selectedGender == type;
    return GestureDetector(
      onTap: () => setState(() => _selectedGender = type),
      child: Container(
        width: 140,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? Colors.white.withOpacity(0.3) : Colors.white.withOpacity(0.2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 24),
            const SizedBox(width: 12),
            Text(
              type,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF4a148c), Color(0xFF880e4f)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 40),
                  const Text(
                    'Inscription',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),
                  _buildTextField('Nom', _nomController),
                  const SizedBox(height: 24),
                  _buildTextField('Prénom', _prenomController),
                  const SizedBox(height: 24),
                  _buildTextField('Pseudo', _pseudoController),
                  const SizedBox(height: 24),
                  _buildTextField('Âge', _ageController),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildGenderOption('Masculin', Icons.male),
                      _buildGenderOption('Féminin', Icons.female),
                    ],
                  ),
                  const SizedBox(height: 40),
                  GestureDetector(
                    onTap: _handleSubmit,
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white.withOpacity(0.2),
                      ),
                      child: const Center(
                        child: Text(
                          'S\'inscrire',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}