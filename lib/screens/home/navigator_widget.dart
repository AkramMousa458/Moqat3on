import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/helper/navigation.dart';
import 'package:scanner/screens/donate/donate_screen.dart';
import 'package:scanner/screens/home/home_screen.dart';
import 'package:scanner/screens/scan/scan_screen.dart';
import 'package:scanner/screens/settings_screen.dart';

class NavigatorWidget extends StatefulWidget {
  const NavigatorWidget({super.key});

  static String routeName = '/navigatorWidget';

  @override
  State<NavigatorWidget> createState() => _NavigatorWidgetState();
}

class _NavigatorWidgetState extends State<NavigatorWidget> {
  int _selectedIndex = 0;
  final _pages = [
    const HomeScreen(),
    const ScanScreen(),
    const DonateScreen(),
    
    // const AboutScreen(),
    // const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              FontAwesomeIcons.gear,
              color: AppColors.deepGrey,
            ),
            onPressed: () {
              customNavigate(context, SettingsScreen.routeName);
            },
          )
        ],
        title: const Text(
          "مقاطعة",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: Image.asset(
          'assets/images/hand.png',
          width: 50,
          height: 50,
        ),
      ),
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.rtl,
        child: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: false,
          iconSize: 23,
          elevation: 1,
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.redBlck,
          unselectedItemColor: AppColors.deepGrey,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (value) {
            _selectedIndex = value;
            setState(() {});
          },
          items: [
            const BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.houseChimney),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 50,
                height: 50,
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                decoration: const BoxDecoration(
                  color: AppColors.redBlck,
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
                child: const Center(
                  child: Icon(
                    FontAwesomeIcons.expand,
                    color: AppColors.white,
                    size: 30,
                  ),
                ),
              ),
              label: 'مسح',
            ),
            const BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.handHoldingDollar),
              label: 'التبرع',
            ),

            // const BottomNavigationBarItem(
            //   icon: Icon(FontAwesomeIcons.circleInfo),
            //   label: 'عنا',
            // ),
            // const BottomNavigationBarItem(
            //   icon: Icon(FontAwesomeIcons.circleUser),
            //   label: 'البروفايل',
            // ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 16),
        child: Center(
          child: _pages[_selectedIndex],
        ),
      ),
    );
  }
}
