import 'package:go_router/go_router.dart';

void customReplacementNavigate(context,String name) {
  GoRouter.of(context).pushReplacement(name);
}

void customNavigate(context,String name) {
  GoRouter.of(context).push(name);
}
  