import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/cupertino.dart';
import 'package:our_pass_auth/model/user.dart';
import 'package:our_pass_auth/utils/error_handler.dart';

class AuthRepository {

  ErrorHandler? _errorHandler;

  final firebase_auth.FirebaseAuth _firebaseAuth;

  AuthRepository({firebase_auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;


  var currentUser = User.empty;

  Stream<User> get user {
    return _firebaseAuth
        .authStateChanges()
        .map((firebaseUser) {
      final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
      currentUser = user;
      return user;
    });
  }

  Future<void> loginWithCredentials({
    required String email,
    required String password
  }) async {
     await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
   }

  Future<void> logout() async{
    try {
      await Future.wait([_firebaseAuth.signOut()]);
    }catch(e){
      _errorHandler?.onError(e.toString());
    }
  }
}

extension on firebase_auth.User {
   User get toUser {
     return User(
         id: uid,
         email: email,
         emailVerified: emailVerified,
         name: displayName
     );
   }
}