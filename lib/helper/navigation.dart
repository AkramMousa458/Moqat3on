import 'package:go_router/go_router.dart';

void customReplacementNavigate(context, String name) {
  GoRouter.of(context).pushReplacement(name);
}

void customNavigate(context, String name) {
  GoRouter.of(context).push(name);
}

void customGoNavigate(context, String name) {
  //Navigate with remove all befor screens
  GoRouter.of(context).go(name);
}
