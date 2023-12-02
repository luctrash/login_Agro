import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/despesa.dart';  // Verifique o caminho real
import '../services/despesa_services.dart';  // Verifique o caminho real

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DespesaService despesaService = DespesaService();

  // Verificar o estado de autenticação do usuário
  Stream<User?> get user => _auth.authStateChanges();

  // Método para realizar o login
  Future<User?> login(String email, String senha) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print('Erro de login: ${e.message}');
      throw e;
    }
  }

  // Método para realizar o cadastro
  Future<User?> cadastrar(String email, String senha) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print('Erro de cadastro: ${e.message}');
      throw e;
    }
  }

  // Método para realizar o logout
  Future<void> logout() async {
    await _auth.signOut();
  }
}