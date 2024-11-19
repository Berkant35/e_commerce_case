import 'package:flutter/material.dart';

final class ProductStockInfo extends StatelessWidget {
  final String stockAmount;
  final String sku;
  final List<String?> categories;

  const ProductStockInfo({
    super.key,
    required this.stockAmount,
    required this.sku,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Stok Durumu: $stockAmount",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            "SKU: $sku",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            "Kategoriler: ${categories.map((e) => e ?? '').join(", ")}",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
