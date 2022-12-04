import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressDialog extends Dialog {
  const ProgressDialog({
    Key? key,
    this.hintText = '',
  }) : super(key: key);

  final String hintText;

  @override
  Widget build(BuildContext context) {
    final Widget progress = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: ThemeData(
            cupertinoOverrideTheme: const CupertinoThemeData(
              brightness: Brightness.dark, 
            ),
          ),
          child: const CupertinoActivityIndicator(radius: 14.0),
        ),
        SizedBox(height: 8,),
        Text(
          hintText,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );

    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          height: 88.0,
          width: 120.0,
          decoration: const ShapeDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
          child: progress,
        ),
      ),
    );
  }
}
