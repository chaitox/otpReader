library otp_reader;

import 'package:flutter/cupertino.dart';
import 'package:huawei_account/huawei_account.dart';
import 'package:otp_service_interface/otp_service_interface.dart';
//procedimientos para generar otp servicios de huawei

class OtpReader extends OtpServiceInterface {
  @override
  Future<String> getHasCode() async {
    String hash = await ReadSmsManager.obtainHashcode();
    debugPrint('hash Huawei: $hash');
    return hash;
  }

  @override
  Future<void> listenForOtpCode() async {
    ReadSmsManager.start(({errorCode, message}) {
      debugPrint('mensaje: ${message ?? 'no hay mensaje'}');
      if (message != null) {
        debugPrint('huawei: $message');
      } else {
        debugPrint("Error otp: $errorCode");
      }
    });
  }

  @override
  Future<String> plataform() async {
    return 'Huawei';
  }
}
