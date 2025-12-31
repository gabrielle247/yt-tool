import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';

class SecretBoxCipher {
  Future<Uint8List> decrypt(SecretBox secretBox, {required secretKey, required Uint8List aad}) {
    throw UnimplementedError('decrypt() has not been implemented.');
  }
}
