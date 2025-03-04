import 'package:flutter/material.dart';
import 'package:app_school/pages/homecontent.dart';
import 'package:app_school/pages/devoir.dart';
import 'package:app_school/pages/assiduite.dart';
import 'package:app_school/pages/resultat.dart';
import 'package:app_school/pages/pdc.dart';
import 'package:app_school/pages/about.dart';
import 'package:app_school/pages/chat.dart';
import 'package:app_school/pages/profile.dart';
import 'package:app_school/pages/titable.dart'; // Assurez-vous que le chemin est correct
//mport 'package:app_school/pages/assistance.dart'; // Assurez-vous que AssistancePage est défini ici

class MainScaffold extends StatefulWidget {
  @override
  _MainScaffoldState createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;
  Widget _currentPage = HomeContent();

  final List<Widget> _bottomNavPages = <Widget>[
    HomeContent(),
    ShedulePage(), // Assurez-vous que SchedulePage est défini ici
    HomeworkScreen(),
  ];

  void _onBottomNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _currentPage = _bottomNavPages[index];
    });
  }

  void _onDrawerItemTapped(int index) {
    switch (index) {
      case 0:
        setState(() {
          _currentPage = HomeContent();
        });
        break;
      case 1:
        setState(() {
          _currentPage = ShedulePage();
        });
        break;
      case 2:
        setState(() {
          _currentPage = HomeworkScreen();
        });
        break;
      case 3:
        setState(() {
          _currentPage = AttendancePage();
        });
        break;
      case 4:
        setState(() {
          _currentPage = ResultPage();
        });
        break;
      case 5:
        setState(() {
          _currentPage = PrivacyPolicyPage();
        });
        break;
      case 6:
        _showAboutUsBottomSheet(context);
        break;

      case 8:
        setState(() {
          _currentPage = AssistancePage();
        });
        break;
    }
    Navigator.pop(context); // Ferme le drawer
  }

  void _showAboutUsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return AboutUsPage(); // Assurez-vous que AboutUsPage est défini ici
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade50.withOpacity(0.2),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.deepOrangeAccent, size: 30),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.deepOrange, size: 20),
            onPressed: () {
              // Action pour les notifications
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.deepOrangeAccent, size: 30),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              color: Colors.deepOrangeAccent,
              width: double.infinity,
              padding:
                  EdgeInsets.symmetric(vertical: 20.0), // Espacement vertical
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Colors.deepOrangeAccent, size: 50),
                    radius: 40,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Jonh Gouba',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'jh02@dg.com',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.white),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildDrawerItem(
                    icon: Icons.home,
                    text: 'Accueil',
                    onTap: () => _onDrawerItemTapped(0),
                  ),
                  _buildDrawerItem(
                    icon: Icons.calendar_today,
                    text: 'Emploi du temps',
                    onTap: () => _onDrawerItemTapped(1),
                  ),
                  _buildDrawerItem(
                    icon: Icons.assignment,
                    text: 'Devoirs',
                    onTap: () => _onDrawerItemTapped(2),
                  ),
                  _buildDrawerItem(
                    icon: Icons.check_circle,
                    text: 'Assiduité',
                    onTap: () => _onDrawerItemTapped(3),
                  ),
                  _buildDrawerItem(
                    icon: Icons.school,
                    text: 'Résultats',
                    onTap: () => _onDrawerItemTapped(4),
                  ),
                  _buildDrawerItem(
                    icon: Icons.lock,
                    text: 'Politique de confidentialité',
                    onTap: () => _onDrawerItemTapped(5),
                  ),
                  _buildDrawerItem(
                    icon: Icons.info,
                    text: 'À propos de nous',
                    onTap: () => _onDrawerItemTapped(6),
                  ),
                  _buildDrawerItem(
                    icon: Icons.help,
                    text: 'Assistance',
                    onTap: () => _onDrawerItemTapped(8),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: _currentPage,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        child: BottomNavigationBar(
          //backgroundColor: const Color.fromARGB(255, 227, 120, 88),
          items: const <BottomNavigationBarItem>[
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
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.deepOrangeAccent,
          unselectedItemColor: Colors.grey.shade800,
          onTap: _onBottomNavItemTapped,
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required GestureTapCallback onTap,
  }) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon, color: Colors.deepOrangeAccent),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text, style: TextStyle(color: Colors.deepOrangeAccent)),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
