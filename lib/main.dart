import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'config/firebase_options.dart';
import 'screens/tela_inicial.dart';

import 'providers/sessao_provider.dart';
import 'providers/variaveis_globais_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [

        ChangeNotifierProvider(
          create: (_) => SessaoProvider(),
        ),

        ChangeNotifierProvider(
          create: (_) => VariaveisGlobaisProvider(),
        ),

      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Void Riddles',

      theme: ThemeData(
        primarySwatch: Colors.blue,

        scaffoldBackgroundColor:
            const Color.fromARGB(255, 250, 246, 252),

        textTheme:
            GoogleFonts.orbitronTextTheme(),
      ),

      home: const TelaInicial(),
    );
  }
}