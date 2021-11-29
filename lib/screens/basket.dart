import 'package:flutter/material.dart';
import 'package:project_with_provider/models/product.dart';
import 'package:project_with_provider/providers/products.dart';
import 'package:project_with_provider/scalable_size/scalable_size.dart';
import 'package:provider/provider.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> items = Provider.of<Products>(context).items;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
        backgroundColor: Colors.deepOrange,
      ),
      floatingActionButton: TextButton(
        onPressed: () {  },
        child: const Text('Купить', style: TextStyle(fontSize: 20),),
      style: TextButton.styleFrom(
        backgroundColor: Colors.deepOrange,
          fixedSize: Size(MediaQuery.of(context).size.width,
              context.getScalableHeight(50)),
        primary: Colors.white
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: context.getScalableHeight(600),
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(
                          items[index].photoUrl,
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
                              Text(items[index].title),
                              Text(items[index].description),
                              Text(items[index].price.toString() + ' грн'),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Icon(Icons.add_shopping_cart),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.deepOrange,
                              fixedSize: Size.fromHeight(
                                  context.getScalableHeight(20))),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.deepOrange, width: 1))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: context.getScalableHeight(10),
                ),
                Text(
                  'Общая стоимость: ${Provider.of<Products>(context).totalCost.toString()} грн',
                  style:
                      const TextStyle(fontSize: 20, color: Colors.deepOrange),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
