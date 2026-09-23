import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/market_store.dart';
import '../models/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductsStarted>(_onProductsStarted);
    on<ProductAdded>(_onProductAdded);
    on<ProductUpdated>(_onProductUpdated);
    on<ProductDeleted>(_onProductDeleted);
    on<ProductAddedToCart>(_onProductAddedToCart);
    on<CartItemRemoved>(_onCartItemRemoved);
    on<CartCleared>(_onCartCleared);
  }

  void _onProductsStarted(ProductsStarted event, Emitter<ProductState> emit) {
    emit(_createLoadedState());
  }

  void _onProductAdded(ProductAdded event, Emitter<ProductState> emit) {
    MarketStore.addProduct(event.product);
    emit(_createLoadedState());
  }

  void _onProductUpdated(ProductUpdated event, Emitter<ProductState> emit) {
    MarketStore.updateProduct(event.product);
    emit(_createLoadedState());
  }

  void _onProductDeleted(ProductDeleted event, Emitter<ProductState> emit) {
    MarketStore.deleteProduct(event.productId);
    emit(_createLoadedState());
  }

  void _onProductAddedToCart(
    ProductAddedToCart event,
    Emitter<ProductState> emit,
  ) {
    MarketStore.addToCart(event.product, event.quantity);

    emit(_createLoadedState());
  }

  void _onCartItemRemoved(CartItemRemoved event, Emitter<ProductState> emit) {
    MarketStore.removeFromCart(event.productId);
    emit(_createLoadedState());
  }

  void _onCartCleared(CartCleared event, Emitter<ProductState> emit) {
    MarketStore.clearCart();
    emit(_createLoadedState());
  }

  ProductLoaded _createLoadedState() {
    return ProductLoaded(
      List.unmodifiable(MarketStore.products),
      List.unmodifiable(MarketStore.cart),
    );
  }
}
