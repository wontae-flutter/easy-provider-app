import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import 'package:provider_app/models/cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //* Consumer, 프로바이더에서부터 상태를 받는 소비영역인데
    final cart = Provider.of<Cart>(context);
    final items = cart.items;
    return Scaffold(
      appBar: AppBar(
        title: Text('내 카트'),
        actions: [
          Center(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                '총액 : ' + cart.getTotalItemPrice(items).toString(),
                style: TextStyle(fontSize: 15),
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Builder(
            builder: (context) {
              return ListTile(
                title: Text(items[index].title),
                subtitle: Text(items[index].price.toString()),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    //* 아래와 같이 프로바이더에게 상태변화를 알려주는 것도 할 수 있습니다
                    //* 결론적으로 동시에 변화된 상태를 소비할 수 있는 것이죠.
                    cart.deleteItem(items[index].id);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
