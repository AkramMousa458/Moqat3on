import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scanner/screens/profile/text_box.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final currenUser = FirebaseAuth.instance.currentUser!;
  // all users
  final userCollection = FirebaseFirestore.instance.collection('Users');

  //edit filed
  Future<void> editField(String field) async {
    String newValue = "";

    await showDialog(
      context: context,
      // user must tap button!
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text(
          'Edit $field',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        content: TextField(
            autocorrect: true,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Enter New $field",
              hintStyle: const TextStyle(color: Colors.grey),
            ),
            onChanged: (value) {
              newValue = value;
            }),
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
      await userCollection.doc(currenUser.email).update({field: newValue});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Users')
              .doc(currenUser.email)
              .snapshots(),
          builder:
              (context, AsyncSnapshot<DocumentSnapshot<Object?>> snapshot) {
            if (snapshot.hasData && snapshot.data!.data() != null) {
              final userData = snapshot.data!.data() as Map<String, dynamic>;

              return ListView(children: [
                const SizedBox(height: 50),
                const Icon(
                  Icons.person,
                  size: 80,
                ),
                const SizedBox(height: 16),
                Text(
                  currenUser.email!,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.only(left: 25.5),
                  child: Text(
                    'My Details',
                  ),
                ),
                CustomTextBox(
                  onPressed: () => editField('username'),
                  sectionName: 'userName',
                  text: userData['username'],
                ),
                CustomTextBox(
                  onPressed: () => editField('bio'),
                  sectionName: 'bio',
                  text: userData['bio'],
                ),
              ]);
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error:${snapshot.error}"),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
