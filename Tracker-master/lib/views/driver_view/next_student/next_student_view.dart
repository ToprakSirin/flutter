import 'dart:async';

import 'package:tracker/components/layout/appbar.dart';
import 'package:tracker/components/util/screen_util.dart';
import 'package:tracker/models/driver_home/driver_home_model.dart';
import 'package:tracker/components/util/map_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class NextStudentView extends StatefulWidget {
  static const routeName = "/next-student";

  @override
  _NextStudentViewState createState() => _NextStudentViewState();
}

class _NextStudentViewState extends State<NextStudentView> {
  static Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  bool isFirst = true;
  GoogleMapController controller;
  Set<Marker> _marker = {};

  BitmapDescriptor marker =
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow);
  static CameraPosition _targetPos(LatLng pos) => CameraPosition(
      bearing: 192.8334901395799,
      target: pos,
      tilt: 59.440717697143555,
      zoom: 13);

  @override
  Widget build(BuildContext context) {
    // DriverHomeController viewController = DriverHomeController();
    return Consumer<DriverHomeModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: getAppBar(title: "Next Student", ctx: context),
          body: viewModel.nextStudent == null
              // if next student does not exist
              ? Center(
                  child: Container(
                    width: SizeConfig.widthMultiplier * 70,
                    child: Text(
                      "You need to  first of all set the some student as a next students",
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )

              // Google Map controller
              : GoogleMap(
                  initialCameraPosition: _targetPos(viewModel.nextStudent.pos),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  zoomControlsEnabled: true,
                  zoomGesturesEnabled: true,
                  buildingsEnabled: true,
                  mapToolbarEnabled: true,
                  markers: _marker,
                  mapType: MapType.normal,
                  trafficEnabled: true,
                  tiltGesturesEnabled: true,
                  compassEnabled: true,
                  indoorViewEnabled: true,
                  onMapCreated: (GoogleMapController ctrllr) {
                    ctrllr.setMapStyle(MapUtils.light);
                    setState(() {
                      _marker.clear();
                      _marker.add(Marker(
                          markerId: MarkerId('NextStud'),
                          icon: marker,
                          consumeTapEvents: false,
                          position: viewModel.nextStudent.pos,
                          infoWindow: InfoWindow(
                              title: viewModel.nextStudent.name +
                                  " " +
                                  viewModel.nextStudent.surName,
                              snippet: viewModel.nextStudent.parent.phone)));
                    });
                    _controller.complete(ctrllr);
                    controller = ctrllr;
                  },
                ),
        );
      },
    );
  }
}
