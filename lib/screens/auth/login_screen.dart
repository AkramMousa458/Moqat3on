import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/cubits/auth_cubit/auth_cubit.dart';
import 'package:scanner/helper/navigation.dart';
import 'package:scanner/helper/styles/app_text_styles.dart';
import 'package:scanner/screens/auth/widgets/custom_login_form.dart';
import 'package:scanner/screens/auth/widgets/custom_text_have_account.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
            height: MediaQuery.of(context).size.height,
            color: Colors.black.withOpacity(0.8),
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 12),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          customGoNavigate(context, '/navigator');
                          BlocProvider.of<AuthCubit>(context).skipUser();
                        },
                        child: Text(
                          'Skip',
                          style: CustomTextStyle.stylesFont500Size16.copyWith(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 70, left: 50, right: 50),
                    child: Image.asset(
                      "assets/images/hand.png",
                      width: 150,
                      height: 150,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const CustomLoginForm(),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextHaveAccount(
                    onTap: () {
                      customGoNavigate(context, "/createAccount");
                    },
                    textAlready: " Don't have an account?",
                    textlogin: " Sign Up",
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
