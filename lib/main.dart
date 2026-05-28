import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'config/firebase_options.dart';

import 'providers/sessao_provider.dart';
import 'providers/variaveis_globais_provider.dart';

import 'screens/inicio_screen.dart';

import 'services/audio_service.dart';

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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    iniciarMusica();
  }

  Future<void> iniciarMusica() async {

    final audioService = AudioService();

    await audioService.tocarMusica(
      'audio/tema.mp3',
    );
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Void Riddles',

      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor:const Color.fromARGB(255,250,246,252,),
        textTheme: GoogleFonts.orbitronTextTheme(),
      ),

      home: const TelaInicial(),
    );
  }
}