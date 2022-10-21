part of 'otp_bloc.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent();

  @override
  List<Object> get props => [];
}

class GetHashCodeEvent extends OtpEvent {}

class ListenCodeEvent extends OtpEvent {}
