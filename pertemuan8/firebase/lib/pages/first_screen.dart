// Copyright (c) 2019 Souvik Biswas

import 'package:flutter/material.dart';
import 'package:firebase/pages/login_page.dart';
import 'package:firebase/pages/sign_in.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue[100], Colors.blue[400]],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(
                  imageUrl,
                ),
                radius: 60,
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(height: 40),
              const Text(
                'NAME',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black54),
              ),
              Text(
                name,
                style: const TextStyle(fontSize: 25, color: Colors.deepPurple, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                'EMAIL',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black54),
              ),
              Text(
                email,
                style: const TextStyle(fontSize: 25, color: Colors.deepPurple, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  signOutGoogle();

                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {
                    return const LoginPage();
                  }), ModalRoute.withName('/'));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                  elevation: MaterialStateProperty.all<double>(5.0),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                //color: Colors.deepPurple,
                //elevation: 5,
                //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Sign Out',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
