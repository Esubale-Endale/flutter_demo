part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoaded extends ProductState {
  final List<Product> products;
  final List<CartItem> cart;

  ProductLoaded(this.products, this.cart);

  int get cartCount {
    return cart.fold(0, (total, item) => total + item.quantity);
  }

  double get cartTotal {
    return cart.fold(0, (total, item) => total + item.total);
  }

  Product? findProduct(String id) {
    for (final product in products) {
      if (product.id == id) {
        return product;
      }
    }

    return null;
  }
}
