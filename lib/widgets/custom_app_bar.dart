// import 'package:flutter/material.dart';
// import 'package:scanner/widgets/custom_back_button.dart';

// class CustomAppBar extends StatelessWidget {
//   const CustomAppBar({super.key, required this.text});

//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: Text(
//         text,
//         style: const TextStyle(
//           fontFamily: "ReadexPro",
//           color: Colors.white,
//         ),
//       ),
//       leading: const CustomBackButton(),
//       backgroundColor: const Color.fromARGB(255, 88, 15, 15),
//       elevation: 0,
//       centerTitle: true,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:scanner/widgets/custom_back_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        text,
        style: const TextStyle(
          fontFamily: "ReadexPro",
          color: Colors.white,
        ),
      ),
      leading: const CustomBackButton(),
      backgroundColor: const Color.fromARGB(255, 88, 15, 15),
      elevation: 0,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
