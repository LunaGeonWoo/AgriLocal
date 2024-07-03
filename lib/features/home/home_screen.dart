import 'package:agrilocal/features/home/product_item.dart';
import 'package:agrilocal/features/home/product_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
        name: '김치볶음밥',
        imageUrl:
            'https://roout.co.kr/m/p/u/vHf969g/c/tsLVxjn3JeU/i/tmaNCLUJoFS.jpg?w=720',
        price: 8000,
        producer: "김농부",
      ),
      Product(
        name: '생선구이',
        imageUrl:
            'https://roout.co.kr/m/p/u/vHf969g/c/tsLVxjn3JeU/i/tmaNCLUJoFS.jpg?w=720',
        price: 4220,
        producer: "김어부",
      ),
      Product(
        name: '생선구이',
        imageUrl:
            'https://roout.co.kr/m/p/u/vHf969g/c/tsLVxjn3JeU/i/tmaNCLUJoFS.jpg?w=720',
        price: 4220,
        producer: "김어부",
      ),
      Product(
        name: '생선구이',
        imageUrl:
            'https://roout.co.kr/m/p/u/vHf969g/c/tsLVxjn3JeU/i/tmaNCLUJoFS.jpg?w=720',
        price: 4220,
        producer: "김어부",
      ),
      Product(
        name: '생선구이',
        imageUrl:
            'https://roout.co.kr/m/p/u/vHf969g/c/tsLVxjn3JeU/i/tmaNCLUJoFS.jpg?w=720',
        price: 4220,
        producer: "김어부",
      ),
      Product(
        name: '생선구이',
        imageUrl:
            'https://roout.co.kr/m/p/u/vHf969g/c/tsLVxjn3JeU/i/tmaNCLUJoFS.jpg?w=720',
        price: 4220,
        producer: "김어부",
      ),
      Product(
        name: '생선구이',
        imageUrl:
            'https://roout.co.kr/m/p/u/vHf969g/c/tsLVxjn3JeU/i/tmaNCLUJoFS.jpg?w=720',
        price: 4220,
        producer: "김어부",
      ),
      Product(
        name: '생선구이',
        imageUrl:
            'https://roout.co.kr/m/p/u/vHf969g/c/tsLVxjn3JeU/i/tmaNCLUJoFS.jpg?w=720',
        price: 4220,
        producer: "김어부",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('제품 리스트'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1,
          mainAxisSpacing: 5,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductItem(product: product);
        },
      ),
    );
  }
}
