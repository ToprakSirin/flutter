import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import model
import 'package:tracker/models/driver_home/driver_home_model.dart';

class DriverHomeController {
  DriverHomeController();

  void getter(BuildContext context) {
    DriverHomeModel viewModel =
        Provider.of<DriverHomeModel>(context, listen: false);
    //TODO Add code here for getter
    viewModel.getter();
  }

  void setter(BuildContext context) {
    DriverHomeModel viewModel =
        Provider.of<DriverHomeModel>(context, listen: false);
    viewModel.setter();
  }

  void update(BuildContext context) {
    DriverHomeModel viewModel =
        Provider.of<DriverHomeModel>(context, listen: false);
    //TODO Add code here for update
    viewModel.update();
  }

  void remove(BuildContext context) {
    DriverHomeModel viewModel =
        Provider.of<DriverHomeModel>(context, listen: false);
    //TODO Add code here for remove
    viewModel.remove();
  }
}
