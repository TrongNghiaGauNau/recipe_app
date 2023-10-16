import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/providers/get_all_categories_provider.dart';
import 'package:recipe_food_app/providers/get_all_category_meals_provider.dart';
import 'package:recipe_food_app/screens/home/components/all_categories.dart';
import 'all_meals_base_on_category.dart';

class PopularCategory extends HookConsumerWidget {
  const PopularCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //danh sách tất cả categories
    final allCategories = ref.watch(getAllCategories);
    //dùng dể xử lý khi click vào một category
    var categoryClicked = useState(0);
    //dùng để truy vấn dữ liệu về các món ăn tương với category name trên api
    var categoryName = useState('Beef');
    //dùng để hiển thị các món ăn đã lấy được ở trên
    final allCategoryMeals = ref.watch(getAllCategoryMeals(categoryName.value));

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Popular category',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        AllCategories(
          allCategories: allCategories,
          categoryClicked: categoryClicked,
          categoryName: categoryName,
        ),
        const SizedBox(
          height: 20,
        ),
        allCategoryMeals.when(
          data: (listMeals) {
            return AllMealBaseOnCategory(
              listMeals: listMeals,
            );
          },
          error: (error, stackTrace) => const Center(
            child: Text('Can not get meals'),
          ),
          loading: () => const CircularProgressIndicator(),
        ),
      ],
    );
  }
}
