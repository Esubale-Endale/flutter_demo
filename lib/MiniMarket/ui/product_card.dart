import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final double price;
  final IconData? icon;

  const ProductCard({
    super.key,
    required this.productName,
    required this.price,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(child: Icon(icon, size: 48)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(productName),
              Text('\$${price.toStringAsFixed(2)}'),
            ],
          ),
        ],
      ),
    );
  }
}
