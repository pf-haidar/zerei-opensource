import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zerei_opensource/core/services/auth/auth_service.dart';
import 'package:zerei_opensource/core/store/search.store.dart';
import 'package:zerei_opensource/widgets/alert_dialog_widget.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<SearchStore>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          TextButton.icon(
            icon: Icon(
              Icons.login,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: () => showDialog(
              context: context,
              builder: (context) => AlertDialogWidget(
                title: 'Deseja realizar o LogOut?',
                onPressed: () {
                  AuthService().logout();
                  store.clearSearchList();
                  Navigator.of(context).pop();
                },
              ),
            ),
            label: Text(
              'LogOut',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
          ),
        ],
      ),
    );
  }
}
