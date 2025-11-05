import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_mail_sender/flutter_mail_sender.dart';
import 'package:flutter_mail_sender/flutter_mail_sender_platform_interface.dart';
import 'package:flutter_mail_sender/flutter_mail_sender_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterMailSenderPlatform
    with MockPlatformInterfaceMixin
    implements FlutterMailSenderPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterMailSenderPlatform initialPlatform = FlutterMailSenderPlatform.instance;

  test('$MethodChannelFlutterMailSender is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterMailSender>());
  });

  test('getPlatformVersion', () async {
    FlutterMailSender flutterMailSenderPlugin = FlutterMailSender();
    MockFlutterMailSenderPlatform fakePlatform = MockFlutterMailSenderPlatform();
    FlutterMailSenderPlatform.instance = fakePlatform;

    expect(await flutterMailSenderPlugin.getPlatformVersion(), '42');
  });
}
