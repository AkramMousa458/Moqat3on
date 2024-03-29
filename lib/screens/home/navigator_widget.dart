// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:scanner/constants.dart';
// import 'package:scanner/cubits/scan_cubit/scan_cubit.dart';
// import 'package:scanner/helper/navigation.dart';
// import 'package:scanner/helper/snak_bar.dart';
// import 'package:scanner/widgets/custom_button.dart';
// import 'package:scanner/widgets/custom_floating_button.dart';
// import 'package:scanner/widgets/custom_loading_widget.dart';
// import 'package:scanner/widgets/custom_text.dart';
// import 'package:scanner/widgets/show_barcode_scanner.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
// double screenWidth = MediaQuery.sizeOf(context).width;
// double screenHeight = MediaQuery.sizeOf(context).height;
// Orientation isPortrait = MediaQuery.of(context).orientation;
// bool isLoading = false;

//     return Scaffold(
//       appBar: AppBar(
//         title: const CustomText(
//           text: 'Moqata3a|مقاطعة',
//           size: 20,
//           color: Colors.white,
//         ),
//         backgroundColor: Colors.black,
//         elevation: 0,
//         centerTitle: true,
//       ),
//       floatingActionButton: CustomFloatingButton(
//         onPressed: () => customNavigate(context, "/info"),
//         tipText: 'بعض التعليمات',
//         iconData: Icons.contact_support_outlined,
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//             image: DecorationImage(
//           image: AssetImage('assets/images/black_bg.jpg'),
//           fit: BoxFit.cover,
//         )),
//         child: ListView(
//           children: [
// BlocConsumer<ScanCubit, ScanState>(
//   listener: (context, state) {
//     if (state is ScanLoading) {
//       isLoading = true;
//     } else if (state is ScanSuccsess) {
//       Navigator.of(context).pop();
//       isLoading = false;
//     } else if (state is ScanFailed) {
//       isLoading = false;
//       Navigator.pop(context);
//       snakBar(context: context, text: state.errMessage);
//     } else if (state is ScanInitial) {
//       Navigator.pop(context);
//       isLoading = false;
//     } else {
//       isLoading = false;
//     }
//   },
//               builder: (context, state) {
//                 return Column(
//                   children: [
//                     SizedBox(height: screenHeight <= 640 ? 60 : 100),
//                     isLoading
//                         ? const CustomLoadingWidget()
// : BlocProvider.of<ScanCubit>(context).scanResult !=
//         inText
//     ? Text(
//         BlocProvider.of<ScanCubit>(context).scanResult,
//         style: const TextStyle(
//           color: Colors.red,
//           fontSize: 40,
//           fontFamily: 'ReadexPro',
//           fontWeight: FontWeight.bold,
//         ),
//       )
//     : Text(
//         BlocProvider.of<ScanCubit>(context).scanResult,
//         style: const TextStyle(
//           color: Colors.green,
//           fontSize: 40,
//           fontFamily: 'ReadexPro',
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//                     BlocProvider.of<ScanCubit>(context).scanResult == '' ||
//                             BlocProvider.of<ScanCubit>(context).scanResult ==
//                                 '-1'
//                         ? const SizedBox(height: 0)
//                         : const SizedBox(height: 40),
//                     GestureDetector(
//                       onTap: () => barcodeScanner(context),
//                       child: Image.asset(
//                         'assets/images/Barcode.png',
//                         width: isPortrait == Orientation.portrait
//                             ? screenWidth - 50
//                             : screenWidth - 250,
//                       ),
//                     ),
//                     const SizedBox(height: 40),
//                     CustomButton(
//                       onTap: () => barcodeScanner(context),
//                       text: 'التأكد من المنتج',
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.all(20),
//                       child: Text(
//                         'أو',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontFamily: "ReadexPro",
//                             fontSize: 30),
//                       ),
//                     ),
//                     CustomButton(
//                       onTap: () => customNavigate(context, "/category"),
//                       text: 'قوائم المقاطعة',
//                     ),
//                     SizedBox(width: screenWidth),
//                   ],
//                 );
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scanner/cubits/add_product_cubit/add_product_cubit.dart';
import 'package:scanner/cubits/get_products_cubit/get_products_cubit.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/models/product_model.dart';
import 'package:scanner/screens/about_screen.dart';
import 'package:scanner/screens/home/home_screen.dart';
import 'package:scanner/screens/profile/profile_screen.dart';

class NavigatorWidget extends StatefulWidget {
  const NavigatorWidget({super.key});

  @override
  State<NavigatorWidget> createState() => _NavigatorWidgetState();
}

class _NavigatorWidgetState extends State<NavigatorWidget> {
  int _selectedIndex = 0;
  final _pages = [
    const HomeScreen(),
    const Icon(
      FontAwesomeIcons.clockRotateLeft,
      size: 150,
    ),
    const Icon(
      FontAwesomeIcons.barcode,
      size: 150,
    ),
    const AboutScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offwhite,
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {
                // BlocProvider.of<AddProductCubit>(context).addProduct(
                //   ProductModel(
                //     name: name,
                //     category: category,
                //     boycott: boycott,
                //     boycottReason: boycottReason,
                //     country: country,
                //     image: image,
                //     ratign: ratign,
                //   ),
                // );
              },
              icon: Icon(
                Icons.menu_open_rounded,
                size: 30,
                color: AppColors.redBlck,
              ),
            ),
          ),
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: BlocListener<ScanCubit, ScanState>(
      //   listener: (context, state) {
      //     if (state is ScanLoading) {
      //     } else if (state is ScanSuccsess) {
      //       BlocProvider.of<ScanCubit>(context).scanResult != inText
      //           ? showCustomSnackBar(
      //               context: context,
      //               text: BlocProvider.of<ScanCubit>(context).scanResult,
      //               status: false,
      //             )
      //           : showCustomSnackBar(
      //               context: context,
      //               text: BlocProvider.of<ScanCubit>(context).scanResult,
      //               status: true,
      //             );
      //       Navigator.of(context).pop();
      //     } else if (state is ScanFailed) {
      //       showCustomSnackBar(
      //         context: context,
      //         text: state.errMessage,
      //         status: false,
      //       );
      //       Navigator.pop(context);
      //     } else if (state is ScanInitial) {}
      //   },
      //   child: FloatingActionButton(
      //     onPressed: () {
      //       barcodeScanner(context);
      //     },
      //     elevation: 1,
      //     backgroundColor: AppColors.redBlck,
      //     child: const Icon(
      //       Icons.camera_alt_rounded,
      //       color: Colors.white,
      //       size: 28,
      //     ),
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 25,
        selectedItemColor: AppColors.redBlck,
        unselectedItemColor: AppColors.deepGrey,
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        onTap: (value) {
          _selectedIndex = value;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.houseChimney),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.clockRotateLeft),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Icon(FontAwesomeIcons.barcode, size: 20),
                ),
                Icon(FontAwesomeIcons.expand, size: 45),
              ],
            ),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.circleInfo),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.circleUser),
            label: 'Profile',
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
