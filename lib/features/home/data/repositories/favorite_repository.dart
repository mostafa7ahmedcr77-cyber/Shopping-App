import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/features/home/data/models/product_model.dart';
import 'package:shopping_app/features/home/data/repositories/product_repository.dart';

class FavoriteRepository {
  static const String favoriteKey = 'saved_favorites';

  static final List<ProductModel> favoriteItems = [];

  static Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final savedFavorites = prefs.getStringList(favoriteKey);

    favoriteItems.clear();

    if (savedFavorites == null) return;

    for (final productName in savedFavorites) {
      final matchingProducts = ProductRepository.products.where(
        (product) => product.name == productName,
      );

      if (matchingProducts.isNotEmpty) {
        favoriteItems.add(matchingProducts.first);
      }
    }
  }

  static Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setStringList(
      favoriteKey,
      favoriteItems.map((product) => product.name).toList(),
    );
  }

  static bool isFavorite(ProductModel product) {
    return favoriteItems.contains(product);
  }

  static void toggleFavorite(ProductModel product) {
    if (isFavorite(product)) {
      favoriteItems.remove(product);
    } else {
      favoriteItems.add(product);
    }

    saveFavorites();
  }

  static void removeFavorite(ProductModel product) {
    favoriteItems.remove(product);
    saveFavorites();
  }
}
