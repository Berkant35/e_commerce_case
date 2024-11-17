import 'package:e_commerce_case/core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchInput extends ConsumerStatefulWidget {
  const SearchInput({
    super.key,
  });

  @override
  ConsumerState createState() => _SearchInputState();
}

class _SearchInputState extends ConsumerState<SearchInput> {
  final TextEditingController _controller = TextEditingController();

  // Arama fonksiyonu (örnek)
  void _performSearch(String query) {
    if (query.isNotEmpty) {
      // Arama işlemini burada yapabilirsiniz
      print("Arama yapılıyor: $query");
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        filled: true, // Arka plan rengini beyaz yapar
        fillColor: Colors.white, // Arka plan beyaz
        labelText: 'Ara...',
        labelStyle: TextStyle(color: Colors.grey), // Etiket rengi
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0), // Kenar yuvarlama
          borderSide: BorderSide(color: Colors.grey, width: 1), // Sınır rengi
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: Colors.blue, width: 2), // Odaklanınca mavi sınır
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            _performSearch(_controller.text);
          },
        ),
      ),
      onSubmitted: _performSearch,
    );
  }
}
