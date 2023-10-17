import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/providers/search_meal_provider.dart';

class SearchView extends HookConsumerWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var input = useTextEditingController(text: '');
    final resultSearch = ref.watch(searchMealsProvider);
    return Scaffold(
      body: SafeArea(
        child: Builder(
          builder: (context) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        child: TextField(
                          controller: input,
                          onChanged: (value) {
                            input.text = value;
                            ref.read(searchMealsProvider.notifier).searchMeal(input.text);
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
                  ),
                  const SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    // Set shrinkWrap to true
                    physics: const NeverScrollableScrollPhysics(),
                    // Disable scrolling
                    itemCount: resultSearch.length,
                    itemBuilder: (context, index) {
                      if(resultSearch.isEmpty){
                        return const Center(child: Text('Can not find recipe. Search something else...'),);
                      }
                      return Center(child: Text(resultSearch[index].strMeal),);
                    },
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
