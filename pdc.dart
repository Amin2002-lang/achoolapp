import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Politique de Confidentialité',
              style: TextStyle(
                fontSize: 20, // Taille du texte pour le titre
                fontWeight: FontWeight.bold,
                // Ajoute le soulignement
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Dernière mise à jour : [Date]',
              style: TextStyle(
                fontSize: 16, // Taille du texte pour la date
                // Ajoute le soulignement
              ),
            ),
            SizedBox(height: 20),
            Text(
              '1. Introduction\n'
              'Bienvenue dans [Nom de l\'Application], une application dédiée au suivi scolaire des élèves. Nous nous engageons à protéger votre vie privée et à garantir que vos informations personnelles sont traitées de manière sécurisée et conforme aux lois applicables en matière de protection des données. Cette politique de confidentialité explique quelles informations nous collectons, comment nous les utilisons, et les choix que vous avez concernant vos données.',
              style: TextStyle(
                fontSize: 16,
                // Ajoute le soulignement
              ),
            ),
            SizedBox(height: 20),
            Text(
              '2. Informations Collectées\n'
              'Nous collectons plusieurs types d\'informations pour fournir et améliorer notre service, notamment :\n'
              '- Informations personnelles : Telles que le nom, l\'adresse e-mail, les informations de contact, et d\'autres informations nécessaires pour utiliser certaines fonctionnalités de l\'application.\n'
              '- Informations scolaires : Telles que les résultats académiques, les absences, les horaires des cours, et d\'autres données liées au suivi scolaire.\n'
              '- Informations de connexion et d\'utilisation : Incluant l\'adresse IP, les types de navigateurs utilisés, les pages visitées et les interactions avec l\'application.',
              style: TextStyle(
                fontSize: 16,
                // Ajoute le soulignement
              ),
            ),
            SizedBox(height: 20),
            Text(
              '3. Utilisation des Informations\n'
              'Les informations collectées sont utilisées pour :\n'
              '- Fournir et maintenir notre service.\n'
              '- Améliorer notre application et personnaliser l\'expérience utilisateur.\n'
              '- Envoyer des notifications concernant les mises à jour et les nouvelles fonctionnalités.\n'
              '- Répondre aux demandes de support et résoudre les problèmes.\n'
              '- Analyser l\'utilisation de l\'application pour des statistiques internes.',
              style: TextStyle(
                fontSize: 16,
                // Ajoute le soulignement
              ),
            ),
            SizedBox(height: 20),
            Text(
              '4. Protection des Données\n'
              'Nous utilisons des mesures de sécurité appropriées pour protéger vos informations contre l\'accès non autorisé, la divulgation, la modification ou la destruction. Ces mesures incluent le chiffrement des données, l\'accès restreint aux informations et des audits réguliers de la sécurité.',
              style: TextStyle(
                fontSize: 16,
                decoration: TextDecoration.underline, // Ajoute le soulignement
              ),
            ),
            SizedBox(height: 20),
            Text(
              '5. Partage des Informations\n'
              'Nous ne partageons vos informations personnelles avec des tiers que dans les situations suivantes :\n'
              '- Avec votre consentement : Nous pouvons partager vos informations si vous avez donné votre accord explicite.\n'
              '- Pour des raisons légales : Nous pouvons divulguer vos informations si cela est requis par la loi ou pour se conformer à une procédure légale.\n'
              '- Avec des partenaires de confiance : Nous pouvons partager des informations avec des partenaires qui fournissent des services en notre nom, sous réserve qu\'ils respectent les obligations de confidentialité.',
              style: TextStyle(
                fontSize: 16,
                decoration: TextDecoration.underline, // Ajoute le soulignement
              ),
            ),
            SizedBox(height: 20),
            Text(
              '6. Vos Droits\n'
              'Vous avez le droit de :\n'
              '- Accéder aux informations que nous détenons sur vous.\n'
              '- Demander la correction ou la suppression de vos informations personnelles.\n'
              '- Retirer votre consentement au traitement de vos données, dans la mesure où cela est applicable.',
              style: TextStyle(
                fontSize: 16,
                decoration: TextDecoration.underline, // Ajoute le soulignement
              ),
            ),
            SizedBox(height: 20),
            Text(
              '7. Modifications de la Politique\n'
              'Nous pouvons mettre à jour cette politique de confidentialité de temps à autre pour refléter les changements dans notre pratique ou pour se conformer aux exigences légales. Nous vous informerons de tout changement en publiant la nouvelle politique sur notre application.',
              style: TextStyle(
                fontSize: 16,
                decoration: TextDecoration.underline, // Ajoute le soulignement
              ),
            ),
            SizedBox(height: 20),
            Text(
              '8. Contact\n'
              'Pour toute question ou préoccupation concernant cette politique de confidentialité, veuillez nous contacter à :\n'
              'fijhh@gmqil.com\n'
              '[Adresse physique, si applicable]',
              style: TextStyle(
                fontSize: 16,
                // Ajoute le soulignement
              ),
            ),
          ],
        ),
      ),
    );
  }
}
