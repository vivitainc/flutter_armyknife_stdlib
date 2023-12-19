import 'dart:async';

import 'package:armyknife_stdlib/armyknife_stdlib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future main() async {
  test('toHexString()', () {
    expect(0.toHexString(), equals('00'));
    expect(255.toHexString(), equals('ff'));
    expect((-1).toHexString(), equals('ffffffff'));
    expect(256.toHexString(), equals('0100'));
  });

  test('nop', () async {
    Future asyncCall() async {
      debugPrint('async 1');
      final sw = Stopwatch();
      sw.start();
      await nop();
      sw.stop();
      debugPrint('async 2 / ${sw.elapsedMicroseconds} micro sec');
    }

    debugPrint('call 1');
    unawaited(asyncCall());
    debugPrint('call 2');
    await nop();
    debugPrint('finish()');
  });
}
