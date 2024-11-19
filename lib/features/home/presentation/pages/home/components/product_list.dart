import 'package:e_commerce_case/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_case/features/home/presentation/pages/home/components/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../home_viewmodel_imp.dart';
import '../search_viewmodel_imp.dart';

class ProductList extends ConsumerStatefulWidget {
  const ProductList({
    super.key,
  });

  @override
  ConsumerState createState() => _ProductListState();
}

class _ProductListState extends ConsumerState<ProductList> {
  @override
  Widget build(BuildContext context) {
    ref.watch(categoriesAndProductControlProvider);
    final queryName = ref.watch(searchQueryControlProvider);

    return FutureBuilder<List<ProductEntity>>(
      future: ref
          .read(categoriesAndProductControlProvider.notifier)
          .getProductsWithCategoryId(queryName), // Sorguyu buraya geçiriyoruz.
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (snapshot.hasData) {

          final products = snapshot.data!.where(
              (perProduct) {
                final isMatch = queryName == null ||
                    queryName!.isEmpty ||
                    perProduct.name.toLowerCase().contains(queryName!.toLowerCase());
                return isMatch;
              }
          ).toList();

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];

              return ProductCart(product: product);
            },
          );
        } else {
          return const Center(
            child: Text("No Data"),
          );
        }
      },
    );
  }
}
