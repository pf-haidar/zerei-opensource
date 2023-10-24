import 'package:flutter/material.dart';
import 'package:zerei_opensource/core/models/user_model.dart';
import 'package:zerei_opensource/core/services/auth/auth_service.dart';
import 'package:zerei_opensource/views/auth_view.dart';
import 'package:zerei_opensource/views/loading_view.dart';
import 'package:zerei_opensource/views/tabs_view.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthOrAppView extends StatelessWidget {
  const AuthOrAppView({super.key});

  Future<void> init() async {
    await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: init(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingView();
        } else {
          return StreamBuilder<UserModel?>(
            stream: AuthService().userChanges,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingView();
              } else {
                return snapshot.hasData ? const TabsView() : const AuthView();
              }
            },
          );
        }
      },
    );
  }
}
