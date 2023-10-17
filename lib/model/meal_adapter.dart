import 'package:hive/hive.dart';
import 'package:recipe_food_app/model/meal_detail.dart'; // Import your Meals class

part 'meal_adapter.g.dart';

@HiveType(typeId: 0)
class MealsAdapter extends TypeAdapter<Meals> {
  @override
  final int typeId = 0;

  @override
  Meals read(BinaryReader reader) {
    return Meals.fromJson(reader.readMap());
  }

  @override
  void write(BinaryWriter writer, Meals obj) {
    writer.writeMap(obj.toJson());
  }
}
