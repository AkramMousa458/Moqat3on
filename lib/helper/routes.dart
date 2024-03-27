import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:scanner/cubits/auth_cubit/auth_cubit.dart';
import 'package:scanner/cubits/get_products_cubit/get_products_cubit.dart';
import 'package:scanner/cubits/scan_cubit/scan_cubit.dart';
import 'package:scanner/models/product_model.dart';
import 'package:scanner/screens/auth/login_screen.dart';
import 'package:scanner/screens/category_screen.dart';
import 'package:scanner/screens/home/home_screen.dart';
import 'package:scanner/screens/home/navigator_widget.dart';
import 'package:scanner/screens/info_screen.dart';
import 'package:scanner/screens/products_profiles/product_screen.dart';
import 'package:scanner/screens/profile/profile_screen.dart';
import 'package:scanner/screens/splash_screen.dart';

import '../screens/auth/create_account.dart';

final GoRouter router = GoRouter(
  routes: [
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
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: "/profile",
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: "/navigator",
      builder: (context, state) => const NavigatorWidget(),
    ),
    // GoRoute(
    //   path: "/category",
    //   builder: (context, state) => CategoryScreen(),
    // ),
    GoRoute(
      path: "/productScreen",
      builder: (context, state) => ProductScreen(
        productModel: ProductModel(
          name: 'هارت اتاك',
          category: 'restaurant',
          boycott: 'لا',
          boycottReason: 'هارت أتاك هو افضل المطاعم البديله',
          country: 'مصر',
          image:
              'https://scontent.fcai20-3.fna.fbcdn.net/v/t39.30808-6/392932485_644622561119795_4867512621439910492_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_ohc=l-c7D-mvhMIAX8OWATz&_nc_ht=scontent.fcai20-3.fna&oh=00_AfBC7cZ062T6-RN30rrtUkTGMQCMDXSdtvl_6SvsKtkyaQ&oe=660898E4',
          ratign: 4.3,
        ),
      ),
    ),
    GoRoute(
      path: "/info",
      builder: (context, state) => const InfoScreen(),
    ),
  ],
);
