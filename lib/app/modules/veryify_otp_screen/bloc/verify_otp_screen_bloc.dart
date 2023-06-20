// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'verify_otp_screen_event.dart';
part 'verify_otp_screen_state.dart';

class VerifyOtpScreenBloc
    extends Bloc<VerifyOtpScreenEvent, VerifyOtpScreenState> {
  VerifyOtpScreenBloc() : super(VerifyOtpScreenInitial()) {
    on<VerifyOtpScreenEvent>((event, emit) {});
  }
}
