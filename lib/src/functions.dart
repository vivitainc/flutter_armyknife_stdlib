/// Future<void>.delayed()の糖衣構文.
Future delayed(final Duration duration) => Future<void>.delayed(duration);

/// NOP命令（No Operation)を発行する.
/// この命令はDart実行ループの1イテレーションをSkipしたい場合等に使用する.
Future nop() => delayed(Duration.zero);

/// 指定した2つの型が同一であればtrue.
/// これはGenericsのTypeチェックに利用する.
bool typesEqual<T1, T2>() => T1 == T2;
