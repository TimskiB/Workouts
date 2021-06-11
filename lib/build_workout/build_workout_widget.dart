import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/home_page_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class BuildWorkoutWidget extends StatefulWidget {
  BuildWorkoutWidget({Key key}) : super(key: key);

  @override
  _BuildWorkoutWidgetState createState() => _BuildWorkoutWidgetState();
}

class _BuildWorkoutWidgetState extends State<BuildWorkoutWidget> {
  TextEditingController nameInput1Controller;
  TextEditingController uRLinput1Controller;
  TextEditingController nameInput2Controller;
  TextEditingController uRLinput2Controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    nameInput1Controller = TextEditingController();
    uRLinput1Controller = TextEditingController();
    nameInput2Controller = TextEditingController();
    uRLinput2Controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.tertiaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'Build Your Workout',
          style: FlutterFlowTheme.title1.override(
            fontFamily: 'Poppins',
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Add For Gali',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Montserrat',
                              color: Color(0xFF0D1724),
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: 330,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Color(0xFFE6E6E6),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                                child: TextFormField(
                                  controller: nameInput1Controller,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Name',
                                    labelStyle:
                                        FlutterFlowTheme.bodyText2.override(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xFF8B97A2),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    hintText: 'Booty',
                                    hintStyle:
                                        FlutterFlowTheme.bodyText2.override(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xFF8B97A2),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.bodyText2.override(
                                    fontFamily: 'Montserrat',
                                    color: Color(0xFF8B97A2),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: 330,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Color(0xFFE6E6E6),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                                child: TextFormField(
                                  controller: uRLinput1Controller,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Url',
                                    labelStyle:
                                        FlutterFlowTheme.bodyText2.override(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xFF8B97A2),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    hintText: 'https://www.youtube.com/.....',
                                    hintStyle:
                                        FlutterFlowTheme.bodyText2.override(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xFF8B97A2),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.bodyText2.override(
                                    fontFamily: 'Montserrat',
                                    color: Color(0xFF8B97A2),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.95, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            final name = nameInput1Controller.text;
                            final url = uRLinput1Controller.text;
                            final completed = false;

                            final gcomponentsRecordData =
                                createGcomponentsRecordData(
                              name: name,
                              url: url,
                              completed: completed,
                            );

                            await GcomponentsRecord.collection
                                .doc()
                                .set(gcomponentsRecordData);
                            await Navigator.pushAndRemoveUntil(
                              context,
                              PageTransition(
                                type: PageTransitionType.topToBottom,
                                duration: Duration(milliseconds: 500),
                                reverseDuration: Duration(milliseconds: 500),
                                child: HomePageWidget(),
                              ),
                              (r) => false,
                            );
                          },
                          text: 'Add',
                          options: FFButtonOptions(
                            width: 100,
                            height: 40,
                            color: FlutterFlowTheme.primaryColor,
                            textStyle: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            elevation: 2,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 2,
                            ),
                            borderRadius: 8,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Add For Tim',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Montserrat',
                              color: Color(0xFF0D1724),
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: 330,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Color(0xFFE6E6E6),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                                child: TextFormField(
                                  controller: nameInput2Controller,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Name',
                                    labelStyle:
                                        FlutterFlowTheme.bodyText2.override(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xFF8B97A2),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    hintText: 'Abs',
                                    hintStyle:
                                        FlutterFlowTheme.bodyText2.override(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xFF8B97A2),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.bodyText2.override(
                                    fontFamily: 'Montserrat',
                                    color: Color(0xFF8B97A2),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: 330,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Color(0xFFE6E6E6),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                                child: TextFormField(
                                  controller: uRLinput2Controller,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Url',
                                    labelStyle:
                                        FlutterFlowTheme.bodyText2.override(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xFF8B97A2),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    hintText: 'https://www.youtube.com/.....',
                                    hintStyle:
                                        FlutterFlowTheme.bodyText2.override(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xFF8B97A2),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.bodyText2.override(
                                    fontFamily: 'Montserrat',
                                    color: Color(0xFF8B97A2),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.95, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            final name = nameInput2Controller.text;
                            final url = uRLinput2Controller.text;
                            final completed = false;

                            final tcomponentsRecordData =
                                createTcomponentsRecordData(
                              name: name,
                              url: url,
                              completed: completed,
                            );

                            await TcomponentsRecord.collection
                                .doc()
                                .set(tcomponentsRecordData);
                            await Navigator.pushAndRemoveUntil(
                              context,
                              PageTransition(
                                type: PageTransitionType.topToBottom,
                                duration: Duration(milliseconds: 500),
                                reverseDuration: Duration(milliseconds: 500),
                                child: HomePageWidget(),
                              ),
                              (r) => false,
                            );
                          },
                          text: 'Add',
                          options: FFButtonOptions(
                            width: 100,
                            height: 40,
                            color: FlutterFlowTheme.secondaryColor,
                            textStyle: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            elevation: 2,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 2,
                            ),
                            borderRadius: 8,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
