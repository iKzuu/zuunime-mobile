import 'package:flutter/material.dart';
import 'package:zuunimelist/components/widget/searchbar.dart';

class AppbarContent extends StatelessWidget {
  final void Function()? onSearchTap;
  final void Function(String)? onChanged;
  final FocusNode focusNode;
  final bool isSearchOpen;
  const AppbarContent({
    super.key,
    required this.onSearchTap,
    required this.focusNode,
    required this.isSearchOpen,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12),
      child: Column(
        spacing: 12,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person_2_rounded,
                    size: 32,
                    color: Colors.white,
                  ),
                ),

                Text(
                  "ZuuNimeList",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),

          Searchbar(
            onChanged: onChanged,
            onSearchTap: onSearchTap,
            isSearchOpen: isSearchOpen,
            focusNode: focusNode,
          ),
        ],
      ),
    );
  }
}
