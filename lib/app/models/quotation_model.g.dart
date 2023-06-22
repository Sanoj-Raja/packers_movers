// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotation_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuotationModelAdapter extends TypeAdapter<QuotationModel> {
  @override
  final int typeId = 0;

  @override
  QuotationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuotationModel(
      name: fields[0] as String,
      quotationNumber: fields[1] as int,
      quotationPrice: fields[2] as double,
      origin: fields[3] as String,
      destination: fields[4] as String,
      date: fields[5] as DateTime,
      phoneNumber: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, QuotationModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.quotationNumber)
      ..writeByte(2)
      ..write(obj.quotationPrice)
      ..writeByte(3)
      ..write(obj.origin)
      ..writeByte(4)
      ..write(obj.destination)
      ..writeByte(5)
      ..write(obj.date)
      ..writeByte(6)
      ..write(obj.phoneNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuotationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
