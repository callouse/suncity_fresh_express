import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.imageUrl),
            SizedBox(height: 10),
            Text(product.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(product.description),
            Text("\$${product.price.toStringAsFixed(2)}"),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Handle "Add to Cart" functionality
              },
              child: Text("Add to Cart"),
            ),
          ],
        ),
      ),
    );
  }
}
