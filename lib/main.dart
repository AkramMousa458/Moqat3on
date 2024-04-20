import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/constants.dart';
import 'package:scanner/cubits/get_barcodes_cubit/get_barcodes_cubit.dart';
import 'package:scanner/cubits/get_products_cubit/get_products_cubit.dart';
import 'package:scanner/cubits/scan_cubit/scan_cubit.dart';
import 'package:scanner/firebase_options.dart';
import 'package:scanner/helper/firebase_notification.dart';
import 'package:scanner/helper/local_notification_service.dart';
import 'package:scanner/helper/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:scanner/helper/work_manager_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
    FirebaseNotification.initNotificaitons(),
    LocalNotificationService.init(),
    WorkManagerService().init(),
  ]);

  runApp(const Scanner());
}

class Scanner extends StatelessWidget {
  const Scanner({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ScanCubit(),
        ),
        BlocProvider(
          create: (context) => GetProductsCubit()..getAllProducts(),
        ),
        BlocProvider(create: (context) => GetBarcodesCubit()),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          fontFamily: "Cairo",
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        debugShowCheckedModeBanner: false,
        title: kAppTitle,
        routerConfig: router,
      ),
    );
  }
}
