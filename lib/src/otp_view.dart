import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_validation/src/bloc/otp_bloc.dart';
import 'package:pinput/pinput.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  @override
  void initState() {
    context.read<OtpBloc>().add(GetHashCodeEvent());
    context.read<OtpBloc>().add(ListenCodeEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20, color: Colors.red, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.red),
      borderRadius: BorderRadius.circular(12),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    /*return BlocConsumer<OtpBloc, OtpState>(
      listener: (context, state) {
        print('listnet: $state');
      },
      builder: (context, state) {
        print('builder: $state');
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.plataform ?? '',
              style: TextStyle(fontSize: 50, color: Colors.black),
            ),
            const SizedBox(
              height: 25,
            ),
            Pinput(
                //esto comentar cuando no se queire que genere el hash
                androidSmsAutofillMethod:
                    AndroidSmsAutofillMethod.smsRetrieverApi,
                //********************************************************** */
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                length: 6,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) {
                  print('pin ingresado: $pin');
                }),
            const SizedBox(
              height: 25,
            ),
            Text(
              state.hashGenerated ?? '',
              style: TextStyle(fontSize: 50, color: Colors.black),
            )
          ],
        );
      },
    );*/
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('huawei'),
        Pinput(
            //esto comentar cuando no se queire que genere el hash
            androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
            //********************************************************** */
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            submittedPinTheme: submittedPinTheme,
            length: 6,
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            showCursor: true,
            onCompleted: (pin) {
              print('pin ingresado: $pin');
            }),
      ],
    );
  }
}
