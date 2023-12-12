import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyInfinityScroll(),
    );
  }
}

class MyInfinityScroll extends StatefulWidget {
  const MyInfinityScroll({super.key});

  @override
  State<MyInfinityScroll> createState() => _MyInfinityScrollState();
}

class _MyInfinityScrollState extends State<MyInfinityScroll> {
  final ScrollController _scrollController = ScrollController();
  final List<int> _data = List.generate(20, (index) => index + 1);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // Usuário chegou ao final, carregue mais dados
      _loadMoreData();
    }
  }

  void _loadMoreData() {
    // Simulando o carregamento de mais dados
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _data.addAll(List.generate(20, (index) => _data.length + index + 1));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infinity Scroll Example'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _data.length + 1, // +1 para o indicador de carregamento
        itemBuilder: (context, index) {
          if (index < _data.length) {
            // Exibir dados existentes
            return ListTile(
              title: Text('Item ${_data[index]}'),
            );
          } else {
            // Indicador de carregamento
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
