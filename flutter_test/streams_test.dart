import 'package:armyknife_stdlib/armyknife_stdlib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future main() async {
  test('listen', () async {
    final stream = Streams.generate<int>((emitter) async {
      emitter.value = 1;
      emitter.value = 2;
      emitter.value = 3;
      emitter.value = 4;
    });
    var receive = 0;
    await for (final v in stream) {
      debugPrint('v: $v');
      ++receive;
    }
    expect(receive, equals(4));
  });

  /// listenするまでコールされない
  test('no listen', () async {
    final _ = Streams.generate((emitter) async {
      fail('no call');
    });
    await delayed(const Duration(milliseconds: 100));
  });
}
