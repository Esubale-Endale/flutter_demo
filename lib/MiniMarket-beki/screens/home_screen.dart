import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/MiniMarket-beki/screens/ui/product_card.dart';

import '../bloc/product_bloc.dart';

import '../data/market_store.dart';
import '../models/product.dart';
import 'cart_screen.dart';
import 'product_detail_screen.dart';
import 'product_form_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _openProduct(Product product) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailScreen(productId: product.id),
      ),
    );
  }

  Future<void> _openCart() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) => CartScreen()),
    );
  }

  Future<void> _openAddProduct() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProductFormScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductInitial) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is ProductLoaded) {
          final products = state.products;
          return Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: const Text(
                'Mini Market',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              actions: [
                GestureDetector(
                  onTap: _openCart,
                  child: Badge(
                    isLabelVisible: MarketStore.cartCount > 0,
                    label: Text("${MarketStore.cartCount}"),
                    child: Icon(Icons.shopping_cart),
                  ),
                ),
                const SizedBox(width: 8),
              ],
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(1),
                child: Divider(height: 1),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: products.isEmpty
                  ? const Center(
                      child: Text(
                        'No products yet.\nTap + to add your first one.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : GridView.builder(
                      itemCount: products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.85,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        Product product = products[index];
                        return ProductCard(
                          product: products[index],
                          onTap: () => {_openProduct(product)},
                        );
                      },
                    ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: _openAddProduct,
              child: const Icon(Icons.add),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
