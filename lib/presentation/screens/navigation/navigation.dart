import 'package:endurance_app/presentation/screens/audio/audioTab.dart';
import 'package:endurance_app/presentation/screens/calender/calender_tab.dart';
import 'package:endurance_app/presentation/screens/home/home_tab.dart';
import 'package:endurance_app/presentation/screens/profile/profile_tab.dart';
import 'package:endurance_app/theme/colors.dart';
import 'package:flutter/material.dart';

import '../appointment/appointment_tab.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    CalenderTab(),
    HomeTab(),
    BookAppointmentPage(),
    AudioTab(),
    // const Page3(),
    SettingPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: CustomColors.blue,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: "",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart_rounded),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Stack(
                children: [
                  Positioned(
                    // top: -6.0,
                    // right: -6.0,
                    child: Transform.rotate(
                      angle: 45 * 3.1415926535897932 / 180,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: CustomColors.elevatedButtonColor),
                          child: Transform.rotate(
                            angle: 45 * 3.1415926535897932 / 180,
                            child: const Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // const Icon(
                  //   Icons.add,
                  //   color: Colors.black,
                  // ),
                ],
              ),
              label: "",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.queue_music_outlined),
              label: "",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "",
            )
          ]),
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Page4 extends StatefulWidget {
  const Page4({super.key});

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Page5 extends StatefulWidget {
  const Page5({super.key});

  @override
  State<Page5> createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
