import 'package:zerei_opensource/core/models/user_model.dart';
import 'package:zerei_opensource/core/services/auth/auth_firebase_service.dart';

abstract class AuthService {
  UserModel? get currentUser;

  Stream<UserModel?> get userChanges;

  Future<void> signup(
    String name,
    String email,
    String password,
  );

  Future<void> login(
    String email,
    String password,
  );

  Future<void> logout();

  factory AuthService() {
    return AuthFirebaseService();
  }
}
