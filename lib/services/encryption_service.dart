import 'package:encrypt/encrypt.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
class EncryptionService {
  // AES encryption key (must be 32 bytes for AES-256)
  static final key = Key.fromUtf8(dotenv.env['ENCRYPTION_KEY'] ?? "");

  // AES encryption IV (must be 16 bytes)
  static final iv = IV.fromLength(16);

  // Encrypt data
  static String encryptData(String plainText) {
    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  // Decrypt data
  static String decryptData(String encryptedText) {
    final encrypter = Encrypter(AES(key));
    final decrypted = encrypter.decrypt64(encryptedText, iv: iv);
    return decrypted;
  }
}