import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter app using Mason template"),),
      body: Center(child: Text(
          "Read README.md file to configure this project as per you choice"),),
    );
  }

}