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
import 'package:intl/intl.dart';

import 'model/data.dart';
import 'model/product.dart';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:Afiliate/drawer.dart';
import 'dart:async';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: DrawerWidget(),
      appBar: new AppBar(
        title: Text('AFILIATE'),
        //leading: new IconButton(
        //  icon: Icon(Icons.menu), onPressed: () => debugPrint("Menu button")),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search),
              onPressed: () => debugPrint("search touched")),
          new IconButton(
              icon: Icon(Icons.tune),
              onPressed: () => debugPrint("tune touched")),
        ],
      ),
      body: new Center(
        child: new Container(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              _carousel(),
              _containerList(context),
              _containerList(context),
              _containerList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _carousel() {
    return new SizedBox(
        height: 100.0,
        width: 300.0,
        child: new Carousel(
          images: [
            new NetworkImage(
                'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
            new NetworkImage(
                'https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
            new ExactAssetImage("assets/images/LaunchImage.jpg")
          ],
        ));
  }

  

  void _onTap() {
    print("object");
  }

  Widget _getCard(Product product, ThemeData theme, NumberFormat formatter) {
    return new GestureDetector(
      onTap: _onTap,
      child: new Container(
        width: 160.0,
        color: Colors.blueAccent,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 18.0 / 11.0,
                child: Image.asset(
                  product.assetName,
                  package: product.assetPackage,
                  fit: BoxFit.fitWidth,
                ),
              ),
              new Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        product.name,
                        style: theme.textTheme.title,
                        maxLines: 1,
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        formatter.format(product.price),
                        style: theme.textTheme.body2,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildCards(BuildContext context) {
    List<Widget> items = new List();
    List<Product> products = getProducts(Category.all);
    if (products != null && products.isEmpty) {
      products.add(Product(
        category: Category.accessories,
        id: 0,
        isFeatured: true,
        name: 'Vagabond sack1',
        price: 120,
      ));
    }
    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());
    products.map((product) {
      items.add(_getCard(product, theme, formatter));
    }).toList();
    print(items);
    return items.map((i) {
      return i;
    }).toList();
  }

  Widget _containerList(context) {
    return new Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 200.0,
      child: ListView(
          scrollDirection: Axis.horizontal, children: _buildCards(context)),
    );
  }
}
