import 'package:flutter/material.dart';
import 'package:google_provider_emo/screens/cart_screen.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';

class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Catalog',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CartScreen();
              }));
            },
          ),
        ],
      ),
      body: Container(
        //padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productProvider.products.length,
          itemBuilder: (
            BuildContext context,
            int index,
          ) {
            return ListTile(
              leading: Container(
                width: 40,
                height: 40,
                color: productProvider.products.elementAt(index).color,
              ),
              title: Text(productProvider.products.elementAt(index).title),
              trailing: FlatButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: productProvider.products.elementAt(index).isSold == true
                    ? Icon(Icons.done)
                    : Text('ADD'),
                onPressed: () => productProvider.addOrRemoveProductCart(index),
              ),
            );
          },
        ),
      ),
    );
  }
}
