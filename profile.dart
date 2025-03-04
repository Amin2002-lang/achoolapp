import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // title: Text('Profil de l\'élève'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.deepOrangeAccent,
            ),
            onPressed: () {
              // Action pour les notifications
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 50), // Espace au-dessus du conteneur
            Container(
              width: double
                  .infinity, // Pour que le conteneur occupe toute la largeur disponible
              constraints: BoxConstraints(
                maxWidth: 400, // Largeur maximale du conteneur
              ),
              margin: EdgeInsets.symmetric(
                  horizontal: 16.0), // Marges à gauche et à droite
              padding: const EdgeInsets.all(18.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    // Première nuance
                    Colors.deepOrangeAccent.shade200
                        .withOpacity(0.2), // Deuxième nuance
                    Colors.deepOrangeAccent.shade700
                        .withOpacity(0.1), // Troisième nuance
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(25.0),
                // border: Border.all(
                // color: Colors.grey, // Bordure grise
                //width: 2,
                //),
                // boxShadow: [
                //BoxShadow(
                // color: Colors.grey.withOpacity(0.5),
                //spreadRadius: 5,
                //blurRadius: 7,
                ///offset: Offset(0, 3), // Décalage de l'ombre
                // ),
                //],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Photo de profil et bouton de modification
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          width: 100, // Largeur de l'image du profil
                          height: 100, // Hauteur de l'image du profil
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.deepOrangeAccent,
                              width: 1,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 60, // Taille de l'image du profil
                            backgroundColor: Colors.grey[300],
                            backgroundImage:
                                AssetImage('assets/images/profile.png'),
                            // Chemin vers l'image du profil
                          ),
                        ),
                        IconButton(
                          icon:
                              Icon(Icons.edit, color: Colors.deepOrangeAccent),
                          onPressed: () {
                            // Action pour modifier la photo de profil
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      height:
                          30), // Espace entre l'image de profil et les informations
                  // Informations sur l'élève dans une section avec une bordure
                  Column(
                    children: [
                      ProfileInfoTile(
                        icon: Icons.person,
                        title: 'Id',
                        value: 'bs00258',
                      ),
                      ProfileInfoTile(
                        icon: Icons.person,
                        title: 'Nom',
                        value: 'Jean Dupont',
                      ),
                      ProfileInfoTile(
                        icon: Icons.email,
                        title: 'Email',
                        value: 'jean.dupont@example.com',
                      ),
                      ProfileInfoTile(
                        icon: Icons.phone,
                        title: 'Téléphone',
                        value: '+123 456 7890',
                      ),
                      ProfileInfoTile(
                        icon: Icons.phone,
                        title: 'Téléphone Parent',
                        value: '+123 456 7890',
                      ),
                      ProfileInfoTile(
                        icon: Icons.school,
                        title: 'Classe',
                        value: '6ème A',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepOrangeAccent,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Emploi du temps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Devoirs',
          ),
        ],
        currentIndex: 0, // Mettre l'index correspondant
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        onTap: (index) {
          // Action pour changer de page
        },
      ),
    );
  }
}

class ProfileInfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  ProfileInfoTile({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(value),
      trailing: Icon(Icons.check,
          color: Colors.black54), // Icône de validation à droite
      contentPadding: EdgeInsets.symmetric(vertical: 8.0),
    );
  }
}
