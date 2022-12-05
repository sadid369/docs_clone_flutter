import 'package:docs_clone_flutter/models/error_model.dart';
import 'package:docs_clone_flutter/models/user_model.dart';
import 'package:docs_clone_flutter/repository/auth_repository.dart';
import 'package:docs_clone_flutter/screens/home_screen.dart';
import 'package:docs_clone_flutter/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  ErrorModel? errorModel;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    print(errorModel);
    errorModel = await ref.read(authRepositoryProvider).getUserData();
    print(errorModel!.data);
    print(errorModel);
    if (errorModel != null && errorModel!.data != null) {
      print("pass");
      ref.read(userProvider.notifier).update((state) => errorModel!.data);
      print(userProvider.state);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    print(user);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Docs Clone Flutters',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: user == null ? const LoginScreen() : const HomeScreen(),
    );
  }
}
