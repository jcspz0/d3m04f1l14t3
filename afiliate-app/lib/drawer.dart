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
          leading: Icon(Icons.info),
          onTap: () {
            Navigator.of(ctxt).pop();
            Navigator.of(ctxt).pushNamed("/quienes_somos");
          },
        ),
        new ListTile(
          title: new Text("QR"),
          leading: Icon(Icons.info),
          onTap: () {
            Navigator.of(ctxt).pop();
            Navigator.of(ctxt).pushNamed("/qrscan");
          },
        ),
        new ListTile(
          title: new Text("Salir"),
          leading: Icon(Icons.exit_to_app),
          onTap: () {
            return showDialog(
                  context: ctxt,
                  child: new AlertDialog(
                    title: new Text('Estás seguro?'),
                    actions: <Widget>[
                      new FlatButton(
                        onPressed: () => Navigator.of(ctxt).pop(false),
                        child: new Text('No'),
                      ),
                      new FlatButton(
                        onPressed: () => Navigator
                            .of(ctxt)
                            .pushNamedAndRemoveUntil(
                                '/login', (Route<dynamic> route) => false),
                        child: new Text('Si'),
                      ),
                    ],
                  ),
                ) ??
                false;
          },
        ),
      ],
    ));
  }
}
