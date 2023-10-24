import 'package:flutter/material.dart';
import 'package:zerei_opensource/core/services/auth/auth_service.dart';
import 'package:zerei_opensource/widgets/auth_form.dart';
import 'package:zerei_opensource/widgets/dot_grow_widget.dart';
import 'package:zerei_opensource/core/models/auth_form_data_model.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  bool _isLoading = false;

  Future<void> _handleSubmit(AuthFormDataModel formData) async {
    try {
      if (!mounted) return;
      setState(() => _isLoading = true);
      if (formData.isLogin) {
        await AuthService().login(
          formData.email,
          formData.password,
        );
      } else {
        await AuthService().signup(
          formData.name,
          formData.email,
          formData.password,
        );
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('E-mail ou senha inválida!'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    } finally {
      if (!mounted) return;
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: AuthForm(
                onSubmit: _handleSubmit,
              ),
            ),
          ),
          if (_isLoading)
            Container(
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
              child: Center(
                child: DotGrowWidget(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            )
        ],
      ),
    );
  }
}
