import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import 'package:provider_app/models/cart.dart';
import 'package:provider_app/models/item.dart';
import 'package:provider_app/repositories/item_list.dart';

//* ItemList, Cart 모두 상위 Provider에서 제공합니다
class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final itemList = Provider.of<ItemList>(context);
    List<Item> items = itemList.getItems();

    return Scaffold(
      appBar: AppBar(title: Text("Item List"), actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/cart");
            },
            icon: Icon(Icons.shopping_cart))
      ]),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Builder(builder: (context) {
            bool isInCart = cart.items.contains(items[index]);
            return ListTile(
              title: Text(items[index].title),
              subtitle: Text(items[index].price.toString()),
              trailing: isInCart
                  ? Icon(Icons.check)
                  : IconButton(
                      onPressed: () {
                        cart.addItem(items[index]);
                      },
                      icon: Icon(Icons.add),
                    ),
            );
          });
        },
      ),
    );
  }
}
