import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  final List<String> categories;
  final ValueChanged<String> onCategorySelected;

  CategoryList({
    required this.categories,
    required this.onCategorySelected,
  });

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  String selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        itemBuilder: (context, index) {
          final category = widget.categories[index];
          final isSelected = selectedCategory == category;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = category;
              });
            },
            child: Padding(
              padding: EdgeInsets.only(left: (index != 0 ? 16.0 : 0.0)),
              child: Chip(
                label: Text(
                  widget.categories[index],
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: (isSelected
                        ? colorScheme.onPrimary
                        : colorScheme.primary),
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                backgroundColor:
                    (isSelected ? colorScheme.primary : colorScheme.surface),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
