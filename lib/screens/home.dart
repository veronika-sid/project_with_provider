import 'package:flutter/material.dart';
import 'package:project_with_provider/models/product.dart';
import 'package:project_with_provider/products/items.dart';
import 'package:project_with_provider/providers/products.dart';
import 'package:project_with_provider/scalable_size/scalable_size.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  final List<Product> products = Items.products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Товары'),
        backgroundColor: Colors.deepOrange,
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/basket');
            },
            child: Row(
              children: [
                const Icon(Icons.add_shopping_cart),
                Text(Provider.of<Products>(context).items.length.toString()),
              ],
            ),
            style: ElevatedButton.styleFrom(
              elevation: 0,
                primary: Colors.transparent,
                fixedSize: Size.fromHeight(context.getScalableHeight(20))),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    products[index].photoUrl,
                    width: context.getScalableWidth(100),
                    height: context.getScalableHeight(70),
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: context.getScalableWidth(200),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(products[index].title),
                        Text(products[index].description),
                        Text(products[index].price.toString() + ' грн'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Provider.of<Products>(context, listen: false).addProductToBasket(products[index]);
                     var a = Provider.of<Products>(context, listen: false).items;
                     print(a);
                    },
                    child: const Icon(Icons.add_shopping_cart),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepOrange,
                        fixedSize: Size.fromHeight(context.getScalableHeight(20),)),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
