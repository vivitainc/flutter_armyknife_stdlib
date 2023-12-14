import 'dart:async';

import 'package:rxdart/rxdart.dart';

part 'streams.stream_emitter.dart';

/// Stream操作関数の糖衣構文
final class Streams {
  Streams._();

  /// tupleへの型指定を省略してStreamのcombineを行う
  static CombineLatestStream<dynamic, (T1, T2)> combineLatest2<T1, T2>(
    Stream<T1> a,
    Stream<T2> b,
  ) {
    return CombineLatestStream.combine2(
      a,
      b,
      (a, b) => (a, b),
    );
  }

  /// tupleへの型指定を省略してStreamのcombineを行う
  static CombineLatestStream<dynamic, (T1, T2, T3)> combineLatest3<T1, T2, T3>(
    Stream<T1> a,
    Stream<T2> b,
    Stream<T3> c,
  ) {
    return CombineLatestStream.combine3(
      a,
      b,
      c,
      (a, b, c) => (a, b, c),
    );
  }

  /// tupleへの型指定を省略してStreamのcombineを行う
  static CombineLatestStream<dynamic, (T1, T2, T3, T4)>
      combineLatest4<T1, T2, T3, T4>(
    Stream<T1> a,
    Stream<T2> b,
    Stream<T3> c,
    Stream<T4> d,
  ) {
    return CombineLatestStream.combine4(
      a,
      b,
      c,
      d,
      (a, b, c, d) => (a, b, c, d),
    );
  }

  /// 生成型のStreamを生成する.
  ///
  /// 生成された [Subject] に対してメッセージを投げることで、別なメソッドからstreamを発生させることができる.
  /// [block] 内部で発生した例外は呼び出し側に例外として再送される.
  /// [block] が完了したら自動的にStreamは閉じられる.
  static Stream<T> generate<T>(
    Future Function(StreamEmitter<T> subject) block,
  ) async* {
    Exception? error;
    final subject = PublishSubject<T>();
    unawaited(() async {
      try {
        await block(StreamEmitter._(subject));
      } on Exception catch (e) {
        error = e;
      } finally {
        await subject.close();
      }
    }());

    await for (final value in subject) {
      yield value;
    }

    // Subjectが閉じたら、エラーをチェック
    if (error != null) {
      throw error!;
    }
  }
}
