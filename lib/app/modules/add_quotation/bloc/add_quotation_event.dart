part of 'add_quotation_bloc.dart';

@immutable
abstract class AddQuotationEvent {}

class PickDateEvent extends AddQuotationEvent {
  final DateTime? pickupDate;

  PickDateEvent({this.pickupDate});
}
