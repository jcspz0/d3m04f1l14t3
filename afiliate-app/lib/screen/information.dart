import 'package:flutter/material.dart';
import 'package:Afiliate/component/drawer.dart';

class Information extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new MaterialApp(
        title: 'Quienes Somos',
        home: new InformationPage(),
        debugShowCheckedModeBanner: false);
  }
}

class InformationPage extends StatefulWidget {
  InformationPage({Key key, this.title}) : super(key: key);

  final String title;

  final Map<String, dynamic> pluginParameters = {};

  @override
  _MyInformationPageState createState() => new _MyInformationPageState();
}

class _MyInformationPageState extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Quienes Somos'),
      ),
      drawer: DrawerWidget(),
      body: new Center(child: new ListView()),
    );
  }
}
