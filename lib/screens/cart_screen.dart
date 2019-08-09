import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: productProvider.cartItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(productProvider.cartItems.elementAt(index).title);
                },
              ),
            ),
          ),
          Container(
            color: Colors.black,
            height: 4,
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '\$${productProvider.calculateTotalPrice().toString()}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  RaisedButton(
                    elevation: 0,
                    child: Text('BUY'),
                    color: Colors.white,
                    textColor: Color(0xFF000000),
                    onPressed: () {
                      print('Items bought');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
