import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_mail_sender_method_channel.dart';

abstract class FlutterMailSenderPlatform extends PlatformInterface {
  /// Constructs a FlutterMailSenderPlatform.
  FlutterMailSenderPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterMailSenderPlatform _instance = MethodChannelFlutterMailSender();

  /// The default instance of [FlutterMailSenderPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterMailSender].
  static FlutterMailSenderPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterMailSenderPlatform] when
  /// they register themselves.
  static set instance(FlutterMailSenderPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
