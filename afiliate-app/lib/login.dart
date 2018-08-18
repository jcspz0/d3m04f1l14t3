// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TODO: Add text editing controllers (101)
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SafeArea(
        child: new ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            new Column(
              children: <Widget>[
                new Image.asset('assets/diamond.png'),
                const SizedBox(height: 16.0),
                const Text('AFILIATE'),
              ],
            ),
            const SizedBox(height: 120.0),
            // TODO: Add TextField widgets (101)
            TextField(
              decoration: new InputDecoration(
                labelText: "Username",
                filled: true,
              ),
              controller: _usernameController,
            ),
            const SizedBox(height: 12.0),
            TextField(
              decoration:
                  new InputDecoration(labelText: "Username", filled: true),
              controller: _passwordController,
            ),
            // TODO: Add button bar (101)
            ButtonBar(
              children: <Widget>[
                new FlatButton(
                  onPressed: () {
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                  child: Text("CANCEL"),
                ),
                new RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("NEXT")),
              ],
            )
          ],
        ),
      ),
    );
  }
}