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

import 'package:Afiliate/screen/home.dart';
import 'package:Afiliate/screen/information.dart';
import 'package:Afiliate/screen/login.dart';
import 'package:Afiliate/screen/detail.dart';

class AfiliateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Afiliate',
      home: new HomePage(),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        {
          return MaterialPageRoute<void>(
            settings: settings,
            builder: (BuildContext context) => LoginPage(),
            fullscreenDialog: true,
          );
        }

      case '/information':
        {
          return MaterialPageRoute<void>(
            settings: settings,
            builder: (BuildContext context) => Information(),
            fullscreenDialog: true,
          );
        }

      case '/detail':
        {
          return MaterialPageRoute<void>(
            settings: settings,
            builder: (BuildContext context) => DetailPage(),
            fullscreenDialog: true,
          );
        }

      default:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (BuildContext context) => HomePage(),
          fullscreenDialog: true,
        );
    }
  }
}
