import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:scanner/cubits/auth_cubit/auth_cubit.dart';

import 'package:scanner/helper/colors.dart';
import 'package:scanner/helper/show_alert_box.dart';
import 'package:scanner/helper/styles/app_text_styles.dart';
import 'package:scanner/screens/home/widgets/custom_categories_scroll_item.dart';
import 'package:scanner/screens/profile/widgets/check_signup_profile.dart';
import 'package:scanner/screens/profile/widgets/cusomt_profile_name.dart';
import 'package:scanner/screens/profile/widgets/custom_profile_image.dart';
import 'package:scanner/widgets/custom_loading_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final currenUser = FirebaseAuth.instance.currentUser;

  // all users
  final userCollection = FirebaseFirestore.instance.collection('users');

  //edit filed
  Future<void> editField(String field) async {
    String newValue = "";

    await showDialog(
      context: context,
      // user must tap button!
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: AppColors.offwhite,
        title: Text(
          'تعديل $field',
          textDirection: TextDirection.rtl,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        content: Directionality(
          textDirection: TextDirection.rtl,
          child: TextField(
              autocorrect: true,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "أدخل $field الجديد",
                hintStyle: const TextStyle(color: Colors.grey),
              ),
              onChanged: (value) {
                newValue = value;
              }),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel',
              )),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(newValue);
            },
            child: const Text('Update'),
          )
        ],
      ),
    );

    // updata in firestore
    if (newValue.trim().isNotEmpty) {
      await userCollection.doc(currenUser?.email).update({field: newValue});
    }
  }

  int isColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offwhite,
      appBar: AppBar(
        title: const Text("الملف الشخصي"),
        centerTitle: true,
      ),
      body: currenUser?.email != null
          ? StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(currenUser?.email)
                  .snapshots(),
              builder:
                  (context, AsyncSnapshot<DocumentSnapshot<Object?>> snapshot) {
                if (snapshot.hasData && snapshot.data!.data() != null) {
                  final userData =
                      snapshot.data!.data() as Map<String, dynamic>;

                  return ListView(
                    children: [
                      const SizedBox(height: 20),
                      const CustomProfileImage(),
                      const SizedBox(height: 16),
                      CustomProfileName(
                        text: userData['name']!,
                        style: CustomTextStyle.stylesFont400Size22,
                      ),
                      CustomProfileName(
                        text: userData['email']!,
                        style: CustomTextStyle.stylesFont300Size16,
                      ),
                      const SizedBox(height: 12),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  isColor = 0;
                                  editField("email");
                                  editField('name');
                                },
                              );
                            },
                            child: CustomCategoriesScrollItem(
                              width: 120,
                              text: "تعديل البيانات",
                              isColor: isColor == 0,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  isColor = 1;
                                  showAlertBox(
                                    context: context,
                                    bodyText: 'متأكد هل تريد تسجيل الخروج',
                                    confirmText: 'نعم',
                                    confirmAction: () {
                                      FirebaseAuth.instance.signOut();
                                      GoRouter.of(context).go('/');
                                    },
                                  );
                                },
                              );
                            },
                            child: CustomCategoriesScrollItem(
                              width: 120,
                              text: "خروج",
                              isColor: isColor == 1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Error:${snapshot.error}"),
                  );
                } else {
                  return const Center(
                    child: CustomLoadingWidget(),
                  );
                }
              })
          : const CheckSignUpProfile(),
    );
  }
}
