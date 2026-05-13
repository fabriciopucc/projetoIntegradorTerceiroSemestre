import 'package:flutter/material.dart';

class SnackbarWidget {

  static void mostrar(BuildContext context, String mensagem) {

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        behavior: SnackBarBehavior.floating,
        backgroundColor:const Color.fromARGB(255, 138, 18, 236),
        duration: const Duration(seconds: 5),
      ),
    );
  }
}