import 'package:flutter/material.dart';
import 'package:zerei_opensource/core/models/auth_form_data_model.dart';
import 'package:zerei_opensource/widgets/custom_text_form_field_widget.dart';

// TODO modificar o Stateful da tela para utilizar Mobx
class AuthForm extends StatefulWidget {
  final void Function(AuthFormDataModel) onSubmit;
  const AuthForm({
    super.key,
    required this.onSubmit,
  });

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = AuthFormDataModel();

  void _submit() {
    FocusManager.instance.primaryFocus?.unfocus();
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    widget.onSubmit(_formData);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[700],
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (_formData.isSignup)
                CustomTextFormFieldWidget(
                  key: const ValueKey('name'),
                  initialValue: _formData.name,
                  onChanged: (value) => _formData.name = value,
                  labelText: 'Nome',
                  validator: (inputName) {
                    final name = inputName ?? '';
                    if (name.trim().length < 3) {
                      return 'Nome deve ter no mínimo 3 caracteres.';
                    }
                    return null;
                  },
                ),
              CustomTextFormFieldWidget(
                customKey: const ValueKey('email'),
                initialValue: _formData.email,
                onChanged: (value) => _formData.email = value,
                labelText: 'E-mail',
                validator: (inputEmail) {
                  final email = inputEmail ?? '';
                  if (!email.contains('@')) {
                    return 'E-mail informado não é válido.';
                  }
                  return null;
                },
              ),
              CustomTextFormFieldWidget(
                key: const ValueKey('password'),
                obscureText: true,
                initialValue: _formData.password,
                onChanged: (value) => _formData.password = value,
                labelText: 'Senha',
                validator: (inputPassword) {
                  final password = inputPassword ?? '';
                  if (password.length < 6) {
                    return 'Senha deve ter no mínimo 6 caracteres.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
                onPressed: _submit,
                child: Text(
                  _formData.isLogin ? 'Entrar' : 'Cadastrar',
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.secondary,
                ),
                onPressed: () {
                  setState(() {
                    _formData.toggleAuthMode();
                  });
                },
                child: Text(
                  _formData.isLogin
                      ? 'Criar uma nova conta?'
                      : 'Já possui conta?',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
