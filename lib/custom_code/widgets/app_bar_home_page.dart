// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:provider/provider.dart'; // Si estás usando Provider para el estado

// Define el widget AppBarHomePage
class AppBarHomePage extends StatefulWidget {
  const AppBarHomePage({
    super.key,
    this.width,
    this.height,
    this.nombreEmpresa,
    this.logoPath,
  });

  final double? width;
  final double? height;
  final String? nombreEmpresa;
  final String? logoPath;

  @override
  State<AppBarHomePage> createState() => _AppBarHomePageState();
}

class _AppBarHomePageState extends State<AppBarHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? kToolbarHeight,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white, // Fondo blanco
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (widget.logoPath != null)
            Image.network(
              widget.logoPath!,
              height: 40.0,
              width: 40.0,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.broken_image, size: 40, color: Colors.grey);
              },
            ),
          const SizedBox(width: 20.0), // Aumentar espacio entre logo y texto
          if (widget.nombreEmpresa != null)
            Expanded(
              child: Text(
                widget.nombreEmpresa!,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20, // Tamaño de texto más grande
                      color: Colors.black, // Color negro
                    ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
        ],
      ),
    );
  }
}

// Define la clase que usa el AppBar con condicional hideBar
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: context.watch<UseData>().hideBar == false
            ? AppBar(
                automaticallyImplyLeading: false, // Sin botón de retroceso
                title: AppBarHomePage(
                  nombreEmpresa: "Mi Empresa",
                  logoPath:
                      "https://via.placeholder.com/40", // Ruta del logo externa
                  width: MediaQuery.of(context).size.width,
                  height: kToolbarHeight,
                ),
                centerTitle: true,
                elevation: 0, // Sin sombra adicional del AppBar
                backgroundColor: Colors.white, // Fondo blanco del AppBar
                iconTheme: const IconThemeData(color: Colors.black),
              )
            : const SizedBox.shrink(),
      ),
      body: Center(
        child: Text('Contenido de la página'),
      ),
    );
  }
}

// Define el estado de hideBar (esto es solo un ejemplo con un modelo simple)
class UseData extends ChangeNotifier {
  bool hideBar = false;

  void toggleHideBar() {
    hideBar = !hideBar;
    notifyListeners();
  }
}
