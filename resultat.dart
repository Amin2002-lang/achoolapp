import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage>
    with SingleTickerProviderStateMixin {
  String selectedYear = '2023-2024'; // Valeur par défaut
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: CurvedShapeClipper(),
                  child: Container(
                    height: 100,
                    //color: Colors.white,
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 16,
                  right: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _showYearSelectorDialog(context);
                        },
                        child: Row(
                          children: [
                            Text(
                              selectedYear,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.orange,
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.orange,
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.school,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            TabBar(
              controller: _tabController,
              indicatorColor: Colors.deepOrange,
              labelColor: Colors.deepOrange,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: "1er Trimestre"),
                Tab(text: "2ème Trimestre"),
                Tab(text: "3ème Trimestre"),
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: MediaQuery.of(context).size.height * 0.75,
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildResultTable([
                    ['Français', '15/20', '16/20'],
                    ['Mathématiques', '14/20', '13/20'],
                    ['Histoire', '12/20', '14/20'],
                    ['Anglais', '14/20', '15/20'],
                    ['Français', '15/20', '16/20'],
                    ['Mathématiques', '14/20', '13/20'],
                    ['Histoire', '12/20', '14/20'],
                    ['Anglais', '14/20', '15/20'],
                    ['Français', '15/20', '16/20'],
                    ['Mathématiques', '14/20', '13/20'],
                    ['Histoire', '12/20', '14/20'],
                    ['Anglais', '14/20', '15/20'],
                    // Ajoutez plus de matières et notes ici
                  ]),
                  _buildResultTable([
                    ['Français', '16/20', '17/20'],
                    ['Mathématiques', '13/20', '14/20'],
                    ['Histoire', '14/20', '13/20'],
                    ['Anglais', '14/20', '14/20'],
                    ['Français', '15/20', '16/20'],
                    ['Mathématiques', '14/20', '13/20'],
                    ['Histoire', '12/20', '14/20'],
                    ['Anglais', '14/20', '15/20'],
                    ['Français', '15/20', '16/20'],
                    ['Mathématiques', '14/20', '13/20'],
                    ['Histoire', '12/20', '14/20'],
                    ['Anglais', '14/20', '15/20'],
                    // Ajoutez plus de matières et notes ici
                  ]),
                  _buildResultTable([
                    ['Français', '17/20', '18/20'],
                    ['Mathématiques', '15/20', '16/20'],
                    ['Histoire', '13/20', '14/20'],
                    ['Anglais', '14/20', '15/20'],
                    ['Français', '15/20', '16/20'],
                    ['Mathématiques', '14/20', '13/20'],
                    ['Histoire', '12/20', '14/20'],
                    ['Anglais', '14/20', '15/20'],
                    ['Français', '15/20', '16/20'],
                    ['Mathématiques', '14/20', '13/20'],
                    ['Histoire', '12/20', '14/20'],
                    ['Anglais', '14/20', '15/20'],
                    ['Français', '15/20', '16/20'],
                    ['Mathématiques', '14/20', '13/20'],
                    ['Histoire', '12/20', '14/20'],
                    ['Anglais', '14/20', '15/20'],
                    // Ajoutez plus de matières et notes ici
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showYearSelectorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Sélectionnez l'année scolaire"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <String>[
                '2021-2022',
                '2022-2023',
                '2023-2024',
              ].map((String value) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedYear = value;
                    });
                    Navigator.of(context).pop(); // Ferme le dialogue
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(value),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildResultTable(List<List<String>> results) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Table(
        border: TableBorder.all(
            color: Colors.grey, borderRadius: BorderRadius.circular(20)),
        columnWidths: const {
          0: FlexColumnWidth(3),
          1: FlexColumnWidth(1),
          2: FlexColumnWidth(1),
        },
        children: [
          TableRow(
            decoration: BoxDecoration(color: Colors.grey.shade50),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Matière',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Note 1',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Note 2',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          for (var result in results)
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(result[0]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(result[1]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(result[2]),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class CurvedShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height - 50);
    path.quadraticBezierTo(
        size.width * 0.5, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
