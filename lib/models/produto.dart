/// Representa um item disponível no catálogo.
///
/// O modelo é imutável para que a tela possa atualizar a lista com segurança:
/// alterações no catálogo substituem a coleção, em vez de alterar um produto.
class Produto {
  final String id;
  final String nome;
  final double preco;
  final String categoria;
  final String icone;

  const Produto({
    required this.id,
    required this.nome,
    required this.preco,
    required this.categoria,
    required this.icone,
  });
}
