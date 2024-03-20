import 'package:flutter/material.dart';
import 'package:scanner/helper/navigation.dart';
import 'package:scanner/screens/auth/widgets/custom_create_form.dart';
import 'package:scanner/screens/auth/widgets/custom_text_have_account.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 100, right: 50),
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 200,
                    height: 200,
                  ),
                ),
                const CustomCreateAccountForm(),
                const SizedBox(height: 30),
                CustomTextHaveAccount(
                  onTap: () {
                    customNavigate(context, '/login');
                  },
                  textAlready: "  Don't have an account?",
                  textlogin: " Sign In",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
