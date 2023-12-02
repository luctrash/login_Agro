import 'package:cloud_firestore/cloud_firestore.dart';

class Despesa {
  String id;
  String userId;
  String nome;
  String descricao;
  double valor;
  String data;

  Despesa({
    required this.id,
    required this.userId,
    this.nome = "",
    this.descricao = "",
    this.valor = 0,
    this.data = "",
  });

  // Construtor estático para criar uma instância de Despesa a partir de um DocumentSnapshot
  static Despesa fromDoc(DocumentSnapshot doc) {
    Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

    if (data == null) {
      throw Exception('Dados inválidos no DocumentSnapshot');
    }

    // Convertendo a string 'data' para DateTime
    DateTime dataFormatada =
        DateTime.tryParse(data['data'] ?? '') ?? DateTime.now();

    return Despesa(
      id: doc.id,
      userId: data['userId'] ?? "", // Adapte conforme necessário
      nome: data['nome'] ?? "",
      descricao: data['descricao'] ?? "",
      valor: (data['valor'] ?? 0.0).toDouble(),
      data: dataFormatada.toString(),
    );
  }
}
