import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_media_app/firebase_options.dart';
import 'package:social_media_app/state/auth/providers/auth_state_provider.dart';
import 'package:social_media_app/state/auth/providers/is_logged_in_provider.dart';
import 'package:social_media_app/state/providers/is_loading_provider.dart';
import 'package:social_media_app/views/components/loading/loading_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instat-Gram',
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.blueGrey,
            indicatorColor: Colors.blueGrey),
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
        ),
        themeMode: ThemeMode.dark,
        home: Consumer(
          builder: (context, ref, child) {
            ref.listen<bool>(
              isLoadingProvider,
              (_, isLoading) {
                if (isLoading) {
                  LoadingScreen.instance().show(
                    context: context,
                  );
                } else {
                  LoadingScreen.instance().hide();
                }
              },
            );
            final isLoggedIn = ref.watch(isLoggedInProvider);
            if (isLoggedIn) {
              return const MainView();
            }
            return const LoginView();
          },
        ));
  }
}

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Main Page'),
        ),
        body: Consumer(
          builder: (_, ref, child) {
            return TextButton(
              onPressed: () async {
                final result =
                    await ref.read(authStateProvider.notifier).logOut();
              },
              child: const Text("Logout"),
            );
          },
        ));
  }
}

class LoginView extends StatelessWidget {
  const LoginView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Consumer(
          builder: (context, ref, child) {
            return Column(
              children: [
                TextButton(
                  onPressed: () async {
                    await ref
                        .read(authStateProvider.notifier)
                        .loginWithGoogle();
                  },
                  child: const Text("Google"),
                ),
                TextButton(
                  onPressed: () async {
                    await ref
                        .read(authStateProvider.notifier)
                        .loginWithFacebook();
                  },
                  child: const Text("Facebook"),
                ),
              ],
            );
          },
        ));
  }
}
