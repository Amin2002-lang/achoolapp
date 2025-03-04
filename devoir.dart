import 'package:flutter/material.dart';

class HomeworkScreen extends StatefulWidget {
  @override
  _HomeworkScreenState createState() => _HomeworkScreenState();
}

class _HomeworkScreenState extends State<HomeworkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.orange.withOpacity(0.2),
                          spreadRadius: 2.0,
                          blurRadius: 4.0,
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                        hintText: 'Rechercher...',
                        hintStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                        ),
                        prefixIcon: Icon(Icons.search, color: Colors.deepOrangeAccent),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                IconButton(
                  icon: Icon(Icons.filter_list, color: Colors.deepOrangeAccent),
                  onPressed: () {
                    // Action pour le filtre
                  },
                ),
              ],
            ),
          ),
           SizedBox(height: 90.0),
          _listItem(
            Icons.assignment,
            'Biologie',
            '9h-11h',
            '2024-08-22',
          ),
          SizedBox(height: 10.0),
          _listItem(
            Icons.assignment,
            ' Français',
            '14h-16h',
            '2024-08-23',
          ),
          SizedBox(height: 10.0),
          _listItem(
            Icons.assignment,
            ' Mathématiques',
            '10h-12h',
            '2024-08-24',
          ),
          SizedBox(height: 10.0),
          _listItem(
            Icons.assignment,
            'Test de Français',
            '7h-9h',
            '2024-08-25',
          ),
          SizedBox(height: 10.0),
          _listItem(
            Icons.assignment,
            ' Mathématiques',
            '10h-12h',
            '2024-08-24',
          ),
          SizedBox(height: 10.0),
          _listItem(
            Icons.assignment,
            ' Français',
            '7h-9h',
            '2024-08-25',
          ),
        ],
      ),
    );
  }

  Widget _listItem(
    IconData icon,
    String title,
    String time,
    String date,
  ) {
    return Container(
      height:90.0,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2.0,
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            width:30.0,
            height: 30.0,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Icon(icon, color: Colors.white, size: 20.0),
          ),
          SizedBox(width: 30.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black87,
                    fontFamily: 'Montserrat',
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
                Row(
                  children: [
                    Icon(Icons.timer, color: Colors.grey, size: 12.0),
                    SizedBox(width: 6.0),
                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                Row(
                  children: [
                    Icon(Icons.calendar_today, color: Colors.grey, size: 10.0),
                    SizedBox(width: 6.0),
                    Text(
                      date,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
