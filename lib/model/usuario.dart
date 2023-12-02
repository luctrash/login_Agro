import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  String uid;
  String email;
  String nome;

  Usuario({
    required this.uid,
    required this.email,
    required this.nome,
  });

  factory Usuario.fromDoc(DocumentSnapshot<Object?> doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return Usuario(
      uid: doc.id,
      email: data['email'] ?? '',
      nome: data['nome'] ?? '',
    );
  }
}