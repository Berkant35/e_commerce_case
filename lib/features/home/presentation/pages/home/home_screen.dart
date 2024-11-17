import 'package:e_commerce_case/core/extensions/padding_extension.dart';
import 'package:e_commerce_case/features/home/domain/entities/home_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/extensions/padding_extension.dart';
import 'home_viewmodel_impl.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Search bar
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.pink,
              )),
          // category list with chips
          Expanded(
              flex: 2,
              child: FutureBuilder<List<CategoryEntity>>(
                  future: ref
                      .read(categoriesControlProvider.notifier)
                      .getCategories(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    final categories = snapshot.data;
                    if (categories == null) {
                      return const Center(
                        child: Text("No data"),
                      );
                    }

                    if (snapshot.hasData) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: context.paddingNormal,
                              child: Chip(
                                label: Text(categories[index].name),
                              ),
                            );
                          });
                    }

                    return const Center(
                      child: Text("Error"),
                    );
                  })),
          // product list
          Expanded(
              flex: 12,
              child: Container(
                color: Colors.pink,
              )),
        ],
      ),
    );
  }
}
