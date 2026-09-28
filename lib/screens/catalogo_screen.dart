import 'package:flutter/material.dart';

import '../models/produto.dart';
import '../widgets/produto_card.dart';
import 'detalhes_produto_screen.dart';

class CatalogoScreen extends StatefulWidget {
  const CatalogoScreen({super.key});

  @override
  State<CatalogoScreen> createState() => _CatalogoScreenState();
}

class _CatalogoScreenState extends State<CatalogoScreen> {
  final List<Produto> _produtos = [
    const Produto(
      id: '1', nome: 'Smartphone Galaxy S24', preco: 4500,
      categoria: 'Eletrônicos', icone: '📱',
      descricao: 'Desempenho potente e câmera de alta resolução para todos os momentos.',
    ),
    const Produto(
      id: '2', nome: 'Notebook Dell XPS', preco: 8900,
      categoria: 'Informática', icone: '💻',
      descricao: 'Produtividade, mobilidade e acabamento premium em um só computador.',
    ),
    const Produto(
      id: '3', nome: 'Fone Bluetooth Sony', preco: 1200,
      categoria: 'Áudio', icone: '🎧',
      descricao: 'Som imersivo e conforto para acompanhar sua rotina.',
    ),
    const Produto(
      id: '4', nome: 'Smartwatch Garmin', preco: 2300,
      categoria: 'Wearables', icone: '⌚',
      descricao: 'Acompanhe sua saúde e seus treinos com precisão.',
    ),
    const Produto(
      id: '5', nome: 'Teclado Mecânico RGB', preco: 450,
      categoria: 'Periféricos', icone: '⌨️',
      descricao: 'Resposta rápida e iluminação personalizável para seu setup.',
    ),
  ];

  void _adicionarProduto() {
    final novoNumero = _produtos.length + 1;
    setState(() {
      _produtos.add(Produto(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        nome: 'Produto adicional $novoNumero',
        preco: 99.90 + novoNumero,
        categoria: 'Novidades',
        icone: '✨',
        descricao: 'Item adicionado dinamicamente ao catálogo.',
      ));
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Produto adicionado ao catálogo')),
    );
  }

  void _removerProduto(Produto produto) {
    final index = _produtos.indexWhere((item) => item.id == produto.id);
    setState(() => _produtos.removeWhere((item) => item.id == produto.id));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${produto.nome} removido'),
        action: SnackBarAction(
          label: 'DESFAZER',
          onPressed: () => setState(() => _produtos.insert(index, produto)),
        ),
      ),
    );
  }

  void _abrirDetalhes(Produto produto) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => DetalhesProdutoScreen(produto: produto)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de produtos'),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                '${_produtos.length} itens',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
      body: _produtos.isEmpty
          ? const Center(child: Text('Nenhum produto no catálogo'))
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: _produtos.length,
              itemBuilder: (context, index) {
                final produto = _produtos[index];
                return Dismissible(
                  key: ValueKey(produto.id),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.errorContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 24),
                    child: Icon(Icons.delete_outline, color: Theme.of(context).colorScheme.onErrorContainer),
                  ),
                  onDismissed: (_) => _removerProduto(produto),
                  child: ProdutoCard(
                    produto: produto,
                    onTap: () => _abrirDetalhes(produto),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _adicionarProduto,
        icon: const Icon(Icons.add),
        label: const Text('Adicionar'),
      ),
    );
  }
}
