import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<void> signOutUser() async {
    emit(ProfileLoading());
    try {
      await _auth.signOut();
      emit(ProfileSuccess(''));
    } catch (e) {
      emit(ProfileFailure(e.toString()));
      log('Error signOutUser: $e');
    }
  }

  Future<void> getCurrentUserName() async {
    // Emit loading state to indicate fetching process starts
    emit(ProfileLoading());

    User? user = _auth.currentUser;
    String name = ''; // Default value for name

    try {
      if (user != null) {
        final userRef = _fireStore.collection('users').doc(user.uid);
        final userData = await userRef.get();

        if (userData.exists) {
          // Use an empty string if name is not found
          name = userData.data()!['name'] ?? '';
          log('User found: $name');
        } else {
          log('User not found in Firestore');
        }
      } else {
        log('No user logged in');
      }

      // Emit success state with the fetched name or empty string
      emit(ProfileSuccess(name));
    } catch (e) {
      log('Error getCurrentUserName: $e');
      // Emit failure on error
      emit(ProfileFailure('Error fetching user name: ${e.toString()}'));
    }
  }
}
