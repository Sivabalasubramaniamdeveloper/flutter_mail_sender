import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_mail_sender_platform_interface.dart';

/// An implementation of [FlutterMailSenderPlatform] that uses method channels.
class MethodChannelFlutterMailSender extends FlutterMailSenderPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_mail_sender');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
