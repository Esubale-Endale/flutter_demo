part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

final class ProductsStarted extends ProductEvent {}

final class ProductAdded extends ProductEvent {
  final Product product;

  ProductAdded(this.product);
}

final class ProductUpdated extends ProductEvent {
  final Product product;

  ProductUpdated(this.product);
}

final class ProductDeleted extends ProductEvent {
  final String productId;

  ProductDeleted(this.productId);
}

final class ProductAddedToCart extends ProductEvent {
  final Product product;
  final int quantity;

  ProductAddedToCart(this.product, this.quantity);
}

final class CartItemRemoved extends ProductEvent {
  final String productId;

  CartItemRemoved(this.productId);
}

final class CartCleared extends ProductEvent {}
