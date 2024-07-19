import 'package:get/get.dart';

class CartController extends GetxController {
  // Map to store cart items and their quantities
  var cartItems = <int, int>{}.obs;

  // Method to add item to cart
  void addToCart(int productId) {
    if (cartItems.containsKey(productId)) {
      cartItems[productId] = cartItems[productId]! + 1;
    } else {
      cartItems[productId] = 1;
    }
  }

  // Method to remove item from cart
  void removeFromCart(int productId) {
    if (cartItems.containsKey(productId) && cartItems[productId]! > 1) {
      cartItems[productId] = cartItems[productId]! - 1;
    } else {
      cartItems.remove(productId);
    }
  }

  // Method to get the quantity of a product in the cart
  int getQuantity(int productId) {
    return cartItems[productId] ?? 0;
  }

  // Method to get total items in cart
  int get totalItems => cartItems.values.fold(0, (sum, item) => sum + item);

  // Method to calculate total price (assuming you have a product list with prices)
  double getTotalPrice(List<Map<String, dynamic>> products) {
    double total = 0.0;
    cartItems.forEach((productId, quantity) {
      final product = products.firstWhere((product) => product["id"] == productId);
      total += product["price"] * quantity;
    });
    return total;
  }
}
