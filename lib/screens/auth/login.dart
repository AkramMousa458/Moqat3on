import 'package:flutter/material.dart';
import 'package:scanner/helper/navigation.dart';
import 'package:scanner/screens/auth/widgets/custom_login_form.dart';
import 'package:scanner/screens/auth/widgets/custom_text_have_account.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 100, right: 50),
              child: Image.asset(
                "assets/images/logo.png",
                width: 200,
                height: 200,
              ),
            ),
            const CustomLoginForm(),
            const SizedBox(
              height: 16,
            ),
            CustomTextHaveAccount(
              onTap: () {
                customNavigate(context, "/createAccount");
              },
              textAlready: " Don't have an account?",
              textlogin: " Sign Up",
            ),
          ],
        ),
      ),
    );
  }
}
