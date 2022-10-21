library otp_service_interface;

abstract class OtpServiceInterface {
  Future<String> plataform();
  Future<String> getHasCode();
  Future<void> listenForOtpCode();
}
