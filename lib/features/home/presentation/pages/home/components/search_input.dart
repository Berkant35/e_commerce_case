import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../search_viewmodel_imp.dart';

class SearchInput extends ConsumerStatefulWidget {
  const SearchInput({
    super.key,
  });

  @override
  ConsumerState createState() => _SearchInputState();
}

class _SearchInputState extends ConsumerState<SearchInput> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  // Bu aksiyonu sunucu tarafına gereksiz istek gitmemesi için 500 ms gecikme ile yapar.
  void _performSearch(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      ref.read(searchQueryControlProvider.notifier).searchProduct(query);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _debounce?.cancel();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: 'Ara...',
        labelStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0), // Kenar yuvarlama
          borderSide:
              const BorderSide(color: Colors.grey, width: 1), // Sınır rengi
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
              color: Colors.blue, width: 2), // Odaklanınca mavi sınır
        ),
      ),
      onEditingComplete: () => _performSearch(_controller.text),
      onChanged: _performSearch,
    );
  }
}
