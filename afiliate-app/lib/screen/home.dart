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
import 'package:Afiliate/component/container_list.dart';

import 'package:Afiliate/component/drawer.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:Afiliate/component/carousel.dart';

import 'package:Afiliate/model/product.dart';
import 'package:intl/intl.dart';
import 'package:Afiliate/model/data.dart';
import 'package:Afiliate/screen/detail.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
  }) : super(
          key: key,
        );

  //BuildContext context;

  @override
  Home createState() => new Home();

  /*Home getHome(){
    return myHome;
  }*/

}

//class Home extends StatelessWidget {
class Home extends State<HomePage> {
  //BuildContext context;

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
              getCarousel(),
              getContainerList(context),
              getContainerList(context),
              getContainerList(context),
            ],
          ),
        ),
      ),
    );
  }

  /*Widget _myCacheNetworkImage(String url) {
    return new CachedNetworkImage(
      imageUrl: url,
      placeholder: new CircularProgressIndicator(),
      errorWidget: new Icon(Icons.error),
      fadeOutDuration: new Duration(seconds: 1),
      fadeInDuration: new Duration(seconds: 3),
    );
  }*/

  //---------------
  Widget getContainerList(context) {
    return new Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 200.0,
      child: ListView(
          scrollDirection: Axis.horizontal, children: _buildCards(context)),
    );
  }

  List<Widget> _buildCards(BuildContext context) {
    List<Widget> items = new List();
    List<Product> products = getProducts(Category.all);
    if (products != null && products.isEmpty) {}
    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());
    products.map((product) {
      items.add(_getCard(product, theme, formatter, context));
    }).toList();
    print(items);
    return items.map((i) {
      return i;
    }).toList();
  }

  Product productSelected;

  _onTapGoDetail(Product product) {
    setState(() {
      //productSelected = product;

      //Navigator.of(context).pushNamed("/detail");

      Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (BuildContext context) => new DetailPage(product: product),
          ));
    });
  }

  Widget _getCard(Product product, ThemeData theme, NumberFormat formatter,
      BuildContext context) {
    return new GestureDetector(
      onTap: () {
        _onTapGoDetail(product);
      },
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
}
