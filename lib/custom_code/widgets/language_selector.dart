// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  bool isEnglish = false;
  String? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 300,
      height: widget.height ?? 200,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Título
          Text(
            'Idioma',
            style: FlutterFlowTheme.of(context).titleMedium.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: 16),
          // Interruptor de idioma
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Español',
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
              Switch(
                value: isEnglish,
                onChanged: (value) {
                  setState(() {
                    isEnglish = value;
                    selectedLanguage = value ? 'en' : 'es';
                  });
                },
              ),
              Text(
                'English',
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ],
          ),
          SizedBox(height: 16),
          Divider(),
          SizedBox(height: 16),
          // Dropdown de selección de idioma
          DropdownButton<String>(
            value: selectedLanguage,
            hint: Text(
              'Seleccione el idioma',
              style: FlutterFlowTheme.of(context).bodyMedium,
            ),
            items: [
              DropdownMenuItem(
                value: 'es',
                child: Text('Español'),
              ),
              DropdownMenuItem(
                value: 'en',
                child: Text('English'),
              ),
            ],
            onChanged: (value) {
              setState(() {
                selectedLanguage = value;
                isEnglish = value == 'en';
              });
            },
            isExpanded: true,
            style: FlutterFlowTheme.of(context).bodyMedium,
            dropdownColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
