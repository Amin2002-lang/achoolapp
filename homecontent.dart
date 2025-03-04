import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30.0),
            CarouselSlider(
              options: CarouselOptions(
                height: 190.0,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                autoPlayInterval: Duration(seconds: 3),
                viewportFraction: 0.9,
              ),
              items: [
                buildCarouselItem('assets/images/regle.jpeg'),
                buildCarouselItem('assets/images/regle.jpeg'),
                buildCarouselItem('assets/images/regle.jpeg'),
              ],
            ),
            SizedBox(height: 10.0),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                'Événements à venir...',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                indicator: BoxDecoration(), // Retire la ligne de soulignement
                tabs: <Widget>[
                  buildTab('PARTY', _tabController.index == 0),
                  buildTab('MEETING', _tabController.index == 1),
                  buildTab('EXAM', _tabController.index == 2),
                  buildTab('SCHOOL-OUT', _tabController.index == 3),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.orange.shade50.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: SizedBox(
                height: 150.0, // Hauteur fixe pour le TabBarView
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    buildTabContent('fe.png'),
                    buildTabContent('renc.jpeg'),
                    buildTabContent('ren.jpg'),
                    buildTabContent('vac.jpg'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Devoir de la semaine.....',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            SizedBox(
              height: 200.0, // Hauteur fixe pour le GridVie
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: buildAssignmentGrid(),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ASSIDUITÉ',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1, // Ajustement égal pour un affichage équilibré
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      //decoration: BoxDecoration(
                      //color: Colors.grey.shade100,
                      // borderRadius: BorderRadius.circular(10.0),
                      //),
                      child: Column(
                        children: [
                          Text(
                            'Présence / Absence',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            height: 150.0,
                            child: PieChart(
                              PieChartData(
                                sections: [
                                  PieChartSectionData(
                                    color: Colors.green.shade800,
                                    // value: 15, // Nombre de présences
                                    //title: 'Présences',
                                    radius: 50.0,
                                    titleStyle: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  PieChartSectionData(
                                    color: Colors.red.shade800,
                                    //value: 2, // Nombre d'absences
                                    //title: 'Absences',
                                    radius: 50.0,
                                    titleStyle: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                color: Colors.green.shade800,
                              ),
                              SizedBox(width: 5),
                              Text('Présences'),
                              SizedBox(width: 20),
                              Container(
                                width: 10,
                                height: 10,
                                color: Colors.red.shade800,
                              ),
                              SizedBox(width: 5),
                              Text('Absences'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCarouselItem(String imagePath) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        Center(
          child: Container(
            height: 150,
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            color: Colors.white.withOpacity(0.10),
            child: Text(
              'Loi 1 \n'
              'Texte de Réglement Intérieur Le premier chapitre est dédié à la contextualisation du thème ',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTab(String title, bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 14.0,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive
                  ? const Color.fromARGB(255, 238, 122, 86)
                  : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTabContent(String imageName) {
    return SizedBox(
      height: 200.0, // Hauteur fixe pour le GridView
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // Affichez les détails ou une page de détails ici
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Détails de l\'image'),
                    content: Image.asset('assets/images/$imageName'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Fermer'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Card(
              elevation: 5.0,
              child: Image.asset('assets/images/$imageName'),
            ),
          );
        },
      ),
    );
  }

  Widget buildAssignmentGrid() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 2.0,
      ),
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 4.0,
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 242, 140, 77),
              //border: Border.all(
                //color: Colors.deepOrange, // Couleur de la bordure
                //width: 2.0, // Épaisseur de la bordure
              //),
              borderRadius: BorderRadius.circular(8.0), // Rayon des coins
            ),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.assignment),
                  iconColor: Colors.white,
                  title: Text(
                    'SVT ${index + 1}',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  subtitle: Text(
                    '10-12H ${index + 1}',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
