import 'package:agrilocal/features/models/products.dart';
import 'package:agrilocal/features/product/product_detail_screen.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
  });

  final ProductTinyModel product;

  String _formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    Duration difference = DateTime.now().difference(dateTime);
    String formattedDate;
    if (difference.inDays >= 1) {
      formattedDate = '${difference.inDays}일 전';
    } else if (difference.inHours >= 1) {
      formattedDate = '${difference.inHours}시간 전';
    } else if (difference.inMinutes >= 1) {
      formattedDate = '${difference.inMinutes}분 전';
    } else {
      formattedDate = '방금 전';
    }
    return formattedDate;
  }

  void _onTap(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () => _onTap(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                child: Image.network(
                  product.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.producer,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        _formatDate(product.createdAt),
                        style: const TextStyle(
                          color: Colors.black87,
                        ),
                      )
                    ],
                  ),
                  Text(
                    product.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '${product.price}원',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
