import 'package:e_commerce_case/core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/chip_list.dart';
import 'components/search_input.dart';

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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          // Search bar
          Expanded(
              flex: 2,
              child: Padding(
                padding: context.paddingTiny,
                child: const SearchInput(),
              )),
          const Expanded(flex: 1, child: CategoryChipList()),
          Expanded(flex: 12, child: Container()),
        ],
      ),
    );
  }
}
