import 'package:flutter/material.dart';
import 'package:scan/scan.dart';
import 'package:scanner/constants.dart';
import 'package:scanner/methods/fetch_product.dart';
import 'package:scanner/lists/codes_lists.dart';
import 'package:scanner/methods/snak_bar.dart';
import 'package:scanner/screens/category_screen.dart';
import 'package:scanner/screens/info_screen.dart';
import 'package:scanner/widgets/custom_button.dart';

late double screenWidth;
late double screenHeight;
late Orientation isPortrait;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScanController controller = ScanController();
  bool isScanCompleted = false;
  String scanResult = '';

  _showBarcodeScanner() {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (builder) {
        return StatefulBuilder(builder: (BuildContext context, setState) {
          return SizedBox(
              height: MediaQuery.of(context).size.height / 1.3,
              child: Scaffold(
                appBar: _buildBarcodeScannerAppBar(),
                body: _buildBarcodeScannerBody(),
              ));
        });
      },
    );
  }

  AppBar _buildBarcodeScannerAppBar() {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4.0),
        child: Container(color: Colors.red, height: 4.0),
      ),
      title: const Text(
        'امسح الباركود',
        style: TextStyle(fontFamily: 'ReadexPro'),
      ),
      elevation: 0.0,
      backgroundColor: Colors.black,
      leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: const Center(
            child: Icon(
          Icons.close,
          color: Colors.white,
        )),
      ),
      actions: [
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
                onTap: () => controller.toggleTorchMode(),
                child: const Icon(Icons.flashlight_on_rounded))),
      ],
    );
  }

  Widget _buildBarcodeScannerBody() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.3,
      child: ScanView(
        controller: controller,
        scanAreaScale: .7,
        scanLineColor: Colors.red,
        onCapture: (data) {
          // snakBar(context: context, text: data);
          if (int.parse(data) != -1) {
            try {
              setState(() {
                scanResult = fetchProduct(
                    data,
                    CodesLists.countryCodes,
                    CodesLists.companyCodes8,
                    CodesLists.companyCodes7,
                    CodesLists.companyCodes6,
                    CodesLists.companyCodes5,
                    CodesLists.companyCodes4);
                Navigator.of(context).pop();
              });
            } on Exception catch (e) {
              snakBar(context: context, text: e.toString());
            }
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.sizeOf(context).width;
    screenHeight = MediaQuery.sizeOf(context).height;
    isPortrait = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Moqata3a|مقاطعة',
          style: TextStyle(fontFamily: "ReadexPro"),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const InfoScreen();
          }));
        },
        foregroundColor: Colors.black,
        splashColor: Colors.black87,
        backgroundColor: Colors.white,
        tooltip: 'Contact us or report issue',
        child: const Icon(
          Icons.contact_support_outlined,
          size: 32,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/black_bg.jpg'),
          fit: BoxFit.cover,
        )),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(height: screenHeight <= 640 ? 60 : 100),
                scanResult != inText
                    ? Text(
                        scanResult,
                        style: const TextStyle(
                            color: Colors.red,
                            fontSize: 40,
                            fontFamily: 'ReadexPro',
                            fontWeight: FontWeight.bold),
                      )
                    : Text(
                        scanResult,
                        style: const TextStyle(
                            color: Colors.green,
                            fontSize: 40,
                            fontFamily: 'ReadexPro',
                            fontWeight: FontWeight.bold),
                      ),
                scanResult == ''
                    ? const SizedBox(height: 0)
                    : const SizedBox(height: 40),
                GestureDetector(
                  onTap: () async {
                    _showBarcodeScanner();
                  },
                  child: Image.asset('assets/images/Barcode.png',
                      width: isPortrait == Orientation.portrait
                          ? screenWidth - 50
                          : screenWidth - 250),
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: _showBarcodeScanner,
                  child: const CustomButton(text: 'التأكد من المنتج'),
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CategoryScreen();
                    }));
                  },
                  child: const CustomButton(text: 'قوائم المقاطعة'),
                ),
                SizedBox(width: screenWidth),
              ],
            )
          ],
        ),
      ),
    );
  }
}
