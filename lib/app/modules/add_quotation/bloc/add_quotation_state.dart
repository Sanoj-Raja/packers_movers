part of 'add_quotation_bloc.dart';

@immutable
abstract class AddQuotationState {
  final DateTime? pickupDate;

  const AddQuotationState({this.pickupDate});
}

class AddQuotationInitial extends AddQuotationState {
  const AddQuotationInitial({required super.pickupDate});
}
