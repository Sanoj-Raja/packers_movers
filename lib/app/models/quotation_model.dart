import 'package:hive/hive.dart';
part 'quotation_model.g.dart';

@HiveType(typeId: 0)
class QuotationModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int quotationNumber;

  @HiveField(2)
  final double quotationPrice;

  @HiveField(3)
  final String origin;

  @HiveField(4)
  final String destination;

  @HiveField(5)
  final DateTime date;

  @HiveField(6)
  final String phoneNumber;

  QuotationModel({
    required this.name,
    required this.quotationNumber,
    required this.quotationPrice,
    required this.origin,
    required this.destination,
    required this.date,
    required this.phoneNumber,
  });
}
