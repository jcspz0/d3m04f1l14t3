import 'package:flutter/material.dart';


class DrawerWidget extends StatelessWidget {
  Route route;

  @override
  Widget build(BuildContext ctxt) {
    return new Drawer(
        child: new ListView(
      children: <Widget>[
        new UserAccountsDrawerHeader(
          accountName: const Text('Juan Suarez'),
          accountEmail: const Text('juan.suarez@gmail.com'),
          currentAccountPicture: const CircleAvatar(
              backgroundImage: ExactAssetImage('assets/avatar-2.jpg')),
        ),
        new ListTile(
          title: new Text("Quienes Somos"),
          leading: Icon(Icons.insert_drive_file),
          onTap: () {
            Navigator.of(ctxt).pop();
            Navigator.of(ctxt).pushNamed("/information");
          },
        ),
        new ListTile(
          title: new Text("QR"),
          leading: Icon(Icons.web),
          onTap: () {
            Navigator.of(ctxt).pop();
            Navigator.of(ctxt).pushNamed("/qrscan");
          },
        ),
        
      ],
    ));
  }
}
