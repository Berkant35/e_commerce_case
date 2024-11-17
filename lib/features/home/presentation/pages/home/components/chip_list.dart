import 'package:e_commerce_case/core/extensions/padding_extension.dart';
import 'package:e_commerce_case/core/extensions/radius_extension.dart';
import 'package:e_commerce_case/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/home_entity.dart';
import '../home_viewmodel_impl.dart';

class CategoryChipList extends ConsumerStatefulWidget {
  const CategoryChipList({
    super.key,
  });

  @override
  ConsumerState createState() => _CategoryChipListState();
}

class _CategoryChipListState extends ConsumerState<CategoryChipList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryEntity>>(
        future: ref.read(categoriesControlProvider.notifier).getCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _progress();
          }

          final categories = snapshot.data;

          if (categories == null) {
            return _noData();
          }

          if (snapshot.hasData) {
            // return ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: categories.length,
            //     itemBuilder: (context, index) {
            //       return _perChip(context, categories[index]);
            //     });
            return Wrap(
              alignment: WrapAlignment.start,
              children: [
                for (var category in categories) _perChip(context, category)
              ],
            );
          }

          return _occurError();
        });
  }

  Center _occurError() {
    return const Center(
      child: Text("Error"),
    );
  }

  Center _noData() {
    return const Center(
      child: Text("No data"),
    );
  }

  Center _progress() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _perChip(BuildContext context, CategoryEntity? categories) {
    return Padding(
      padding: context.paddingTiny,
      child: Chip(
        backgroundColor: lightTheme.primaryColorLight,
        shape: RoundedRectangleBorder(
          borderRadius: context.radiusMedium,
        ),
        label: Text(categories!.name,style: lightTheme.textTheme.bodyMedium,),
      ),
    );
  }
}
