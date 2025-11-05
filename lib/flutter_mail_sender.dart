
import 'flutter_mail_sender_platform_interface.dart';

class FlutterMailSender {
  Future<String?> getPlatformVersion() {
    return FlutterMailSenderPlatform.instance.getPlatformVersion();
  }
}
