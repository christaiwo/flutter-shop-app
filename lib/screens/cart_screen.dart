import 'package:flutter/material.dart';
import 'package:shop_app/utils/data/product_data.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
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
              onPressed: () {},
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
