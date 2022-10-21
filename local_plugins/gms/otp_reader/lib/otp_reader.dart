library otp_reader;

import 'package:flutter/cupertino.dart';
import 'package:otp_service_interface/otp_service_interface.dart';
import 'package:sms_autofill/sms_autofill.dart';

//procedimientos para generar otp servicios de google
class OtpReader extends OtpServiceInterface {
  @override
  Future<String> getHasCode() async {
    String hash = await SmsAutoFill().getAppSignature;
    debugPrint('hash Google: $hash');
    return hash;
  }

  @override
  Future<void> listenForOtpCode() async {
    await SmsAutoFill().listenForCode();
  }

  @override
  Future<String> plataform() async {
    return 'Google';
  }
}
