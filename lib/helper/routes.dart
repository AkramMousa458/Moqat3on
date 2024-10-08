import 'package:go_router/go_router.dart';
import 'package:scanner/models/product_model.dart';
import 'package:scanner/screens/about_screen.dart';
import 'package:scanner/screens/auth/login_screen.dart';
import 'package:scanner/screens/home/home_screen.dart';
import 'package:scanner/screens/home/navigator_widget.dart';
import 'package:scanner/screens/products_profiles/product_screen.dart';
import 'package:scanner/screens/profile/profile_screen.dart';
import 'package:scanner/screens/profile/widgets/check_signup_profile.dart';
import 'package:scanner/screens/settings_screen.dart';
import 'package:scanner/screens/splash_screen.dart';

import '../screens/auth/create_account.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: SplashScreen.routeName,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: CreateAccount.routeName,
      builder: (context, state) => const CreateAccount(),
    ),
    GoRoute(
      path: HomeScreen.routeName,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AboutScreen.routeName,
      builder: (context, state) => const AboutScreen(),
    ),
    GoRoute(
      path: ProfileScreen.routeName,
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: NavigatorWidget.routeName,
      builder: (context, state) => const NavigatorWidget(),
    ),
    GoRoute(
      path: ProductScreen.routeName,
      builder: (context, state) => ProductScreen(
        productModel: state.extra as ProductModel,
      ),
    ),
    GoRoute(
      path: CheckSignUpProfile.routeName,
      builder: (context, state) => const CheckSignUpProfile(),
    ),
    GoRoute(
      path: SettingsScreen.routeName,
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);
