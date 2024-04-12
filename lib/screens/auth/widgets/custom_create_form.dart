import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/cubits/auth_cubit/auth_cubit.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/helper/navigation.dart';
import 'package:scanner/helper/show_custom_snack_bar.dart';
import 'package:scanner/helper/show_snackbar.dart';
import 'package:scanner/screens/auth/widgets/custom_button.dart';
import 'package:scanner/screens/auth/widgets/custom_sign_google.dart';
import 'package:scanner/screens/auth/widgets/custom_text_form_auth.dart';
import 'package:scanner/widgets/custom_loading_widget.dart';

class CustomCreateAccountForm extends StatelessWidget {
  const CustomCreateAccountForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is CreateAccountSccessState) {
          showBottomSnackBar(
            context,
            'تم التسجيل بنجاح, يرجي فحص الجيميل للتفعيل',
          );
          customGoNavigate(context, '/login');
        } else if (state is CreateAccountFailureState) {
          showCustomSnackBar(
            context: context,
            text: state.error.toString(),
            status: false,
          );
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.formKeySignUp,
          child: Column(
            children: [
              CustomTextFormFAuth(
                  labelText: 'إسم المستخدم',
                  onChanged: (name) {
                    authCubit.userName = name;
                  }),
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
              const SizedBox(height: 24),
              state is CreateAccountLoadingState
                  ? const Center(child: CustomLoadingWidget())
                  : CustomButtonApp(
                      onPressed: () async {
                        if (authCubit.formKeySignUp.currentState!.validate()) {
                          await authCubit.signUpWithEmailAndPassword();
                        }
                      },
                      text: "تسجيل الحساب",
                    ),
              const SizedBox(height: 24),
              state is SignInGoogleLoadingState
                  ? const Center(child: CustomLoadingWidget())
                  : const CustomSignWithGoogle(),
            ],
          ),
        );
      },
    );
  }
}
