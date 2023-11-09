import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scanner/screens/home_screen.dart';
import 'package:scanner/widgets/custom_text.dart';
import 'package:url_launcher/link.dart';

late double screenWidth;
late Orientation isPortrait;

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.sizeOf(context).width;
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
      floatingActionButton: Link(
        uri: Uri.parse('https://forms.gle/UZfRvfcWa1UHNKbVA'),
        builder: (context, followLink) {
          return FloatingActionButton(
            onPressed: followLink,
            foregroundColor: Colors.black,
            splashColor: Colors.black87,
            backgroundColor: Colors.white,
            tooltip: 'للإبلاغ عن مشكلة او إقتراح معين',
            child: const Icon(
              Icons.bug_report,
              size: 32,
            ),
          );
        },
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/black_bg.jpg'),
          fit: BoxFit.cover,
        )),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Image.asset('assets/images/logo.png',
                    width: isPortrait == Orientation.portrait
                        ? screenWidth - 250
                        : screenWidth - 500),
                const SizedBox(height: 30),
                const CustomText(
                  text: ': تعليمات',
                  size: 22,
                  color: Colors.white,
                  isBold: true,
                ),
                const SizedBox(height: 80),
                const ListTile(
                  trailing: Icon(
                    Icons.done_outline_rounded,
                    color: Colors.white,
                  ),
                  title: CustomText(
                    text: 'يرجى مسح الكاميرا جيداََ قبل تصوير بار كود المنتج',
                    size: 16,
                    color: Colors.white,
                    textAlign: TextAlign.right,
                  ),
                ),
                const ListTile(
                  trailing: Icon(
                    Icons.done_outline_rounded,
                    color: Colors.white,
                  ),
                  title: CustomText(
                    text:
                        'يرجى التأكد من عدم وجود ثنيات أو لمعان علي البار الكود للحصول علي نتيجة صحيحة',
                    size: 16,
                    color: Colors.white,
                    textAlign: TextAlign.right,
                  ),
                ),
                const ListTile(
                  trailing: Icon(
                    Icons.done_outline_rounded,
                    color: Colors.white,
                  ),
                  title: CustomText(
                    text:
                        'يرجى التأكد من مسح الكود الخاص بالمنتج نفسه وليس الملصق الخاص بالمتجر',
                    size: 16,
                    color: Colors.white,
                    textAlign: TextAlign.right,
                  ),
                ),
                const ListTile(
                  trailing: Icon(
                    Icons.done_outline_rounded,
                    color: Colors.white,
                  ),
                  title: CustomText(
                    text:
                        'يرجي متابعة قناة التليجرام الخاصة بالتطبيق لمتابعة التحديثات',
                    size: 16,
                    color: Colors.white,
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(height: screenHeight / 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Link(
                        uri: Uri.parse('https://t.me/Moqata3aApp'),
                        target: LinkTarget.blank,
                        // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
                        builder: (context, FollowLink) {
                          return IconButton(
                            onPressed: FollowLink,
                            icon: const Icon(Icons.telegram),
                            iconSize: 72,
                            color: Colors.white,
                          );
                        }),
                    Link(
                        uri: Uri.parse(
                            'https://www.linkedin.com/in/akram-mousa-29a83b206?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app'),
                        target: LinkTarget.blank,
                        // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
                        builder: (context, FollowLink) {
                          return Container(
                            padding: const EdgeInsets.all(6),
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: IconButton(
                              onPressed: FollowLink,
                              icon: const FaIcon(FontAwesomeIcons.linkedinIn),
                              iconSize: 32,
                            ),
                          );
                        }),
                  ],
                ),
                const SizedBox(height: 30),
                const CustomText(
                  text: '🇵🇸 لا تنسوا الدعاء لإخواننا في فلسطين',
                  size: 12,
                  color: Colors.white,
                ),
                const SizedBox(height: 40),
                SizedBox(width: screenWidth),
              ],
            )
          ],
        ),
      ),
    );
  }
}
