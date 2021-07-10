import 'package:flutter/material.dart';

void main() {
  runApp(DietApp());
}

class DietApp extends StatelessWidget {
  const DietApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  Anasayfa({Key? key}) : super(key: key);

  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Material(
          color: Colors.white,
          child: TabBar(
            indicatorColor: Colors.transparent,
            controller: tabController,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.more,
                  color: Colors.grey,
                  size: 22,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.play_arrow,
                  color: Colors.grey,
                  size: 22,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.navigation,
                  color: Colors.black,
                  size: 22,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.supervised_user_circle,
                  color: Colors.grey,
                  size: 22,
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Container(
            margin: EdgeInsets.only(
              top: 25,
              bottom: 10,
            ),
            child: Text(
              "Diyet Rehberim",
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(
                top: 20,
                bottom: 10,
              ),
              child: IconButton(
                icon: Icon(Icons.account_box),
                onPressed: () {},
                color: Colors.grey,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Material(
            borderRadius: BorderRadius.circular(16),
            elevation: 4,
            color: Colors.orange.shade400,
            child: Container(
              height: 500,
              width: double.infinity,
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/model1.jpg',
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                      onPressed: () {},
                      child: Text(
                        'Diyet Listeleri',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
