import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const _storage = FlutterSecureStorage();

AndroidOptions _getAndroidOptions() =>
    const AndroidOptions(encryptedSharedPreferences: true);

const _getIosoptions = IOSOptions(
  accessibility: KeychainAccessibility.first_unlock,
);

Future<void> writeSecureStorage({
  required String key,
  required String value,
}) async {
  await deleteSecureData(key: key);
  await _storage.write(
    key: key,
    value: value,
    iOptions: _getIosoptions,
    aOptions: _getAndroidOptions(),
  );
}

Future<void> deleteSecureData({required String key}) async {
  await _storage.delete(
    key: key,
    iOptions: _getIosoptions,
    aOptions: _getAndroidOptions(),
  );
}

Future deleteAllSecureData() async {
  await _storage.deleteAll(
    iOptions: _getIosoptions,
    aOptions: _getAndroidOptions(),
  );
}

Future<String?> getUserIdFromSecureStorage() async {
  String? userId = await _storage.read(
    key: 'userId',
    aOptions: _getAndroidOptions(),
    iOptions: _getIosoptions,
  );
  if (userId == null) return null;
  return userId;
}

Future<void> writeUserIdToSecureStorage(String userId) async {
  await _storage.write(
    key: 'userId',
    value: userId,
    aOptions: _getAndroidOptions(),
    iOptions: _getIosoptions,
  );
}
