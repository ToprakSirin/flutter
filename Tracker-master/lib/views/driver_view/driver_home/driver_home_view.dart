import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:tracker/components/util/screen_util.dart';
// import controller
import 'package:tracker/controllers/driver_home/driver_home_controller.dart';
// import model
import 'package:tracker/models/driver_home/driver_home_model.dart';

import 'layouts/header.dart';
import 'layouts/student_card.dart';

class DriverHomeView extends StatelessWidget {
  static const routeName = "/driver-home";

  @override
  Widget build(BuildContext context) {
    DriverHomeController viewController = DriverHomeController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      viewController.setter(context);
    });
    return Consumer<DriverHomeModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              //Header Section
              SliverAppBar(
                centerTitle: true,
                title: Text("DriverHome"),
                pinned: true,
                stretch: false,
                elevation: SizeConfig.textMultiplier * .56,
                forceElevated: true,
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft:
                            Radius.circular(SizeConfig.textMultiplier * 10),
                        bottomRight:
                            Radius.circular(SizeConfig.textMultiplier * 10))),
                expandedHeight: SizeConfig.heightMultiplier * 40,
                flexibleSpace: FlexibleSpaceBar(
                  background: Header(),
                ),
                bottom: PreferredSize(
                  preferredSize:
                      Size.fromHeight(SizeConfig.heightMultiplier * 4),
                  child: Container(),
                ),
              ),
              //Student List Section
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext ctx, int index) =>
                          StudentCard(student: viewModel.studentData[index]),
                      childCount: students.length))
            ],
          ),
        );
      },
    );
  }
}
