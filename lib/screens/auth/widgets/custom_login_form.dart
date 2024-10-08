import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/cubits/auth_cubit/auth_cubit.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/helper/navigation.dart';
import 'package:scanner/helper/show_custom_snack_bar.dart';
import 'package:scanner/helper/show_snackbar.dart';
import 'package:scanner/screens/auth/widgets/custom_button.dart';
import 'package:scanner/screens/auth/widgets/custom_google_sign_button.dart';
import 'package:scanner/screens/auth/widgets/custom_text_form_auth.dart';
import 'package:scanner/screens/home/navigator_widget.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInSccessState) {
          FirebaseAuth.instance.currentUser!.emailVerified
              ? customGoNavigate(context, NavigatorWidget.routeName)
              : showBottomSnackBar(context, 'يرجي فحص الجيميل للتفعيل أولاََ');
        } else if (state is SignInFailureState) {
          showCustomSnackBar(
            context: context,
            text: state.error.toString(),
            status: false,
          );
        } else if (state is SignInGoogleFailureState) {
          showCustomSnackBar(
            context: context,
            text: state.error.toString(),
            status: false,
          );
        } else if (state is SignInGoogleSccessState) {
          customGoNavigate(context, NavigatorWidget.routeName);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();

        return Form(
          key: formKeyLogin,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomTextFormFAuth(
                  labelText: "البريد الإلكتروني",
                  onChanged: (email) {
                    authCubit.emailAddress = email;
                  }),
              CustomTextFormFAuth(
                  obscureText: authCubit.obscureText,
                  suffixIcon: IconButton(
                    onPressed: () {
                      authCubit.toggleObscureText();
                    },
                    icon: Icon(
                      authCubit.obscureText == true
                          ? Icons.visibility_off
                          : Icons.visibility_outlined,
                      color: AppColors.lightGrey,
                    ),
                  ),
                  labelText: "كلمة السر",
                  onChanged: (password) {
                    authCubit.password = password;
                  }),
              const SizedBox(height: 30),
              CustomButtonApp(
                onPressed: () async {
                  if (formKeyLogin.currentState!.validate()) {
                    await authCubit.signINWithEmailAndPassword();
                  }
                },
                isLoading: state is SignInLoadingState ? true : false,
                text: "تسجيل الدخول",
              ),
              const SizedBox(height: 24),
              CustomGoogleSignButton(
                isLoading: state is SignInGoogleLoadingState ? true : false,
              ),
            ],
          ),
        );
      },
    );
  }
}
