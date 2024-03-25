import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/constants.dart';
import 'package:scanner/cubits/scan_cubit/scan_cubit.dart';
import 'package:scanner/firebase_options.dart';
import 'package:scanner/helper/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:scanner/screens/products_profiles/products.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Scanner());
}

class Scanner extends StatelessWidget {
  const Scanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScanCubit(),
      child: MaterialApp(
        theme: ThemeData(
          //  scaffoldBackgroundColor: AppColors.lightGrey,
          fontFamily: "ReadexPro",
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        debugShowCheckedModeBanner: false,
        title: kAppTitle,
        //  routerConfig: router,_SplashScreenState
        //  routerConfig: router,

        home: const CompanyProfiles(),
      ),
    );
  }
}
