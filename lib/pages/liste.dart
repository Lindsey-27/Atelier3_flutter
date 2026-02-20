import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class  ListePage extends StatefulWidget {
  const ListePage({super.key});
  @override
  State<ListePage> createState() => _ListePageState();
}
class _ListePageState extends State<ListePage> {

    @override
    Widget build(BuildContext context) {
      final cart = context.watch<CartProvider>();

      return Scaffold(
        appBar: AppBar(
          title: const Text("Panier"),
        ),
        body: cart.items.isEmpty
            ? const Center(child: Text("Votre panier est vide"))
            : Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  final item = cart.items[index];
                  return ListTile(
                    leading: Image.asset(item.image, width: 50, height: 50, fit: BoxFit.cover),
                    title: Text(item.title),
                    subtitle: Text("${item.price.toStringAsFixed(2)} €"),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        cart.remove(item);
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total : ${cart.total.toStringAsFixed(2)} €",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Validation de commande
                      cart.clear();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Commande validée !"),
                        ),
                      );
                    },
                    child: const Text("Valider"),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }
}
