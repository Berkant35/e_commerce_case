import 'package:flutter/material.dart';

final class ProductDiscount extends StatelessWidget {
  final double discount;

  const ProductDiscount({Key? key, required this.discount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          "%${discount.toStringAsFixed(0)} İndirim!",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}