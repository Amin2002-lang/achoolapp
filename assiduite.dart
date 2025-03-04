import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendancePage extends StatefulWidget {
  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late DateTime _selectedDay;
  late DateTime _focusedDay;

  final DateTime _firstDay = DateTime(2020, 1, 1);
  final DateTime _lastDay = DateTime(2100, 12, 31);

  @override
  void initState() {
    super.initState();

    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();

    // Initialize the animation controller and animation
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1), // Adjust duration as needed
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10), // Espace entre l'AppBar et le calendrier
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TableCalendar(
                firstDay: _firstDay,
                lastDay: _lastDay,
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                calendarFormat: CalendarFormat.month,
                headerStyle: HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                  titleTextStyle: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  leftChevronIcon: Icon(
                    Icons.chevron_left,
                    color: Colors.deepOrange,
                  ),
                  rightChevronIcon: Icon(
                    Icons.chevron_right,
                    color: Colors.deepOrange,
                  ),
                ),
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  markerDecoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30), // Espace entre le calendrier et les boutons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStaticButton('Absence', Colors.red),
                SizedBox(width: 20), // Espace entre les boutons
                _buildAnimatedButton('Présence', Colors.green),
              ],
            ),
            SizedBox(height: 20), // Espace au-dessus de la liste d'absences
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'État de l\'assiduité:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            // Liste des absences
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: _buildAttendanceList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedButton(String buttonText, Color color) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: ElevatedButton(
            onPressed: () {
              // Action lors de l'appui sur le bouton
            },
            child: Text(buttonText),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              minimumSize: Size(100, 100), // Définir la largeur et la hauteur
              padding: EdgeInsets.all(20), // Ajustez le padding si nécessaire
              backgroundColor: color,
            ),
          ),
        );
      },
    );
  }

  Widget _buildStaticButton(String buttonText, Color color) {
    return ElevatedButton(
      onPressed: () {
        // Action lors de l'appui sur le bouton
      },
      child: Text(buttonText),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        minimumSize: Size(100, 100), // Définir la largeur et la hauteur
        padding: EdgeInsets.all(20), // Ajustez le padding si nécessaire
        backgroundColor: color,
      ),
    );
  }

  List<Widget> _buildAttendanceList() {
    // Exemple de données d'absences
    List<Map<String, String>> attendanceData = [
      {'date': '01/01/2024', 'status': 'Absence'},
      {'date': '02/01/2024', 'status': 'Présence'},
      {'date': '02/01/2024', 'status': 'Présence'},
      {'date': '02/01/2024', 'status': 'Présence'},
    ];

    List<Widget> attendanceList = [];
    for (var entry in attendanceData) {
      attendanceList.add(
        Card(
          margin: EdgeInsets.symmetric(vertical: 4.0),
          child: ListTile(
            contentPadding: EdgeInsets.all(8.0),
            title: Text(
              entry['date']!,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('État: ${entry['status']}'),
          ),
        ),
      );
    }

    if (attendanceList.isEmpty) {
      attendanceList.add(
        Center(
          child: Text('Aucune donnée d\'assiduité disponible'),
        ),
      );
    }

    return attendanceList;
  }
}
