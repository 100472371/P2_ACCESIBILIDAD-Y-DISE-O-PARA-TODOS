// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class WidgetLogo extends StatefulWidget {
  const WidgetLogo({
    super.key,
    this.width = 50.0, // Default width
    this.height = 50.0, // Default height
    required this.logoPath, // Path or URL of the logo image
  });

  final double? width;
  final double? height;
  final String logoPath; // Ruta local o URL de la imagen

  @override
  State<WidgetLogo> createState() => _WidgetLogoState();
}

class _WidgetLogoState extends State<WidgetLogo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        shape: BoxShape.circle, // Logo en forma circular
        color: Colors.transparent, // Fondo transparente
      ),
      child: ClipOval(
        // Clip circular para la imagen
        child: widget.logoPath.startsWith('http') // Verifica si es un URL
            ? Image.network(
                widget.logoPath,
                fit: BoxFit.cover,
                width: widget.width,
                height: widget.height,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child:
                        CircularProgressIndicator(), // Indicador mientras carga
                  );
                },
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.error,
                  color: Colors.red, // Ícono de error si falla la carga
                ),
              )
            : Image.asset(
                widget.logoPath,
                fit: BoxFit.cover,
                width: widget.width,
                height: widget.height,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.error,
                  color:
                      Colors.red, // Ícono de error si la ruta local no existe
                ),
              ),
      ),
    );
  }
}
