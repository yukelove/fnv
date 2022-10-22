import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App 首页"),
      ),
      body: ListView.builder(itemCount: 100,itemBuilder: (ctx,index){
        return Text("${index}");
      }),
    );
  }
}