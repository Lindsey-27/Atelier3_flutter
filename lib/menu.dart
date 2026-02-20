import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class MenuPage extends StatelessWidget {
  final Widget child;

  const MenuPage({super.key, required this.child});

  int _calculateIndex(BuildContext context) {
    final location = GoRouterState
        .of(context)
        .uri
        .toString();

    if (location.startsWith('/liste')) return 1;
    if (location.startsWith('/auth')) return 2;
    return 0;
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: child,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _calculateIndex(context),
          onTap: (index) {
            switch (index) {
              case 0:
                context.go('/');
                break;
              case 1:
                context.go('/liste');
                break;
              case 2:
                context.go('/auth');
                break;
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Panier',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Auth',
            ),
          ],
        ),
      );
    }
  }



