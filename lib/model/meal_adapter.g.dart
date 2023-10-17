// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealsAdapterAdapter extends TypeAdapter<MealsAdapter> {
  @override
  final int typeId = 0;

  @override
  MealsAdapter read(BinaryReader reader) {
    return MealsAdapter();
  }

  @override
  void write(BinaryWriter writer, MealsAdapter obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealsAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
