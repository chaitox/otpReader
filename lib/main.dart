import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_validation/src/bloc/otp_bloc.dart';
import 'package:otp_validation/src/otp_view.dart';

void main() => runApp(const AppState());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Otp',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Prueba OTP'),
          ),
          body: const OtpView()),
    );
  }
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OtpBloc(),
      child: const MyApp(),
    );
  }
}
