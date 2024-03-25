import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:scanner/cubits/auth_cubit/auth_cubit.dart';
import 'package:scanner/cubits/scan_cubit/scan_cubit.dart';
import 'package:scanner/screens/auth/login_screen.dart';
import 'package:scanner/screens/category_screen.dart';
import 'package:scanner/screens/home/home_screen.dart';
import 'package:scanner/screens/info_screen.dart';
import 'package:scanner/screens/splash_screen.dart';

import '../screens/auth/create_account.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => const SplashScreen(),
  ),

  GoRoute(
    path: "/login",
    builder: (context, state) => BlocProvider(
      create: (context) => AuthCubit(),
      child: const LoginScreen(),
    ),
  ),
  GoRoute(
    path: "/createAccount",
    builder: (context, state) => BlocProvider(
      create: (context) => AuthCubit(),
      child: const CreateAccount(),
    ),
  ),
  // GoRoute(
  //   path: "/forgotPassword",
  //   builder: (context, state) => BlocProvider(
  //     create: (context) => AuthCubit(),
  //     child: const ForgotPassword(),
  //   ),
  // ),

  GoRoute(
    path: "/home",
    builder: (context, state) => BlocProvider(
      create: (context) => ScanCubit(),
      child: const HomeScreen(),
    ),
  ),
  GoRoute(
    path: "/category",
    builder: (context, state) => CategoryScreen(),
  ),
  GoRoute(
    path: "/info",
    builder: (context, state) => const InfoScreen(),
  ),
]);
