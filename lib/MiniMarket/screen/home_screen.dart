import 'package:flutter/material.dart';
import 'package:flutter_demo/MiniMarket/data/product_store.dart';
import 'package:flutter_demo/MiniMarket/screen/cart_screen.dart';
import 'package:flutter_demo/MiniMarket/ui/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mini Market'),
        actions: [
          // Text("count ${productList.length}"),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: productList.isNotEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('No Product Yet.'),
                  Text('Press + to add your first one.'),
                ],
              ),
            )
          : Center(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  final product = productList[index];
                  return ProductCard(
                    id: index,
                    productName: product['title'],
                    price: product['price'],
                    icon: product['icon'],
                  );
                },
              ),
            ),
    );
  }
}
