import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/screens/about_screen.dart';
import 'package:scanner/screens/donate/donate_screen.dart';
import 'package:scanner/screens/home/home_screen.dart';
import 'package:scanner/screens/profile/profile_screen.dart';
import 'package:scanner/screens/scan/scan_screen.dart';

class NavigatorWidget extends StatefulWidget {
  const NavigatorWidget({super.key});

  @override
  State<NavigatorWidget> createState() => _NavigatorWidgetState();
}

class _NavigatorWidgetState extends State<NavigatorWidget> {
  int _selectedIndex = 0;
  final _pages = [
    const HomeScreen(),
    const DonateScreen(),
    const ScanScreen(),
    const AboutScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offwhite,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseAuth.instance.signOut();
          GoRouter.of(context).go('/');
          // BlocProvider.of<AddDonateCubit>(context).addDonate(
          //   DonateModel(
          //     text: 'بيت الزكاة المصري',
          //     image:
          //         'https://upload.wikimedia.org/wikipedia/ar/2/20/%D8%A8%D9%8A%D8%AA_%D8%A7%D9%84%D8%B2%D9%83%D8%A7%D8%A9_%D9%88%D8%A7%D9%84%D8%B5%D8%AF%D9%82%D8%A7%D8%AA_%D8%A7%D9%84%D9%85%D8%B5%D8%B1%D9%8A.png',
          //     url: 'https://baitzakat.org.eg/donationChannels/#5',
          //   ),
          // );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Image.asset('assets/images/hand.png'),
        ),
        title: const Text(
          'مقاطعة',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        iconSize: 23,
        elevation: 1,
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
          const BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.handHoldingDollar),
            label: 'التبرع',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 50,
              height: 50,
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: AppColors.redBlck,
                borderRadius: const BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
              child: Center(
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
            icon: Icon(FontAwesomeIcons.circleInfo),
            label: 'عنا',
          ),
          const BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.circleUser),
            label: 'البروفايل',
          ),
        ],
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
