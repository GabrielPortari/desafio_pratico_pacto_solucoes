import 'package:flutter/material.dart';

import 'product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Desafio Pratico, Pacto'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}


class _MyHomePageState extends State<MyHomePage> {
  final List<Product> items = generateProducts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder( //Construção da listview
        itemCount: items.length,
        itemBuilder: (context, index){
          final product = items[index];
          return ListTile( //Construção dos elementos da lista, com nome e descrição
            title: Text(product.name),
            subtitle: Text(product.description),
            onTap: (){ //Listener para enviar o produto para outra tela
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) => ProductDetails(product: product),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

/*Tela para mostrar os detalhes do produto*/
class ProductDetails extends StatelessWidget{
  final Product product;

  ProductDetails({required this.product});

  final String appBarTitle = 'Details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
        ),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                product.description,
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
    );
  }
}

/* Função para gerar uma lista de produtos */
List<Product> generateProducts(){
  List<Product> products = [];
  for(int i=1; i<10; i++){
    products.add(
        Product(
            name: 'Product number: $i',
            description: 'Description of product number $i'
        )
    );
  }
  return products;
}