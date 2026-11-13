import 'package:flutter/material.dart';
import 'package:shopping_app/core/theme/app_theme.dart';
import 'package:shopping_app/core/routes/app_routes.dart';
import 'package:shopping_app/features/home/data/repositories/order_repository.dart';
import 'package:shopping_app/features/home/data/repositories/cart_repository.dart';
import 'package:shopping_app/features/home/data/repositories/favorite_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await OrderRepository.loadOrders();
  await CartRepository.loadCart();
  await FavoriteRepository.loadFavorites();

  runApp(const ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'STYLE UP',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    );
  }
}
