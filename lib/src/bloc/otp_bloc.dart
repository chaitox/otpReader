import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:otp_reader/otp_reader.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc() : super(const OtpState()) {
    on<GetHashCodeEvent>(_getHashCode);
    on<ListenCodeEvent>(_listenCodeEvent);
  }
  void _getHashCode(GetHashCodeEvent event, Emitter<OtpState> emit) async {
    final hash = await OtpReader().getHasCode();
    final plataform = await OtpReader().plataform();
    emit(state.copyWith(hashGenerated: hash, plataform: plataform));
  }

  void _listenCodeEvent(ListenCodeEvent event, Emitter<OtpState> emit) async {
    await OtpReader().listenForOtpCode();
  }
}
