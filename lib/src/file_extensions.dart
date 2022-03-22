import 'dart:io' as io;

import 'package:crypto/crypto.dart' as crypt;

extension IoFileCalculateMd5 on io.File {
  /// ファイルのMD5を計算する.
  /// ファイル読み込み中に問題が発生した場合、io.Fileからの例外をそのまま投げる.
  Future<crypt.Digest> calculateMd5() async {
    return crypt.md5.bind(openRead()).first;
  }
}

extension IoFileCalculateSha1 on io.File {
  /// ファイルのSHA1を計算する.
  /// ファイル読み込み中に問題が発生した場合、io.Fileからの例外をそのまま投げる.
  Future<crypt.Digest> calculateSha1() async {
    return crypt.sha1.bind(openRead()).first;
  }
}

extension IoFileCalculateSha256 on io.File {
  /// ファイルのSHA256を計算する.
  /// ファイル読み込み中に問題が発生した場合、io.Fileからの例外をそのまま投げる.
  Future<crypt.Digest> calculateSha256() async {
    return crypt.sha256.bind(openRead()).first;
  }
}

extension IoFileCalculateSha512 on io.File {
  /// ファイルのSHA512を計算する.
  /// ファイル読み込み中に問題が発生した場合、io.Fileからの例外をそのまま投げる.
  Future<crypt.Digest> calculateSha512() async {
    return crypt.sha512.bind(openRead()).first;
  }
}
