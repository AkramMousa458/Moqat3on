import 'package:scanner/screens/category_screen.dart';
import 'package:scanner/screens/home_screen.dart';
import 'package:scanner/screens/info_screen.dart';
import 'package:scanner/screens/splash_screen.dart';

var routes = {
 SplashScreen.routeName: (context)=> const SplashScreen(),
 HomeScreen.routeName: (context)=> const HomeScreen(),
 CategoryScreen.routeName: (context)=> CategoryScreen(),
 InfoScreen.routeName: (context)=> const InfoScreen(),
};