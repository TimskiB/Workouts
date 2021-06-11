import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_web_view.dart';
import '../home_page/home_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class WorkoutPartWidget extends StatefulWidget {
  WorkoutPartWidget({
    Key key,
    this.name,
    this.url,
  }) : super(key: key);

  final String name;
  final String url;

  @override
  _WorkoutPartWidgetState createState() => _WorkoutPartWidgetState();
}

class _WorkoutPartWidgetState extends State<WorkoutPartWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          widget.name,
          style: FlutterFlowTheme.title2.override(
            fontFamily: 'Poppins',
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 5,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              duration: Duration(milliseconds: 500),
              reverseDuration: Duration(milliseconds: 500),
              child: HomePageWidget(),
            ),
            (r) => false,
          );
        },
        backgroundColor: Colors.green,
        elevation: 10,
        label: Icon(
          Icons.check_sharp,
          color: Colors.black,
          size: 30,
        ),
      ),
      body: SafeArea(
        child: FlutterFlowWebView(
          url: 'https://flutter.dev',
          bypass: false,
          verticalScroll: true,
          horizontalScroll: false,
        ),
      ),
    );
  }
}
