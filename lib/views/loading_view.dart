import 'package:flutter/material.dart';
import 'package:zerei_opensource/widgets/dot_grow_widget.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DotGrowWidget(
            color: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(height: 10),
          Text(
            "Por favor, aguarde.",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
