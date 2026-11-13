import 'package:shopping_app/features/home/data/models/product_model.dart';

class ProductRepository {
  static const List<ProductModel> products = [
    ProductModel(
      name: 'Classic White T-Shirt',
      description: 'Comfortable cotton T-shirt for everyday wear.',
      price: '450 EGP',
      category: 'T-Shirts',
      image: 'assets/images/white_tshirt.png',
      rating: 4.8,
    ),
    ProductModel(
      name: 'Black Oversized T-Shirt',
      description: 'Modern oversized fit with soft cotton fabric.',
      price: '520 EGP',
      category: 'T-Shirts',
      image: 'assets/images/black_tshirt.png',
      rating: 4.9,
    ),
    ProductModel(
      name: 'Orange Casual Shirt',
      description: 'Simple casual shirt for a clean everyday look.',
      price: '750 EGP',
      category: 'Shirts',
      image: 'assets/images/orange_shirt.png',
      rating: 4.7,
    ),
    ProductModel(
      name: 'Pink Basic T-Shirt',
      description: 'Lightweight T-shirt with a comfortable fit.',
      price: '480 EGP',
      category: 'T-Shirts',
      image: 'assets/images/pink_tshirt.png',
      rating: 4.6,
    ),
    ProductModel(
      name: 'Classic Black Shirt',
      description: 'A simple shirt suitable for casual occasions.',
      price: '690 EGP',
      category: 'Shirts',
      image: 'assets/images/black_shirt.png',
      rating: 4.8,
    ),
  ];
}
