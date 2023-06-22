// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'quotation_screen_event.dart';
part 'quotation_screen_state.dart';

class QuotationScreenBloc
    extends Bloc<QuotationScreenEvent, QuotationScreenState> {
  QuotationScreenBloc() : super(QuotationScreenInitial()) {
    on<QuotationScreenEvent>((event, emit) {});
  }
}
