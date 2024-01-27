import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/utils/providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final carts = Provider.of<CartProvider>(context).carts;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carts'),
      ),
      body: ListView.builder(
        itemCount: carts.length,
        itemBuilder: (context, index) {
          final item = carts[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(
                item['imageUrl'].toString(),
              ),
              radius: 30,
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      icon: const Icon(
                        Icons.delete,
                        size: 40,
                        color: Colors.red,
                      ),
                      title: Text(
                        'Remove Product',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      content: Text(
                        'Are you sure you want to remove the product from your cart?',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'No',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: Colors.blue),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Provider.of<CartProvider>(context, listen: false)
                                .removeProduct(item);
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Yes',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.red),
                          ),
                        )
                      ],
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
            title: Text(
              item['title'].toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text(
              'Size ${item['size'].toString()}',
            ),
          );
        },
      ),
    );
  }
}
