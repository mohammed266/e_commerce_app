import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;


  // Future<void> addToCart(String itemName, double itemPrice) async {
  //   try {
  //     String userName = await getCurrentUserName();
  //     String userId = _auth.currentUser!.uid;
  //
  //     await _fireStore.collection('users').doc(userId).collection('items').add({
  //       'name': itemName,
  //       'price': itemPrice,
  //       'userName': userName,
  //     });
  //   } catch (e) {
  //     log('Error adding item to cart: $e');
  //   }
  // }

  Future<List<Map<String, dynamic>>> getCartItems() async {
    try {
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

      return cartItems;
    } catch (e) {
      log('Error getting cart items: $e');
      return [];
    }
  }

  Future<void> deleteCartItem(String itemName, double itemPrice) async {
    try {
      String userId = _auth.currentUser!.uid;

      final querySnapshot = await _fireStore
          .collection('users')
          .doc(userId)
          .collection('items')
          .where('name', isEqualTo: itemName)
          .where('price', isEqualTo: itemPrice)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Assuming there's only one document matching the itemName and itemPrice
        final docId = querySnapshot.docs.first.id;
        await _fireStore
            .collection('users')
            .doc(userId)
            .collection('items')
            .doc(docId)
            .delete();
      }
    } catch (e) {
      log('Error deleting cart item: $e');
    }
  }
}

// Future<void> addToCart(String itemName, double itemPrice) async {
//   try {
//     emit(CartLoading()); // Emit loading state
//
//     String userName = await getCurrentUserName();
//     String userId = _auth.currentUser!.uid;
//
//     await _fireStore.collection('users').doc(userId).collection('items').add({
//       'name': itemName,
//       'price': itemPrice,
//       'userName': userName,
//     });
//
//     // On success, fetch the updated cart items and emit success state
//     List<Map<String, dynamic>> cartItems = await getCartItems();
//     emit(CartLoaded(cartItems)); // Emit loaded state
//   } catch (e) {
//     emit(CartError('Error adding item to cart: $e')); // Emit error state
//   }
// }
// Future<void> getCartItems() async {
//   try {
//     emit(CartLoading()); // Emit loading state
//
//     String userId = _auth.currentUser!.uid;
//
//     final cartSnapshot = await _fireStore
//         .collection('users')
//         .doc(userId)
//         .collection('items')
//         .get();
//
//     List<Map<String, dynamic>> cartItems = [];
//     for (var doc in cartSnapshot.docs) {
//       cartItems.add(doc.data());
//     }
//
//     emit(CartLoaded(cartItems)); // Emit loaded state with data
//   } catch (e) {
//     emit(CartError('Error getting cart items: $e')); // Emit error state
//   }
// }
// Future<void> deleteCartItem(String itemName, double itemPrice) async {
//   try {
//     emit(CartLoading()); // Emit loading state
//
//     String userId = _auth.currentUser!.uid;
//
//     final querySnapshot = await _fireStore
//         .collection('users')
//         .doc(userId)
//         .collection('items')
//         .where('name', isEqualTo: itemName)
//         .where('price', isEqualTo: itemPrice)
//         .get();
//
//     if (querySnapshot.docs.isNotEmpty) {
//       // Assuming only one document matches the item
//       final docId = querySnapshot.docs.first.id;
//       await _fireStore
//           .collection('users')
//           .doc(userId)
//           .collection('items')
//           .doc(docId)
//           .delete();
//
//       // After successful deletion, fetch the updated cart
//       List<Map<String, dynamic>> updatedCart = await getCartItems();
//       emit(CartLoaded(updatedCart)); // Emit updated cart
//     } else {
//       emit(CartError('Item not found in cart'));
//     }
//   } catch (e) {
//     emit(CartError('Error deleting cart item: $e'));
//   }
// }
// BlocBuilder<CartCubit, CartState>(
// builder: (context, state) {
// if (state is CartLoading) {
// return Center(child: CircularProgressIndicator()); // Show loading spinner
// } else if (state is CartLoaded) {
// return ListView.builder(
// itemCount: state.items.length,
// itemBuilder: (context, index) {
// return ListTile(
// title: Text(state.items[index]['name']),
// subtitle: Text('\$${state.items[index]['price']}'),
// );
// },
// );
// } else if (state is CartError) {
// return Center(child: Text('Error: ${state.errorMessage}')); // Show error message
// } else {
// return Center(child: Text('No items in cart.'));
// }
// },
// );

