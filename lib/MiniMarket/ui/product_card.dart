import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final int id;
  final String productName;
  final double price;
  final IconData? icon;

  const ProductCard({
    super.key,
    required this.id,
    required this.productName,
    required this.price,
    this.icon,
  });

  List<Color> getColor(int id) {
    return switch (id % 6) {
      1 => [const Color(0x33FF6B6B), const Color(0xFFFF6B6B)],
      2 => [const Color(0x334D96FF), const Color(0xFF4D96FF)],
      3 => [const Color(0x3355C878), const Color(0xFF55C878)],
      4 => [const Color(0x33A66CFF), const Color(0xFFA66CFF)],
      5 => [const Color(0x33FFB84D), const Color(0xFFFFB84D)],
      _ => [const Color(0x3340C9B0), const Color(0xFF40C9B0)],
    };
  }

  @override
  Widget build(BuildContext context) {
    List<Color> color = getColor(id);
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                color: color[0],
                child: Icon(icon, size: 48, color: color[1]),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productName),
                Text('\$${price.toStringAsFixed(2)}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
