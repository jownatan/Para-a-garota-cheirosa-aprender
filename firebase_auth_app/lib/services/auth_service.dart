// services/auth_service.dart
// Serviço responsável por gerenciar a autenticação do usuário

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService with ChangeNotifier {
  // Instância do FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Getter para obter o usuário atual
  User? get currentUser => _auth.currentUser;

  // Método para fazer login com email e senha
  Future<UserCredential> login(String email, String password) async {
    try {
      // Tenta fazer login com as credenciais fornecidas
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      notifyListeners();
      return credential;
    } catch (e) {
      // Repassa a exceção para ser tratada pela UI
      rethrow;
    }
  }

  // Método para registrar um novo usuário com email e senha
  Future<UserCredential> register(String email, String password) async {
    try {
      // Tenta criar um novo usuário com as credenciais fornecidas
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      notifyListeners();
      return credential;
    } catch (e) {
      // Repassa a exceção para ser tratada pela UI
      rethrow;
    }
  }

  // Método para fazer logout
  Future<void> logout() async {
    await _auth.signOut();
    notifyListeners();
  }
}
