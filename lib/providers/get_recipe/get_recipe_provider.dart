import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/providers/get_recipe/get_recipe_notifier.dart';
import 'package:recipe_food_app/providers/get_recipe/meal_state.dart';
import 'package:recipe_food_app/providers/get_user_id_provider.dart';

final recipeRetrieveProvider =
    StateNotifierProvider.autoDispose<RecipeRetrieveNotifier, RecipeState>(
  (ref) => RecipeRetrieveNotifier(currentUserId: ref.watch(userIdProvider)),
);

// final recipeRetrieveStreamProvider = StreamProvider<List<Meal>>(
//   (ref) {
//       final userId = ref.watch(userIdProvider);
//
//       final controller = StreamController<List<Meal>>();
//
//       controller.onListen = () {
//           controller.sink.add([]);
//       };
//
//       final sub = FirebaseFirestore.instance
//           .collection(
//           FirebaseCollectionName.meals,
//       )
//           .where(
//           MealKey.userId,
//           isEqualTo: userId,
//       )
//           .snapshots()
//           .listen(
//               (snapshot) {
//               final documents = snapshot.docs;
//               final meals = documents
//                   .where(
//                       (doc) => !doc.metadata.hasPendingWrites,
//               )
//                   .map(
//                       (doc) => Meal(
//                       postId: doc.id,
//                       json: doc.data(),
//                   ),
//               );
//               controller.sink.add(meals);
//           },
//       );
//
//       ref.onDispose(() {
//           sub.cancel();
//           controller.close();
//       });
//
//       return controller.stream;
//   },
// );
