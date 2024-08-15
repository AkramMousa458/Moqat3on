import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scanner/constants.dart';
import 'package:scanner/core/api_service.dart';
import 'package:scanner/cubits/auth_cubit/auth_cubit.dart';
import 'package:scanner/cubits/get_barcodes_cubit/get_barcodes_cubit.dart';
import 'package:scanner/cubits/get_products_cubit/get_products_cubit.dart';
import 'package:scanner/cubits/scan_cubit/scan_cubit.dart';
import 'package:scanner/cubits/notification_cubit/notification_cubit.dart';
import 'package:scanner/firebase_options.dart';
import 'package:scanner/helper/firebase_notification.dart';
import 'package:scanner/helper/local_notification_service.dart';
import 'package:scanner/helper/notification_enum.dart';
import 'package:scanner/helper/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:scanner/helper/work_manager_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  prefs = await SharedPreferences.getInstance();
  await Future.wait([
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
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => ScanCubit(),
        ),
        BlocProvider(
          create: (context) => GetProductsCubit(ApiService())..getAllProducts(),
        ),
        BlocProvider(
          create: (context) => GetBarcodesCubit(),
        ),
        BlocProvider(
          create: (context) => NotificationCubit()
            ..changeNotificationStatus(
                notificationStatus: NotificationEnum.initial),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          textTheme: GoogleFonts.cairoTextTheme(),
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
