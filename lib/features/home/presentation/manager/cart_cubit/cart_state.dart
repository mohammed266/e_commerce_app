part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<Map<String, dynamic>> items;
  CartLoaded(this.items);
}

class CartError extends CartState {
  final String errMessage;
  CartError(this.errMessage);
}
