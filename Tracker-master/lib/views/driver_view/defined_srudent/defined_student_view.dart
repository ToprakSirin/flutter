import 'dart:async';

import 'package:tracker/components/layout/appbar.dart';
import 'package:tracker/components/layout/button/button.dart';
import 'package:tracker/components/util/map_utils.dart';
import 'package:tracker/components/util/screen_util.dart';
import 'package:tracker/models/data_model/user_data_model.dart';
import 'package:tracker/models/driver_home/driver_home_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class DefinedStudentView extends StatefulWidget {
  static String routeName = '/defined-student';
  @override
  _DefinedStudentViewState createState() => _DefinedStudentViewState();
}

int selectedIndex = 0;

class _DefinedStudentViewState extends State<DefinedStudentView> {
  static Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  GoogleMapController controller;

  static CameraPosition _targetPos(LatLng pos) => CameraPosition(
      bearing: 192.8334901395799,
      target: pos,
      tilt: 59.440717697143555,
      zoom: 10);
  List<Marker> _marker(List<Student> data) => data
      .map((dataItem) => Marker(
            markerId: MarkerId('${dataItem.id}'),
            position: dataItem.pos,
            infoWindow: InfoWindow(),
            icon: dataItem.id == selectedIndex
                ? BitmapDescriptor.defaultMarkerWithHue(50)
                : BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueAzure),
            consumeTapEvents: true,
            onTap: () => setState(() {
              selectedIndex = dataItem.id;
            }),
          ))
      .toList();

  resetCameraPosition(LatLng pos) {
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        bearing: 192.8334901395799,
        target: pos,
        tilt: 59.440717697143555,
        zoom: 10)));
    setState(() {
      selectedIndex = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DriverHomeModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: getAppBar(ctx: context, title: "Defined Student"),
          body: Container(
            child: Stack(
              children: [
                Container(
                  margin:
                      EdgeInsets.only(top: SizeConfig.heightMultiplier * 40),
                  child: NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (overscroll) {
                        overscroll.disallowGlow();
                        return true;
                      },
                      child: ListView.builder(
                          itemCount: viewModel.studentData.length,
                          addRepaintBoundaries: false,
                          addSemanticIndexes: false,
                          addAutomaticKeepAlives: false,
                          itemBuilder: (ctx, index) => Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: SizeConfig.heightMultiplier * 1,
                                    horizontal: SizeConfig.widthMultiplier * 5),

                                // Card Design
                                child: GestureDetector(
                                  onTap: () => setState(() {
                                    controller.animateCamera(
                                        CameraUpdate.newCameraPosition(
                                            CameraPosition(
                                                bearing: 192.8334901395799,
                                                target: viewModel
                                                    .studentData[index].pos,
                                                tilt: 59.440717697143555,
                                                zoom: 13)));
                                    selectedIndex =
                                        viewModel.studentData[index].id;
                                  }),
                                  child: Container(
                                      height: SizeConfig.textMultiplier * 10,
                                      decoration: BoxDecoration(
                                          color: selectedIndex ==
                                                  viewModel
                                                      .studentData[index].id
                                              ? Theme.of(context).primaryColor
                                              : Theme.of(context).canvasColor,
                                          boxShadow: [
                                            BoxShadow(
                                                spreadRadius: 2,
                                                blurRadius: 10,
                                                color: Colors.black12
                                                    .withOpacity(.05)),
                                            BoxShadow(color: Colors.black12)
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  SizeConfig.widthMultiplier *
                                                      2))),
                                      alignment: Alignment.centerLeft,
                                      // Card index
                                      child: Container(
                                          padding: EdgeInsets.all(
                                              SizeConfig.heightMultiplier * 3),
                                          child: Text(
                                            viewModel.studentData[index].name +
                                                " " +
                                                viewModel
                                                    .studentData[index].surName,
                                            style: TextStyle(
                                              fontSize:
                                                  SizeConfig.textMultiplier * 2,
                                            ),
                                          ))),
                                ),
                              ))),
                ),
                Container(
                    margin: EdgeInsets.only(
                        bottom: SizeConfig.heightMultiplier * 40),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).disabledColor,
                          spreadRadius: SizeConfig.heightMultiplier * 0.3,
                          blurRadius: SizeConfig.heightMultiplier * 0.3)
                    ]),
                    height: SizeConfig.heightMultiplier * 40,
                    child: GoogleMap(
                      initialCameraPosition:
                          _targetPos(viewModel.studentData[0].pos),
                      markers: _marker(viewModel.studentData).toSet(),
                      zoomControlsEnabled: true,
                      mapType: MapType.normal,
                      trafficEnabled: true,
                      compassEnabled: true,
                      onMapCreated: (GoogleMapController ctrllr) {
                        ctrllr.setMapStyle(MapUtils.light);
                        _controller.complete(ctrllr);
                        controller = ctrllr;
                      },
                    )),
                Container(
                  margin: EdgeInsets.only(
                    left: SizeConfig.widthMultiplier * 25,
                    right: SizeConfig.widthMultiplier * 25,
                    top: SizeConfig.heightMultiplier * 30,
                  ),
                  child: Button(
                      color: Theme.of(context).primaryColor,
                      child: Text("Reset"),
                      height: SizeConfig.heightMultiplier * 5,
                      width: SizeConfig.widthMultiplier * 50,
                      onPress: () =>
                          resetCameraPosition(viewModel.studentData[0].pos)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
