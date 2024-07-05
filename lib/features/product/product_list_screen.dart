import 'package:agrilocal/features/models/products.dart';
import 'package:agrilocal/features/product/product_list_item.dart';
import 'package:agrilocal/services/api_service.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late Future<List<ProductTinyModel>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = ApiService().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductTinyModel>>(
      future: _productsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          return GridView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: snapshot.data!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 1,
              mainAxisSpacing: 5,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              final product = snapshot.data![index];
              return ProductItem(product: product);
            },
          );
        } else {
          return const Center(child: Text('No products found'));
        }
      },
    );
  }
}
