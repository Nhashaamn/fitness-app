// ignore_for_file: use_build_context_synchronously

import 'package:final_project/modules/calender.dart';
import 'package:final_project/modules/exersice.dart';
import 'package:final_project/pages/login_page.dart';
import 'package:final_project/pages/profile.dart';
import 'package:final_project/pages/report_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const ReportScreen(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void signuserout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        title: const Text(
          "HHH Fitness",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Arial',
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(
              255, 255, 255, 255), 
        ),
        actions: [
          IconButton(onPressed: signuserout, icon: const Icon(Icons.logout))
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.graphic_eq_outlined),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor:
            const Color(0xffE04754), 
        unselectedItemColor: Colors.grey, 
        backgroundColor: const Color.fromARGB(
            255, 0, 0, 0), 
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _beginnerKey = GlobalKey();
  final GlobalKey _intermediateKey = GlobalKey();
  final GlobalKey _proKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        switch (_tabController.index) {
          case 0:
            _scrollToSection(_beginnerKey);
            break;
          case 1:
            _scrollToSection(_intermediateKey);
            break;
          case 2:
            _scrollToSection(_proKey);
            break;
        }
      }
    });
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              controller: _scrollController,
              children: [
                const calender(),
                TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'Beginner'),
                    Tab(text: 'Intermediate'),
                    Tab(text: 'Pro'),
                  ],
                ),
                Container(
                    key: _beginnerKey,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    // ignore: prefer_const_constructors
                    child: Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 17.0, top: 10),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Beginner",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Exercise(
                          imagePath: 'assets/beg1.jpg',
                          text: "ABS BEGINNER",
                        ),
                        Exercise(
                          imagePath: 'assets/beg2.jpg',
                          text: "CHEST BEGINNER",
                        ),
                        Exercise(
                          imagePath: 'assets/beg3.jpg',
                          text: "ARM BEGINNER",
                        ),
                        Exercise(
                          imagePath: 'assets/beg4.jpg',
                          text: "LEG BEGINNER",
                        ),
                        Exercise(
                          imagePath: 'assets/beg5.jpg',
                          text: "SHOULDER BEGINNER",
                        ),
                      ],
                    )),
                Container(
                    key: _intermediateKey,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 17.0, top: 10),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Intermediate",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Exercise(
                          imagePath: 'assets/int3.jpg',
                          text: "ABS INTERMEDIATE",
                        ),
                        Exercise(
                          imagePath: 'assets/int2.jpeg',
                          text: "CHEST INTERMEDIATE",
                        ),
                        Exercise(
                          imagePath: 'assets/int1.jpg',
                          text: "ARM INTERMEDIATE",
                        ),
                        Exercise(
                          imagePath: 'assets/int4.jpeg',
                          text: "LEG INTERMEDIATE",
                        ),
                        Exercise(
                          imagePath: 'assets/int5.jpeg',
                          text: "SHOULDER INTERMEDIATE",
                        ),
                      ],
                    )),
                Container(
                    key: _proKey,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 17.0, top: 10),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Advanced",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Exercise(
                          imagePath: 'assets/pro1.jpg',
                          text: "ABS ADVANCED",
                        ),
                        Exercise(
                          imagePath: 'assets/pro2.jpg',
                          text: "CHEST ADVANCED",
                        ),
                        Exercise(
                          imagePath: 'assets/pro3.jfif',
                          text: "ARM ADVANCED",
                        ),
                        Exercise(
                          imagePath: 'assets/pro4.jpg',
                          text: "LEG ADVANCED",
                        ),
                        Exercise(
                          imagePath: 'assets/pro5.jpg',
                          text: "SHOULDER ADVANCED",
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
