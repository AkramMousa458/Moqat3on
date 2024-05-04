import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/cubits/auth_cubit/auth_cubit.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/widgets/custom_loading_widget.dart';

class CustomGoogleSignButton extends StatelessWidget {
  const CustomGoogleSignButton({
    super.key, required this.isLoading,
    
  });
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await context.read<AuthCubit>().signInWithGoogle();
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(left: 16, right: 18),
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.lightGrey.withOpacity(0.7),
          borderRadius: BorderRadius.circular(14),
        ),
        child: 
        isLoading ? const Center(child: CustomLoadingWidget()) : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/google.png",
              width: 22,
            ),
            const SizedBox(
              width: 14,
            ),
            const Text(
              'تسجيل الدخول بإستخدام جوجل ',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
