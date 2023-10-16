import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
      child: Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: TextField(
            onChanged: (value) {
              //search value
            },
            style: const TextStyle(fontSize: 20),
            decoration: const InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: 'Search Recipes',
              prefixIcon: Icon(
                Icons.search,
                size: 25,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 9,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
