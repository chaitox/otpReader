part of 'otp_bloc.dart';

class OtpState extends Equatable {
  final String? hashGenerated;
  final String? plataform;

  const OtpState({this.hashGenerated, this.plataform});

  OtpState copyWith({String? hashGenerated, String? plataform}) => OtpState(
      hashGenerated: hashGenerated ?? this.hashGenerated,
      plataform: plataform ?? this.plataform);

  @override
  List<Object?> get props => [hashGenerated, plataform];
}
