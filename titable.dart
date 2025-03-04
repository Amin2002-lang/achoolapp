import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShedulePage extends StatelessWidget {
  const ShedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Emploi du Temps',
                style: _titleStyle,
              ),
              SizedBox(height: 70.0), // Réduit l'espace sous le titre
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    // La largeur de chaque colonne est ajustée en fonction de l'espace disponible
                    double columnWidth =
                        constraints.maxWidth / 5; // 7 jours + 1 colonne horaire
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.shade50,
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                blurRadius: 8.0,
                                spreadRadius: 2.0,
                                offset: Offset(2.0, 4.0),
                              ),
                            ],
                          ),
                          child: Table(
                            border: TableBorder.all(
                              color: Colors.orange,
                              width: 1.0,
                            ),
                            columnWidths: {
                              0: FixedColumnWidth(columnWidth),
                              1: FixedColumnWidth(columnWidth),
                              2: FixedColumnWidth(columnWidth),
                              3: FixedColumnWidth(columnWidth),
                              4: FixedColumnWidth(columnWidth),
                              5: FixedColumnWidth(columnWidth),
                              6: FixedColumnWidth(columnWidth),
                              7: FixedColumnWidth(columnWidth),
                            },
                            children: [
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Container(
                                      color: Colors.deepOrangeAccent,
                                      height:
                                          50.0, // Hauteur fixe pour l'en-tête
                                      child: Center(
                                        child: Text(
                                          'Horaire',
                                          style: _headerStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                  for (var day in [
                                    'Lun',
                                    'Mar',
                                    'Mer',
                                    'Jeu',
                                    'Ven',
                                    'Sam',
                                  ])
                                    TableCell(
                                      child: Container(
                                        color: Colors.deepOrangeAccent,
                                        height:
                                            50.0, // Hauteur fixe pour les jours
                                        child: Center(
                                          child: Text(
                                            day,
                                            style: _headerStyle,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              for (var timeSlot in [
                                '07:00 - 08:00',
                                '08:00 - 09:00',
                                '09:00 - 10:00',
                                '10:00 - 11:00',
                                '11:00 - 12:00',
                                '13:00 - 15:00 (Pause)',
                                '15:00 - 16:00',
                                '16:00 - 17:00'
                              ])
                                TableRow(
                                  children: [
                                    TableCell(
                                      child: Container(
                                        color:
                                            timeSlot == '13:00 - 15:00 (Pause)'
                                                ? Colors.grey.shade300
                                                : Colors.grey.shade200,
                                        height:
                                            60.0, // Hauteur fixe pour les créneaux horaires
                                        child: Center(
                                          child: Text(
                                            timeSlot,
                                            style: _timeSlotStyle,
                                          ),
                                        ),
                                      ),
                                    ),
                                    for (var _ in [
                                      'Lun',
                                      'Mar',
                                      'Mer',
                                      'Jeu',
                                      'Ven',
                                      'Sam',
                                    ])
                                      TableCell(
                                        child: Container(
                                          padding: EdgeInsets.all(16.0),
                                          height:
                                              60.0, // Hauteur fixe pour les cellules
                                          child: Center(
                                            child: Text(
                                              timeSlot ==
                                                      '13:00 - 15:00 (Pause)'
                                                  ? ''
                                                  : _generateContent(
                                                      timeSlot, _),
                                              style: _contentStyle,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Styles de texte
  TextStyle get _titleStyle {
    return GoogleFonts.poppins(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get _headerStyle {
    return GoogleFonts.poppins(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get _timeSlotStyle {
    return GoogleFonts.poppins(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontSize: 10,
    );
  }

  TextStyle get _contentStyle {
    return GoogleFonts.poppins(
        color: Colors.black, fontWeight: FontWeight.normal, fontSize: 10);
  }

  // Fonction pour générer du contenu pour les cellules
  String _generateContent(String timeSlot, String day) {
    List<String> subjects = ['H-G', 'FR', 'MATHS', 'SVT', 'EPS', 'PC'];
    // Générer un contenu basé sur un jour et un créneau horaire
    return subjects[(timeSlot.hashCode + day.hashCode) % subjects.length];
  }
}
