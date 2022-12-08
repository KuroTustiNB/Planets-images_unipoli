import 'package:camera/camera.dart';
import 'package:first_app_9/helpers/database_helper.dart';
import 'package:first_app_9/screens/details_page.dart';
import 'package:first_app_9/screens/taken_picture_screen.dart';
import 'package:flutter/material.dart';
import 'package:first_app_9/widgets/image_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../models/cat_model.dart';

class HomePageWidget extends StatefulWidget {
  final CameraDescription firstCamera;

  const HomePageWidget({Key? key, required this.firstCamera}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromARGB(255, 229, 211, 236),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Planetarium',
                          style: FlutterFlowTheme.of(context).title1.override(
                                fontFamily: 'Poppins',
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w800,
                              ),
                        ),
                        Text(
                          '<Make your solar system>',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color.fromARGB(135, 0, 0, 0),
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Expanded(
                child: (FutureBuilder<List<Planet>>(
                    future: DatabaseHelper.instance.getPlanets(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Planet>> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: Container(
                            padding: const EdgeInsets.only(top: 10),
                            child: const Text("Loading"),
                          ),
                        );
                      } else {
                        return snapshot.data!.isEmpty
                            ? Center(
                                child:
                                    Container(child: const Text("No Entries")),
                              )
                            : ListView(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                children: snapshot.data!.map((planet) {
                                  return Center(
                                      child: GestureDetector(
                                    child: Container(
                                      child: Image_s(path: planet.Image),
                                      height: 325,
                                      width: 200,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        final route = MaterialPageRoute(
                                            builder: (context) =>
                                                DetailsScreenWidget(
                                                  firstCamera:
                                                      widget.firstCamera,
                                                  Description:
                                                      planet.Description,
                                                  Image: planet.Image,
                                                  Name: planet.Name,
                                                  Size: planet.Size,
                                                  Type: planet.Type,
                                                ));
                                        Navigator.push(context, route);
                                      });
                                    },
                                  ));
                                }).toList());
                      }
                    })),
              ),

              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 180, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FFButtonWidget(
                      onPressed: () {
                        print('add planet');
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => TakenPictureScreen(
                                    camera: widget.firstCamera,
                                  )),
                        );
                      },
                      text: '',
                      icon: Icon(
                        Icons.add,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 15,
                      ),
                      options: FFButtonOptions(
                        width: 50,
                        height: 50,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //new
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              'assets/images/Mercury.jpg',
                              width: 125,
                              height: 125,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'Mercury',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              'assets/images/venus.jpg',
                              width: 125,
                              height: 125,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'Venus',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              'assets/images/Earth.jpg',
                              width: 125,
                              height: 125,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'Earth',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              'assets/images/Mars.png',
                              width: 125,
                              height: 125,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'Mars',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              'assets/images/Jupiter.jpg',
                              width: 125,
                              height: 125,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'Jupiter',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              'assets/images/Saturn.jpg',
                              width: 125,
                              height: 125,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'Saturn',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              'assets/images/Uranus.jpg',
                              width: 125,
                              height: 125,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'Uranus',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              'assets/images/neptune.jpg',
                              width: 125,
                              height: 125,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'Neptune',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ],
                      ),
                    ),
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
