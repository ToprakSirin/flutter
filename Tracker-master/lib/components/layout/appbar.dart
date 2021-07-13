import 'package:flutter/material.dart';

AppBar getAppBar({String title, BuildContext ctx}) {
  return AppBar(
    backgroundColor: Theme.of(ctx).canvasColor,
    elevation: 0,
    title: Text(title),
    centerTitle: true,
  );
}
