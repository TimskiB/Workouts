import '../backend/backend.dart';
import '../build_workout/build_workout_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../workout_part/workout_part_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
            MaterialPageRoute(
              builder: (context) => BuildWorkoutWidget(),
            ),
          );
        },
        backgroundColor: FlutterFlowTheme.primaryColor,
        elevation: 8,
        child: Icon(
          Icons.add,
          color: Color(0xFF263238),
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
                      return Padding(
                        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                        child: InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WorkoutPartWidget(
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
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(5, 5, 15, 5),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFF4FC3F7),
                                ),
                                child: Align(
                                  alignment: Alignment(0, -0.05),
                                  child: StreamBuilder<List<GcomponentsRecord>>(
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
                                          textGcomponentsRecordList =
                                          snapshot.data;
                                      // Customize what your widget looks like with no query results.
                                      if (snapshot.data.isEmpty) {
                                        // return Container();
                                        // For now, we'll just include some dummy data.
                                        textGcomponentsRecordList =
                                            createDummyGcomponentsRecord(
                                                count: 1);
                                      }
                                      final textGcomponentsRecord =
                                          textGcomponentsRecordList.first;
                                      return Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 15, 5, 15),
                                        child: Text(
                                          rowGcomponentsRecord.name,
                                          textAlign: TextAlign.center,
                                          style:
                                              FlutterFlowTheme.title3.override(
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
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
                      return Padding(
                        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                        child: InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WorkoutPartWidget(
                                  name: rowTcomponentsRecord.name,
                                  url: rowTcomponentsRecord.url,
                                ),
                              ),
                            );
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xFF9575CD),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(5, 5, 15, 5),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFF9575CD),
                                ),
                                child: Align(
                                  alignment: Alignment(0, -0.05),
                                  child: StreamBuilder<List<GcomponentsRecord>>(
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
                                          textGcomponentsRecordList =
                                          snapshot.data;
                                      // Customize what your widget looks like with no query results.
                                      if (snapshot.data.isEmpty) {
                                        // return Container();
                                        // For now, we'll just include some dummy data.
                                        textGcomponentsRecordList =
                                            createDummyGcomponentsRecord(
                                                count: 1);
                                      }
                                      final textGcomponentsRecord =
                                          textGcomponentsRecordList.first;
                                      return Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 15, 5, 15),
                                        child: Text(
                                          rowTcomponentsRecord.name,
                                          textAlign: TextAlign.center,
                                          style:
                                              FlutterFlowTheme.title3.override(
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
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
  }
}
