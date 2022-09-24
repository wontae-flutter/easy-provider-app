import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/screens/screen_item.dart';
import 'package:provider_app/screens/screen_cart.dart';
import 'package:provider_app/models/cart.dart';
import 'package:provider_app/repositories/item_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Cart()),
        //* ItemList와 같이 정적인 데이터도 부모에서 Provider로 선언해주면
        //* 자식들은 매번 itemList를 새롭게 만들 필요 없이 받아서 쓸 수 있다
        Provider(create: (_) => ItemList()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          "/": (context) => ItemScreen(),
          "/cart": (context) => CartScreen(),
        },
      ),
    );
  }
}
