// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'add_quotation_event.dart';
part 'add_quotation_state.dart';

class AddQuotationBloc extends Bloc<AddQuotationEvent, AddQuotationState> {
  AddQuotationBloc() : super(const AddQuotationInitial(pickupDate: null)) {
    on<AddQuotationEvent>(
      (event, emit) {
        if (event is PickDateEvent) {
          emit(AddQuotationInitial(pickupDate: event.pickupDate));
        }
      },
    );
  }

  void updatePickupDate({DateTime? pickupDate}) {
    add(PickDateEvent(pickupDate: pickupDate));
  }
}
