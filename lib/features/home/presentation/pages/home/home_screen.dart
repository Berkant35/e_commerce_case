import 'package:e_commerce_case/core/extensions/padding_extension.dart';
import 'package:e_commerce_case/features/home/presentation/pages/home/home_viewmodel_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/category_chip_list.dart';
import 'components/product_list.dart';
import 'components/search_input.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ref.watch(categoriesAndProductControlProvider);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16), // Üst boşluk
                    _titleOfParts(context, "Arama"),
                    Padding(
                      padding: context.paddingTiny,
                      child: const SearchInput(),
                    ),
                    _titleOfParts(context, "Kategori"),
                    const CategoryChipList(),
                    _titleOfParts(context, "Ürünler"),
                  ],
                ),
              ),
            ];
          },
          body: const ProductList(),
        ),
      ),
    );
  }

  Padding _titleOfParts(BuildContext context, String title) {
    return Padding(
      padding: context.paddingNormal,
      child: Text(
        title,
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }
}
