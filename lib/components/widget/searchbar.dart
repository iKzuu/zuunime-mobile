import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  final void Function(String)? onChanged;
  final void Function()? onSearchTap;
  final FocusNode focusNode;
  final bool isSearchOpen;
  const Searchbar({
    super.key,
    required this.onSearchTap,
    required this.focusNode,
    required this.isSearchOpen,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SizedBox(
        width: width,
        height: 40,
        child: TextField(
          onTap: onSearchTap,
          onChanged: onChanged,
          focusNode: focusNode,
          readOnly: !isSearchOpen,
          cursorColor: Color(0xFFF544CF),
          cursorHeight: 20,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(8),
            prefixIcon: Icon(
              Icons.search_rounded,
              size: 26,
              color: Color(0xFFF544CF),
            ),
            hintText: "search anime...",
            hintStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.black.withValues(alpha: 0.3),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
