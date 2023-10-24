import 'package:zerei_opensource/core/models/user_model.dart';
import 'package:zerei_opensource/core/services/auth/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';

class AuthFirebaseService implements AuthService {
  static UserModel? _currentUser;
  static final _userStream = Stream<UserModel?>.multi((controller) async {
    final authChanges = FirebaseAuth.instance.authStateChanges();
    await for (final user in authChanges) {
      _currentUser = user == null ? null : _toAppUser(user);
      controller.add(_currentUser);
    }
  });

  @override
  UserModel? get currentUser {
    return _currentUser;
  }

  @override
  Stream<UserModel?> get userChanges {
    return _userStream;
  }

  @override
  Future<void> signup(
    String name,
    String email,
    String password,
  ) async {
    final signup = await Firebase.initializeApp(
      name: 'userSignup',
      options: Firebase.app().options,
    );

    final auth = FirebaseAuth.instanceFor(app: signup);

    UserCredential credential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (credential.user != null) {
      await credential.user?.updateDisplayName(name);
      await login(email, password);
      _currentUser = _toAppUser(credential.user!, name);
      await _saveNewUser(_currentUser!);
    }

    await signup.delete();
  }

  @override
  Future<void> login(
    String email,
    String password,
  ) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logout() async {
    FirebaseAuth.instance.signOut();
  }

  Future<void> _saveNewUser(UserModel user) async {
    final store = FirebaseFirestore.instance;
    final docRef = store.collection('users').doc(user.id);
    store.collection('users').doc(user.id).collection('myGames');

    return docRef.set({
      'name': user.name,
      'email': user.email,
    });
  }

  static UserModel _toAppUser(User user, [String? name]) {
    return UserModel(
      id: user.uid,
      name: name ?? user.displayName ?? user.email!.split('@')[0],
      email: user.email!,
    );
  }
}
