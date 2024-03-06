import 'package:flutter_test/flutter_test.dart';
import 'package:personal_carbon_footprint_app/helpers/cryptography.dart';
import 'package:personal_carbon_footprint_app/shared/globals.dart';

void main() {
  group(
    'Password cryptography -',
    () {
      test('Password encryption', () async {
        String userPassword = "Test123";
        String encryptedPassword =
            Cryptography.encryptPasswordViaAES(userPassword, encrpytionKey);
        expect(encryptedPassword, "sesTLnuRU6+UDuqNc6L64Q==");
      });

      test('Password decryption', () async {
        String encryptedPassword = "sesTLnuRU6+UDuqNc6L64Q==";
        String decryptedPassword = Cryptography.decryptPasswordViaAES(
            encryptedPassword, encrpytionKey);
        expect(decryptedPassword, "Test123");
      });
    },
  );
}
