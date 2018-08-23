import 'package:flutter/material.dart';
import 'package:Afiliate/model/product.dart';

class DetailPage extends StatefulWidget {
  final Product product;

  DetailPage({Key key, this.product}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  //final String title;

  @override
  Detail createState() => new Detail(product);
}

class Detail extends State<DetailPage> {
//class Detail extends StatelessWidget {
  Product product;

  /*Detail() {
    this.product = new Product(
      category: Category.clothing,
      id: 33,
      isFeatured: true,
      name: 'Cerise scallop tee',
      price: 42,
    );
  }*/

  Detail(Product product) {
    this.product = product;
  }

  Widget titleSection() {
    return new Container(
      padding: const EdgeInsets.all(10.0),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    '${product.name}',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                ),
                new Text(
                  'Precio Bs. ${product.price}',
                  style: new TextStyle(
                    color: Colors.grey[700],
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget textSection() {
    return new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''
${product.description}
        ''',
        style: new TextStyle(
          fontSize: 20.0,
        ),
        softWrap: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Chef Service'),
        ),
        body: new ListView(
          children: [
            new Image.asset(
              product.assetName,
              package: product.assetPackage,
              fit: BoxFit.fitWidth,
            ),
            //cantSection(),
            titleSection(),
            textSection(),
          ],
        ),
      ),
    );
  }

  /*Widget cantSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: IconButton(
              icon: new Image.asset(
                "images/menos.png",
                width: 600.0,
                height: 240.0,
                fit: BoxFit.cover,
              ),
              onPressed: () {
                setState(() {
                  if (plato.cantidad > 0) {
                    plato.cantidad = plato.cantidad - 1;
                  }
                });
              },
            ),
          ),
          Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
              child: Text("${plato.cantidad}")),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: IconButton(
              icon: new Image.asset(
                "images/mas.png",
                width: 600.0,
                height: 240.0,
                fit: BoxFit.cover,
              ),
              onPressed: () {
                setState(() {
                  plato.cantidad = plato.cantidad + 1;
                });
              },
            ),
          ),
        ],
      ),
    );
  }*/
}
