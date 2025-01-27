import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared_pref/shared_pref.dart';
import '../../../../../core/shared_pref/shared_pref_keys.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> addToCart(String itemName, double itemPrice) async {
    try {
      emit(CartLoading()); // Emit loading state

      String userName = SharedPref.getString(key: SharedPrefKeys.userName);
      String userId = _auth.currentUser!.uid;

      await _fireStore.collection('users').doc(userId).collection('items').add({
        'name': itemName,
        'price': itemPrice,
        'userName': userName,
      });
      log('addToCart:>>>>$userName');
      // On success, fetch the updated cart items and emit success state
      List<Map<String, dynamic>> cartItems = await getCartItems();
      emit(CartLoaded(cartItems)); // Emit loaded state
    } catch (e) {
      emit(CartError('Error adding item to cart: $e')); // Emit error state
    }
  }

  Future<List<Map<String, dynamic>>> getCartItems() async {
    try {
      emit(CartLoading()); // Emit loading state

      String userId = _auth.currentUser!.uid;

      final cartSnapshot = await _fireStore
          .collection('users')
          .doc(userId)
          .collection('items')
          .get();

      List<Map<String, dynamic>> cartItems = [];
      for (var doc in cartSnapshot.docs) {
        cartItems.add(doc.data());
      }

      // Emit loaded state with the fetched cart items
      emit(CartLoaded(cartItems));
      return cartItems; // Return the list of cart items
    } catch (e) {
      // Emit error state
      emit(CartError('Error getting cart items: $e'));
      return []; // Return an empty list in case of an error
    }
  }

  Future<void> deleteCartItem(String itemName, double itemPrice) async {
    try {
      emit(CartLoading()); // Emit loading state

      String userId = _auth.currentUser!.uid;

      final querySnapshot = await _fireStore
          .collection('users')
          .doc(userId)
          .collection('items')
          .where('name', isEqualTo: itemName)
          .where('price', isEqualTo: itemPrice)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Assuming only one document matches the item
        final docId = querySnapshot.docs.first.id;
        await _fireStore
            .collection('users')
            .doc(userId)
            .collection('items')
            .doc(docId)
            .delete();

        // After successful deletion, fetch the updated cart
        List<Map<String, dynamic>> updatedCart = await getCartItems();
        emit(CartLoaded(updatedCart)); // Emit updated cart
      } else {
        emit(CartError('Item not found in cart'));
      }
    } catch (e) {
      emit(CartError('Error deleting cart item: $e'));
    }
  }
}
