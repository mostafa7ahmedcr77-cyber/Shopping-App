import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/features/home/data/models/product_model.dart';
import 'package:shopping_app/features/home/data/repositories/product_repository.dart';

class CartRepository {
  static const String cartKey = 'saved_cart';

  static final List<ProductModel> cartItems = [];
  static final Map<ProductModel, int> quantities = {};

  static Future<void> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final savedCart = prefs.getStringList(cartKey);

    cartItems.clear();
    quantities.clear();

    if (savedCart == null) return;

    for (final item in savedCart) {
      final data = jsonDecode(item);
      final productName = data['name'];
      final quantity = data['quantity'];

      final matchingProducts = ProductRepository.products.where(
        (product) => product.name == productName,
      );

      if (matchingProducts.isNotEmpty) {
        final product = matchingProducts.first;

        cartItems.add(product);
        quantities[product] = quantity;
      }
    }
  }

  static Future<void> saveCart() async {
    final prefs = await SharedPreferences.getInstance();

    final savedCart = cartItems.map((product) {
      return jsonEncode({
        'name': product.name,
        'quantity': getQuantity(product),
      });
    }).toList();

    await prefs.setStringList(cartKey, savedCart);
  }

  static void addToCart(ProductModel product) {
    if (cartItems.contains(product)) {
      quantities[product] = getQuantity(product) + 1;
    } else {
      cartItems.add(product);
      quantities[product] = 1;
    }

    saveCart();
  }

  static void removeFromCart(ProductModel product) {
    cartItems.remove(product);
    quantities.remove(product);
    saveCart();
  }

  static void increaseQuantity(ProductModel product) {
    if (cartItems.contains(product)) {
      quantities[product] = getQuantity(product) + 1;
      saveCart();
    }
  }

  static void decreaseQuantity(ProductModel product) {
    final quantity = getQuantity(product);

    if (quantity > 1) {
      quantities[product] = quantity - 1;
      saveCart();
    }
  }

  static int getQuantity(ProductModel product) {
    return quantities[product] ?? 1;
  }

  static void clearCart() {
    cartItems.clear();
    quantities.clear();
    saveCart();
  }

  static double get totalPrice {
    double total = 0;

    for (final product in cartItems) {
      final price =
          double.tryParse(product.price.replaceAll(RegExp(r'[^0-9.]'), '')) ??
          0;

      total += price * getQuantity(product);
    }

    return total;
  }
}
