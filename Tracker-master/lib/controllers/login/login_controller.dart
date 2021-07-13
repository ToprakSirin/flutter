import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import model
import 'package:tracker/models/login/login_model.dart';

class LoginController {
  LoginController();

  void getter(BuildContext context) {
    LoginModel viewModel = Provider.of<LoginModel>(context, listen: false);
    //TODO Add code here for getter
    viewModel.getter();
  }

  void setter(BuildContext context) {
    LoginModel viewModel = Provider.of<LoginModel>(context, listen: false);
    //TODO Add code here for setter
    viewModel.setter();
  }

  void update(BuildContext context) {
    LoginModel viewModel = Provider.of<LoginModel>(context, listen: false);
    //TODO Add code here for update
    viewModel.update();
  }

  void remove(BuildContext context) {
    LoginModel viewModel = Provider.of<LoginModel>(context, listen: false);
    //TODO Add code here for remove
    viewModel.remove();
  }
}
