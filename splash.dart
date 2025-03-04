import 'package:app_school/pages/login.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/scheduler.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation =
        Tween<double>(begin: 0.8, end: 1.2).animate(_animationController);

    // Transition vers la page d'accueil après l'appui sur le bouton
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Fond transparent
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Image animée
                ScaleTransition(
                  scale: _animation,
                  child: Image.asset(
                    'assets/images/lo.png', // Assurez-vous que le logo est dans le bon dossier
                    width: 150,
                  ),
                ),
                SizedBox(height: 20.0),
                // Texte
                Text(
                  'Shcool Track',
                  style: TextStyle(
                    fontSize: 24.0,

                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Couleur du texte
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            
             bottom: 70.0,
            right: 20.0,
            
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                 onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade200, // Couleur du bouton
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

