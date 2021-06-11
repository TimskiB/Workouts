import '../backend/backend.dart';
import '../build_workout/build_workout_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../workout_part/workout_part_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<GcomponentsRecord>>(
      stream: queryGcomponentsRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        List<GcomponentsRecord> homePageGcomponentsRecordList = snapshot.data;
        // Customize what your widget looks like with no query results.
        if (snapshot.data.isEmpty) {
          // return Container();
          // For now, we'll just include some dummy data.
          homePageGcomponentsRecordList =
              createDummyGcomponentsRecord(count: 1);
        }
        final homePageGcomponentsRecord = homePageGcomponentsRecordList.first;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.tertiaryColor,
            automaticallyImplyLeading: false,
            title: Text(
              'Smart3 Workouts V1',
              style: FlutterFlowTheme.title1.override(
                fontFamily: 'Poppins',
              ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 5,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  duration: Duration(milliseconds: 500),
                  reverseDuration: Duration(milliseconds: 500),
                  child: BuildWorkoutWidget(),
                ),
              );
            },
            backgroundColor: FlutterFlowTheme.primaryColor,
            elevation: 8,
            child: Icon(
              Icons.add,
              color: FlutterFlowTheme.tertiaryColor,
              size: 24,
            ),
          ),
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 80, 0, 0),
                  child: Text(
                    'Gali\'s Workout',
                    style: FlutterFlowTheme.title3.override(
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                Divider(
                  height: 2,
                  thickness: 1,
                  indent: 15,
                  endIndent: 120,
                  color: Colors.black,
                ),
                StreamBuilder<List<GcomponentsRecord>>(
                  stream: queryGcomponentsRecord(),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    List<GcomponentsRecord> rowGcomponentsRecordList =
                        snapshot.data;
                    // Customize what your widget looks like with no query results.
                    if (snapshot.data.isEmpty) {
                      // return Container();
                      // For now, we'll just include some dummy data.
                      rowGcomponentsRecordList =
                          createDummyGcomponentsRecord(count: 4);
                    }
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(rowGcomponentsRecordList.length,
                            (rowIndex) {
                          final rowGcomponentsRecord =
                              rowGcomponentsRecordList[rowIndex];
                          return StreamBuilder<List<GcomponentsRecord>>(
                            stream: queryGcomponentsRecord(
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              List<GcomponentsRecord>
                                  cardGcomponentsRecordList = snapshot.data;
                              // Customize what your widget looks like with no query results.
                              if (snapshot.data.isEmpty) {
                                // return Container();
                                // For now, we'll just include some dummy data.
                                cardGcomponentsRecordList =
                                    createDummyGcomponentsRecord(count: 1);
                              }
                              final cardGcomponentsRecord =
                                  cardGcomponentsRecordList.first;
                              return Padding(
                                padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.scale,
                                        alignment: Alignment.bottomCenter,
                                        duration: Duration(milliseconds: 500),
                                        reverseDuration:
                                            Duration(milliseconds: 500),
                                        child: WorkoutPartWidget(
                                          name: rowGcomponentsRecord.name,
                                          url: rowGcomponentsRecord.url,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Color(0xFF4FC3F7),
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Container(
                                      width: 115,
                                      height: 115,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment(1, -1),
                                            child: IconButton(
                                              onPressed: () async {
                                                await rowGcomponentsRecord
                                                    .reference
                                                    .delete();
                                              },
                                              icon: Icon(
                                                Icons.remove_circle,
                                                color: Colors.black,
                                                size: 22,
                                              ),
                                              iconSize: 22,
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment(0, 0),
                                            child: Text(
                                              rowGcomponentsRecord.name,
                                              style: FlutterFlowTheme.title2
                                                  .override(
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment(0, 1),
                                            child: ToggleIcon(
                                              onPressed: () async {
                                                final completed =
                                                    !rowGcomponentsRecord
                                                        .completed;

                                                final gcomponentsRecordData =
                                                    createGcomponentsRecordData(
                                                  completed: completed,
                                                );

                                                await rowGcomponentsRecord
                                                    .reference
                                                    .update(
                                                        gcomponentsRecordData);
                                              },
                                              value: rowGcomponentsRecord
                                                  .completed,
                                              onIcon: Icon(
                                                Icons.check_box,
                                                color: Colors.black,
                                                size: 22,
                                              ),
                                              offIcon: Icon(
                                                Icons.check_box_outline_blank,
                                                color: Colors.black,
                                                size: 22,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 50, 0, 0),
                  child: Text(
                    'Tim\'s Workout',
                    style: FlutterFlowTheme.title3.override(
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                Divider(
                  height: 2,
                  thickness: 1,
                  indent: 15,
                  endIndent: 120,
                  color: Colors.black,
                ),
                StreamBuilder<List<TcomponentsRecord>>(
                  stream: queryTcomponentsRecord(),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    List<TcomponentsRecord> rowTcomponentsRecordList =
                        snapshot.data;
                    // Customize what your widget looks like with no query results.
                    if (snapshot.data.isEmpty) {
                      // return Container();
                      // For now, we'll just include some dummy data.
                      rowTcomponentsRecordList =
                          createDummyTcomponentsRecord(count: 4);
                    }
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(rowTcomponentsRecordList.length,
                            (rowIndex) {
                          final rowTcomponentsRecord =
                              rowTcomponentsRecordList[rowIndex];
                          return StreamBuilder<List<GcomponentsRecord>>(
                            stream: queryGcomponentsRecord(
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              List<GcomponentsRecord>
                                  cardGcomponentsRecordList = snapshot.data;
                              // Customize what your widget looks like with no query results.
                              if (snapshot.data.isEmpty) {
                                // return Container();
                                // For now, we'll just include some dummy data.
                                cardGcomponentsRecordList =
                                    createDummyGcomponentsRecord(count: 1);
                              }
                              final cardGcomponentsRecord =
                                  cardGcomponentsRecordList.first;
                              return Padding(
                                padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.scale,
                                        alignment: Alignment.bottomCenter,
                                        duration: Duration(milliseconds: 500),
                                        reverseDuration:
                                            Duration(milliseconds: 500),
                                        child: WorkoutPartWidget(
                                          name: rowTcomponentsRecord.name,
                                          url: rowTcomponentsRecord.url,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: FlutterFlowTheme.secondaryColor,
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Container(
                                      width: 115,
                                      height: 115,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment(1, -1),
                                            child: IconButton(
                                              onPressed: () async {
                                                await rowTcomponentsRecord
                                                    .reference
                                                    .delete();
                                              },
                                              icon: Icon(
                                                Icons.remove_circle,
                                                color: Colors.black,
                                                size: 22,
                                              ),
                                              iconSize: 22,
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment(0, 0),
                                            child: Text(
                                              rowTcomponentsRecord.name,
                                              style: FlutterFlowTheme.title2
                                                  .override(
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment(0, 1),
                                            child: ToggleIcon(
                                              onPressed: () async {
                                                final completed =
                                                    !rowTcomponentsRecord
                                                        .completed;

                                                final tcomponentsRecordData =
                                                    createTcomponentsRecordData(
                                                  completed: completed,
                                                );

                                                await rowTcomponentsRecord
                                                    .reference
                                                    .update(
                                                        tcomponentsRecordData);
                                              },
                                              value: rowTcomponentsRecord
                                                  .completed,
                                              onIcon: Icon(
                                                Icons.check_box,
                                                color: Colors.black,
                                                size: 22,
                                              ),
                                              offIcon: Icon(
                                                Icons.check_box_outline_blank,
                                                color: Colors.black,
                                                size: 22,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
