[![Github Actions](https://github.com/vivitainc/flutter_armyknife_stdlib/actions/workflows/flutter-package-test.yaml/badge.svg)](https://github.com/vivitainc/flutter_armyknife_stdlib/actions/workflows/flutter-package-test.yaml)

## Features

Flutterの標準ライブラリおよびデファクトスタンダードライブラリ用の拡張関数や
よく使用する処理を提供する.

## Usage

```dart
Value? value;

value?.also((value) => /* execute... */);
final valueString = value?.let((value) => value.toString()) ?? '';
```
