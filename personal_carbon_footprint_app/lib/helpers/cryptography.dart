import 'dart:typed_data';
import 'package:pointycastle/pointycastle.dart';
import 'dart:convert';

//This class manages the cryptography side of the user authentication
class Cryptography {
  //Method which perform the encryption of a password via AES method
  static String encryptPasswordViaAES(String text, String password) {
    final keyBytes = Uint8List.fromList(utf8.encode(password));
    final iv = Uint8List(16);
    final cipher = BlockCipher("AES/CBC")
      ..init(true, ParametersWithIV(KeyParameter(keyBytes), iv));

    final inputBytes = Uint8List.fromList(utf8.encode(text));
    final encryptedBytes = encryptBytes(cipher, inputBytes);

    final encryptedText = base64.encode(encryptedBytes);
    return encryptedText;
  }

  //Method which perform the decryption of a password via AES method
  static String decryptPasswordViaAES(String encryptedText, String password) {
    final keyBytes = Uint8List.fromList(utf8.encode(password));
    final iv = Uint8List(16);
    final cipher = BlockCipher("AES/CBC")
      ..init(false, ParametersWithIV(KeyParameter(keyBytes), iv));

    final encryptedBytes = base64.decode(encryptedText);
    final decryptedBytes = decryptBytes(cipher, encryptedBytes);

    final decryptedText = utf8.decode(decryptedBytes);

    return decryptedText;
  }

  //This method encrypts the bytes as part of the encrypt password process
  static Uint8List encryptBytes(BlockCipher cipher, Uint8List input) {
    final blockSize = cipher.blockSize;
    final paddedInput = padBlock(input, blockSize);
    final result = Uint8List(paddedInput.length);
    for (var i = 0; i < paddedInput.length; i += blockSize) {
      cipher.processBlock(paddedInput, i, result, i);
    }
    return result;
  }

  //This method encrypts the bytes as part of the decrypt password process
  static Uint8List decryptBytes(BlockCipher cipher, Uint8List input) {
    final blockSize = cipher.blockSize;
    final result = Uint8List(input.length);
    for (var i = 0; i < input.length; i += blockSize) {
      cipher.processBlock(input, i, result, i);
    }
    return removePadding(result);
  }

  //This method adds padding as part of the password encryption process
  static Uint8List padBlock(Uint8List input, int blockSize) {
    final padLength = blockSize - (input.length % blockSize);
    final padded = Uint8List(input.length + padLength);
    padded.setAll(0, input);
    for (var i = input.length; i < padded.length; i++) {
      padded[i] = padLength;
    }
    return padded;
  }

  //This method removes the padding as part of the password decryption process
  static Uint8List removePadding(Uint8List input) {
    final padLength = input.last;
    return input.sublist(0, input.length - padLength);
  }
}
