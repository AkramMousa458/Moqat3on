import 'package:flutter/material.dart';
import 'package:scanner/helper/navigation.dart';
import 'package:scanner/screens/auth/widgets/custom_create_form.dart';
import 'package:scanner/screens/auth/widgets/custom_text_have_account.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                "assets/images/login.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.8),
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 70, left: 50, right: 50),
                      child: Image.asset(
                        "assets/images/hand.png",
                        width: 150,
                        height: 150,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const CustomCreateAccountForm(),
                    const SizedBox(height: 30),
                    CustomTextHaveAccount(
                      onTap: () {
                        customGoNavigate(context, '/login');
                      },
                      textAlready: "  Don't have an account?",
                      textlogin: " Sign In",
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
