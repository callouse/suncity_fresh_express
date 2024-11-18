import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/cart_service.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartService = Provider.of<CartService>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Your Cart")),
      body: ListView.builder(
        itemCount: cartService.items.length,
        itemBuilder: (context, index) {
          final item = cartService.items[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text("\$${item.price.toStringAsFixed(2)}"),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle),
              onPressed: () {
                cartService.removeItem(item);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          cartService.placeOrder();
        },
        child: Text("Place Order"),
      ),
    );
  }
}
