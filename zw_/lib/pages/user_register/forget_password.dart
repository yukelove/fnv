import 'package:flutter/material.dart';
import 'package:zw_/generated/l10n.dart';


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
        S.of(context).forgotpassword
      ),
      ),
      body: Container(
        child: Text("dddd"),
      ),
    );
  }
}