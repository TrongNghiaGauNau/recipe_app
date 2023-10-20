import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/providers/search/search_meal_provider.dart';
import 'package:recipe_food_app/screens/meal_detail/meal_detail.dart';
import 'package:recipe_food_app/screens/search/components/search_recipes.dart';

class SearchView extends HookConsumerWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var input = useTextEditingController(text: '');
    final resultSearch = ref.watch(searchMealsProvider);
    return Scaffold(
      body: SafeArea(
        child: Builder(builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                SearchRecipes(input: input),
                const SizedBox(height: 20),
                if(input.text == '')
                  const Center(child: Text('Search something amigo...'),)
                else if (resultSearch.isLoading)
                  const Center(child: CircularProgressIndicator(),)
                else
                  ListView.builder(
                    shrinkWrap: true,
                    // Set shrinkWrap to true
                    physics: const NeverScrollableScrollPhysics(),
                    // Disable scrolling
                    itemCount: resultSearch.searchList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.lightBlueAccent,
                        ),
                        child: ListTile(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MealDetail(
                                  meal: resultSearch.searchList[index],
                                ),
                              )),
                          leading: const Icon(Icons.no_food_rounded),
                          title: Text(
                            resultSearch.searchList[index].strMeal,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            resultSearch.searchList[index].strArea!,
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}


