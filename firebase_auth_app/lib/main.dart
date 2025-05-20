// main.dart
// Arquivo principal que inicializa o aplicativo Flutter

import 'package:firebase_auth_app/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'services/auth_service.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with options
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // firebase_options.dart
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Usa Provider para gerenciar o estado da autenticação em toda a aplicação
    return ChangeNotifierProvider(
      create: (_) => AuthService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Firebase Auth',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // Usa StreamBuilder para ouvir mudanças no estado de autenticação
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // Se o usuário estiver autenticado, mostra a tela inicial
            // Caso contrário, mostra a tela de login
            if (snapshot.hasData) {
              return HomeScreen();
            }
            return LoginScreen();
          },
        ),
      ),
    );
  }
}
