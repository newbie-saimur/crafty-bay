import 'package:flutter/material.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.search,
      onSubmitted: (value) {},
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, size: 28, color: Colors.grey),
        hintText: "Search Product",
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        fillColor: Colors.black.withValues(alpha: 0.05),
        filled: true,
        border: _buildOutlineInputBorder(),
        focusedBorder: _buildOutlineInputBorder(),
        errorBorder: _buildOutlineInputBorder(),
        enabledBorder: _buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    );
  }
}
