import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<void> signupUser({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(AuthLoading());
    try {
      UserCredential user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (user.user != null) {
        await _createUserDatabase(user.user!.uid, name);
      }
      emit(AuthSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(AuthFailure(errMessage: 'weak-password'));
      } else if (ex.code == 'email-already-in-use') {
        emit(AuthFailure(errMessage: 'email-already-in-use'));
      } else {
        emit(AuthFailure(errMessage: ex.message ?? 'Unknown error'));
      }
    } catch (e) {
      emit(AuthFailure(errMessage: e.toString()));
      log('Error signupUser: $e');
    }
  }

  Future<void> logInUser({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(AuthFailure(errMessage: 'weak-password'));
      } else if (ex.code == 'email-already-in-use') {
        emit(AuthFailure(errMessage: 'email-already-in-use'));
      } else {
        emit(AuthFailure(errMessage: ex.message ?? 'Unknown error'));
      }
    } catch (e) {
      emit(AuthFailure(errMessage: e.toString()));
      log('Error logInUser: $e');
    }
  }

  Future<void> _createUserDatabase(String userId, String name) async {
    emit(AuthLoading());
    try {
      await _fireStore.collection('users').doc(userId).set({
        'name': name,
      });
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(errMessage: e.toString()));
      log('Error creating user database: $e');
    }
  }
}
