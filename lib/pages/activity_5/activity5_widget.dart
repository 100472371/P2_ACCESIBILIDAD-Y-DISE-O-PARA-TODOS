import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/idioma/idioma_widget.dart';
import '/pages/menu_hamburguesa_container/menu_hamburguesa_container_widget.dart';
import 'package:flutter/material.dart';
import 'activity5_model.dart';
export 'activity5_model.dart';

class Activity5Widget extends StatefulWidget {
  const Activity5Widget({super.key});

  @override
  State<Activity5Widget> createState() => _Activity5WidgetState();
}

class _Activity5WidgetState extends State<Activity5Widget> {
  late Activity5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Activity5Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        endDrawer: Drawer(
          elevation: 16.0,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: const BoxDecoration(
                  color: Color(0x33000000),
                ),
              ),
              wrapWithModel(
                model: _model.menuHamburguesaContainerModel,
                updateCallback: () => safeSetState(() {}),
                child: const MenuHamburguesaContainerWidget(),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (responsiveVisibility(
                context: context,
                tabletLandscape: false,
                desktop: false,
              ))
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 120.0,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF1A237E), Color(0xFF3949AB)],
                      stops: [0.0, 1.0],
                      begin: AlignmentDirectional(0.0, -1.0),
                      end: AlignmentDirectional(0, 1.0),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, -0.12),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 24.0, 24.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Semantics(
                                    label: 'Icono para cambiar el lenguaje',
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () =>
                                                  FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: const IdiomaWidget(),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: Icon(
                                        Icons.language_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 30.0,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          2.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'fk8j1vn3' /* Actividades deportivas */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .override(
                                              fontFamily: 'Inter Tight',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        13.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'p90ebrp2' /* Elige tu deporte favorito y ad... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            color: const Color(0xFFE0E0E0),
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.02, -0.36),
                        child: Semantics(
                          label: 'Icono para volver a la página anterior',
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.safePop();
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              size: 30.0,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.99, -0.43),
                        child: Semantics(
                          label: 'Icono para abrir el menu hamburguesa',
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              scaffoldKey.currentState!.openEndDrawer();
                            },
                            child: Icon(
                              Icons.menu,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              size: 30.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(32.0),
                    topRight: Radius.circular(32.0),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(32.0, 24.0, 32.0, 24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('Activities_ALL');
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFE3F2FD),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 16.0, 8.0, 16.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'e72l1uar' /* Todos */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color: const Color(0xFF1565C0),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('Activity_1');
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0x6BFF5963),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 16.0, 8.0, 16.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'snrglhuv' /* Pabellón */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('Activity_2');
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFE8F5E9),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 16.0, 8.0, 16.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'otnaseji' /* Futbol-7 */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color: const Color(0xFF2E7D32),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('Activity_3');
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFFF3E0),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 16.0, 8.0, 16.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'bc92ho7x' /* Futbol-11 */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color: const Color(0xFFEF6C00),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('Activity_4');
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0x79F9CF58),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 16.0, 8.0, 16.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '2chwxwre' /* Pádel */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .warning,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0x67EE8B60),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 16.0, 8.0, 16.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'dilxgrp5' /* Natación */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: const Color(0xEDEE8B60),
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 12.0)),
                              ),
                            ],
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        child: Image.network(
                                          'https://www.madrid.es/UnidadesDescentralizadas/Deportes/EntidadesYOrganismos/CentrosDeportivosMunicipales/ficheros/imagenes2017/Concepci%C3%B3n.jpg',
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Semantics(
                                        label:
                                            'Imagen de una piscina interior de gimnasio',
                                        child: Container(
                                          decoration: const BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 16.0, 16.0, 16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    16.0,
                                                                    8.0,
                                                                    16.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'vdbbk8at' /* 5€ hora */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '4t91kc8d' /* NATACIÓN */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Inter Tight',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 30.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w900,
                                            ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'mt3qsvra' /* Permiso para nadar en la pisci... */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Semantics(
                                    label: 'Botón de comprar ya',
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed('Calendario');
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'hlsgx5c8' /* Comprar ya */,
                                      ),
                                      options: FFButtonOptions(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 50.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Inter Tight',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 16.0)),
                              ),
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(height: 24.0)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}