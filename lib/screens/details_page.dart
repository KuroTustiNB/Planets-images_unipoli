import 'package:camera/camera.dart';
import 'package:first_app_9/screens/home_page.dart';
import 'package:first_app_9/widgets/image_provider.dart';
import 'package:flutter/material.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class DetailsScreenWidget extends StatefulWidget {
  final String Description;
  final String Type;
  final String Size;
  final String Image;
  final String Name;
  final CameraDescription firstCamera;

  const DetailsScreenWidget(
      {Key? key,
      required this.firstCamera,
      required this.Description,
      required this.Type,
      required this.Size,
      required this.Image,
      required this.Name})
      : super(key: key);

  @override
  _DetailsScreenWidgetState createState() => _DetailsScreenWidgetState();
}

class _DetailsScreenWidgetState extends State<DetailsScreenWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromARGB(255, 173, 129, 187),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 184, 150, 194),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                        ),
                        child: Container(
                          child: Image_s(path: widget.Image),
                          width: 100,
                          height: 100,
                        )),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 60,
                        icon: Icon(
                          Icons.arrow_back_outlined,
                          color: Color.fromARGB(255, 0, 0, 0),
                          size: 30,
                        ),
                        onPressed: () async {
                          // Back

                          //context.pushNamed('HomePage');
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => HomePageWidget(
                                    firstCamera: widget.firstCamera)),
                          );
                        },
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 60,
                        icon: Icon(
                          Icons.keyboard_control,
                          color: Color.fromARGB(255, 0, 0, 0),
                          size: 30,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ],
                  ),
                ],
              ),

              //nombre

              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.Name,
                      style: FlutterFlowTheme.of(context).title1.override(
                            fontFamily: 'Poppins',
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                        child: Text('Type')),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        widget.Type,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: Text('Size')),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        widget.Size,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30, 20, 0, 0),
                child: Text(
                  'Details',
                  style: FlutterFlowTheme.of(context).subtitle1.override(
                        fontFamily: 'Poppins',
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 184, 150, 194),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(7, 7, 7, 7),
                    child: Text(
                      widget.Description,
                      style: FlutterFlowTheme.of(context).bodyText1,
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
