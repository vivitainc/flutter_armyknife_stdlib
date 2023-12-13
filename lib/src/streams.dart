import 'package:rxdart/rxdart.dart';

/// Stream操作関数の糖衣構文
class Streams {
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
}
