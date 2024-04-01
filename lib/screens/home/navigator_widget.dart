import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scanner/cubits/add_barcode_cubit/add_barcode_cubit.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/models/country_barcode_model.dart';
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
          BlocProvider.of<AddBarcodeCubit>(context).addCountryBarcode(
            CountryBarcodeModel(
                name: 'Canada', firstCode: '754', lastCode: '755'),
          );
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
