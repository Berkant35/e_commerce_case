import 'package:e_commerce_case/core/extensions/padding_extension.dart';
import 'package:e_commerce_case/core/extensions/radius_extension.dart';
import 'package:e_commerce_case/features/home/presentation/pages/home/search_viewmodel_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/routes/route_names.dart';
import '../../../../domain/entities/product_entity.dart';

class ProductCart extends ConsumerWidget {
  final ProductEntity product;

  const ProductCart({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: context.paddingNormal,
      child: GestureDetector(
        onTap: () {
          ref.read(searchQueryControlProvider.notifier).changState("");
          context.goNamed(
              RouteNames.productDetail,
              pathParameters: {"id":product.id}
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: context.radiusLow,
          ),
          elevation: 2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(8)),
                child: Image.network(
                  "https:${product.image}",
                  height: 100, // Daha küçük görsel
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 100,
                      color: Colors.grey[200],
                      child:
                          const Icon(Icons.error, size: 40, color: Colors.red),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${product.price} ${product.currency}",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ); // Arama sorgusuna uymuyorsa boş bir widget döndür
  }
}
