// ignore_for_file: unused_field

import 'dart:io';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart' as enc;
import 'package:crypto/crypto.dart'; // For hashing
import 'package:path/path.dart' as p;

class SecureVault {
  // Use AES with GCM for authenticated encryption
  // reliable and standard for file vaults.
  final enc.Encrypter _encrypter;
  final enc.Key _key;
  final enc.IV _iv;

// In SecureVault constructor, you're creating duplicate keys
// Fix the constructor:
SecureVault(String keyString, this._key, this._iv)
    : _encrypter = enc.Encrypter(enc.AES(
        enc.Key.fromUtf8(keyString.padRight(32, '0').substring(0, 32)),
        mode: enc.AESMode.gcm,
      ));

  /// Encrypts a file and returns the path to the encrypted artifact
  Future<Map<String, dynamic>> encryptFile(File originalFile) async {
    if (!originalFile.existsSync()) {
      throw Exception("File not found: ${originalFile.path}");
    }

    // 1. Read bytes
    final bytes = await originalFile.readAsBytes();

    // 2. Encrypt
    // For GCM, the IV (nonce) should ideally be unique per file. 
    // We generate a random IV for this specific operation.
    final fileIv = enc.IV.fromSecureRandom(16);
    final encrypted = _encrypter.encryptBytes(bytes, iv: fileIv);

    // 3. Prepare output path
    final dir = originalFile.parent;
    // ignore: unused_local_variable
    final extension = p.extension(originalFile.path);
    final filename = p.basenameWithoutExtension(originalFile.path);
    final encryptedPath = p.join(dir.path, '$filename.enc');

    // 4. Write to disk
    // We prepend the IV to the file so we can read it back during decryption
    final fileSink = File(encryptedPath).openWrite();
    fileSink.add(fileIv.bytes);
    fileSink.add(encrypted.bytes);
    await fileSink.flush();
    await fileSink.close();

    // 5. Calculate source hash for integrity verification
    final sourceHash = sha256.convert(bytes).toString();

    return {
      'encryptedPath': encryptedPath,
      'originalSize': bytes.length,
      'encryptedSize': File(encryptedPath).lengthSync(),
      'sourceHash': sourceHash,
      'iv': fileIv.base64,
    };
  }

  /// Decrypts a file and returns the bytes (for playback/display)
  /// It does not write to disk to maintain security (transient decryption).
  Future<Uint8List> decryptFile(String encryptedPath) async {
    final file = File(encryptedPath);
    if (!file.existsSync()) {
      throw Exception("Encrypted file not found");
    }

    final fileBytes = await file.readAsBytes();
    
    // Extract IV (first 16 bytes) and Data (rest)
    final ivBytes = fileBytes.sublist(0, 16);
    final encryptedBytes = fileBytes.sublist(16);

    final iv = enc.IV(ivBytes);
    final encrypted = enc.Encrypted(encryptedBytes);

    // Decrypt
    final decrypted = _encrypter.decryptBytes(encrypted, iv: iv);
    return Uint8List.fromList(decrypted);
  }
}