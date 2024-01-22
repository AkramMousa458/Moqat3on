import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/constants.dart';
import 'package:scanner/cubits/scan_cubit/scan_cubit.dart';
import 'package:scanner/methods/snak_bar.dart';
import 'package:scanner/screens/category_screen.dart';
import 'package:scanner/screens/info_screen.dart';
import 'package:scanner/widgets/custom_button.dart';
import 'package:scanner/widgets/custom_floating_button.dart';
import 'package:scanner/widgets/custom_text.dart';
import 'package:scanner/widgets/show_barcode_scanner.dart';

late double screenWidth;
late double screenHeight;
late Orientation isPortrait;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.sizeOf(context).width;
    screenHeight = MediaQuery.sizeOf(context).height;
    isPortrait = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Moqata3a|مقاطعة',
          size: 20,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      floatingActionButton: CustomFloatingButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const InfoScreen();
            },
          ),
        ),
        tipText: 'بعض التعليمات',
        iconData: Icons.contact_support_outlined,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/black_bg.jpg'),
          fit: BoxFit.cover,
        )),
        child: ListView(
          children: [
            BlocConsumer<ScanCubit, ScanState>(
              listener: (context, state) {
                if (state is ScanSuccsess) {
                  Navigator.of(context).pop();
                } else if (state is ScanFailed) {
                  snakBar(context: context, text: state.errMessage);
                }
              },
              builder: (context, state) {
                return Column(
                  children: [
                    SizedBox(height: screenHeight <= 640 ? 60 : 100),
                    BlocProvider.of<ScanCubit>(context).scanResult != inText
                        ? Text(
                            BlocProvider.of<ScanCubit>(context).scanResult,
                            style: const TextStyle(
                                color: Colors.red,
                                fontSize: 40,
                                fontFamily: 'ReadexPro',
                                fontWeight: FontWeight.bold),
                          )
                        : Text(
                            BlocProvider.of<ScanCubit>(context).scanResult,
                            style: const TextStyle(
                                color: Colors.green,
                                fontSize: 40,
                                fontFamily: 'ReadexPro',
                                fontWeight: FontWeight.bold),
                          ),
                    BlocProvider.of<ScanCubit>(context).scanResult == ''
                        ? const SizedBox(height: 0)
                        : const SizedBox(height: 40),
                    GestureDetector(
                      onTap: () => barcodeScanner(context),
                      child: Image.asset(
                        'assets/images/Barcode.png',
                        width: isPortrait == Orientation.portrait
                            ? screenWidth - 50
                            : screenWidth - 250,
                      ),
                    ),
                    const SizedBox(height: 40),
                    CustomButton(
                      onTap: () => barcodeScanner(context),
                      text: 'التأكد من المنتج',
                    ),
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'أو',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "ReadexPro",
                            fontSize: 30),
                      ),
                    ),
                    CustomButton(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CategoryScreen();
                        }));
                      },
                      text: 'قوائم المقاطعة',
                    ),
                    SizedBox(width: screenWidth),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
