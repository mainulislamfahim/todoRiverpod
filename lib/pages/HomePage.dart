import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todoriverpod/pages/title.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final newTodoController = useTextEditingController();

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 800,
          ),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            children: [
              Titles(),
              TextField(
                controller: newTodoController,
                decoration: InputDecoration(
                  labelText: 'What needs to be Done?',
                ),
                onSubmitted: (value) {},
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [],
              )
            ],
          ),
        ),
      ),
    );
  }
}
