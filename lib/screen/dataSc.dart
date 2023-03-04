import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:log/screen/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/profile.dart';

class dataSc extends StatelessWidget {
  dataSc({super.key});
  final auth = FirebaseAuth.instance;
  final formkey = GlobalKey<FormState>();
  Profile profile = Profile(
      email: ' ',
      name: ' ',
      lastname: ' ',
      password: ' ');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 11, 215, 151),
        // leading: Icon(Icons.menu),
        title: Text('Profile'),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
          ElevatedButton.icon(
            icon: Icon(
              Icons.logout,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            label: Text(
              "",
            ),
            onPressed: () {
              auth.signOut().then((value) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return loginSc();
                }));
              });
            },style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 11, 215, 151),)
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [ Image.asset("assets/img/DD.jpg"),
              Text(
                auth.currentUser!.email!,
                style: TextStyle(fontSize: 25),
              )
              
            ],
          ),
        ),
      ),
    );
  }
}
