import 'package:flutter/material.dart';



class ForgetPasswrod extends StatefulWidget {
  ForgetPasswrod({Key? key}) : super(key: key);

  @override
  State<ForgetPasswrod> createState() => _ForgetPasswrodState();
}

class _ForgetPasswrodState extends State<ForgetPasswrod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        "忘记密码"
      ),
      ),
      body: Container(
        child: Text("dddd"),
      ),
    );
  }
}