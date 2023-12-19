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

  test('streamInStream', () async {
    Stream<int> step1() async* {
      yield 0;
      await Future.delayed(const Duration(milliseconds: 100));
      yield 1;
      throw Exception('error');
    }

    Stream<int> step2() async* {
      await for (final v in step1()) {
        yield v;
      }
    }

    try {
      await for (final v in step2()) {
        debugPrint('v: $v');
      }

      fail('no error');
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      debugPrint('e: $e');
    }
    debugPrint('finish');
  });
}
