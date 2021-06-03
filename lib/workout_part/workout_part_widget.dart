import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_youtube_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        automaticallyImplyLeading: true,
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
      body: SafeArea(
        child: Align(
          alignment: Alignment(0, 0),
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: FlutterFlowYoutubePlayer(
              url: widget.url,
              width: double.infinity,
              height: double.infinity,
              autoPlay: false,
              looping: true,
              mute: false,
              showControls: true,
            ),
          ),
        ),
      ),
    );
  }
}
