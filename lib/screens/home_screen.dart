import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/constants.dart';
import 'package:scanner/cubits/scan_cubit/scan_cubit.dart';
import 'package:scanner/helper/navigation.dart';
import 'package:scanner/helper/snak_bar.dart';
import 'package:scanner/widgets/custom_button.dart';
import 'package:scanner/widgets/custom_floating_button.dart';
import 'package:scanner/widgets/custom_loading_widget.dart';
import 'package:scanner/widgets/custom_text.dart';
import 'package:scanner/widgets/show_barcode_scanner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    Orientation isPortrait = MediaQuery.of(context).orientation;
    bool isLoading = false;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              customNavigate(context, "/login");
            },
            icon: Icon(
              Icons.logout,
            )),
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
        onPressed: () => customNavigate(context, "/info"),
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
                if (state is ScanLoading) {
                  isLoading = true;
                } else if (state is ScanSuccsess) {
                  Navigator.of(context).pop();
                  isLoading = false;
                } else if (state is ScanFailed) {
                  isLoading = false;
                  Navigator.pop(context);
                  snakBar(context: context, text: state.errMessage);
                } else if (state is ScanInitial) {
                  Navigator.pop(context);
                  isLoading = false;
                } else {
                  isLoading = false;
                }
              },
              builder: (context, state) {
                return Column(
                  children: [
                    SizedBox(height: screenHeight <= 640 ? 60 : 100),
                    isLoading
                        ? const CustomLoadingWidget()
                        : BlocProvider.of<ScanCubit>(context).scanResult !=
                                inText
                            ? Text(
                                BlocProvider.of<ScanCubit>(context).scanResult,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 40,
                                  fontFamily: 'ReadexPro',
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : Text(
                                BlocProvider.of<ScanCubit>(context).scanResult,
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 40,
                                  fontFamily: 'ReadexPro',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                    BlocProvider.of<ScanCubit>(context).scanResult == '' ||
                            BlocProvider.of<ScanCubit>(context).scanResult ==
                                '-1'
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
                      onTap: () => customNavigate(context, "/category"),
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
