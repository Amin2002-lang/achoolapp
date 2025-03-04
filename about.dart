import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'À propos de nous',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Nous sommes une application dédiée au suivi scolaire des élèves, offrant des fonctionnalités telles que le suivi des devoirs, des absences, des résultats, et plus encore. Nous nous engageons à fournir une expérience utilisateur optimale et à garantir la sécurité et la confidentialité des données.',
            style: TextStyle(
              fontSize: 16,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
