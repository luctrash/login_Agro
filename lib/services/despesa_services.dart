import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DespesaService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> salvarDespesa({
    required String id,
    required String nome,
    required String descricao,
    required double valor,
    required String data,
  }) async {
    User? user = _auth.currentUser;

    await FirebaseFirestore.instance.collection('despesas').doc(id).set({
      'userId': user?.uid,
      'nome': nome,
      'descricao': descricao,
      'valor': valor,
      'data': data,
    });
  }
}
