import 'package:tracker/components/util/get_student_status.dart';
import 'package:tracker/components/util/screen_util.dart';
import 'package:tracker/models/data_model/user_data_model.dart';
import 'package:tracker/views/driver_view/student_detail/student_detail_view.dart';
import 'package:flutter/material.dart';

class StudentCard extends StatelessWidget {
  final Student student;
  const StudentCard({Key key, this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig.heightMultiplier * 1,
          horizontal: SizeConfig.widthMultiplier * 5),

      // Card Design
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, StudentDetailView.routeName,
            arguments: student.id),
        child: Container(
            height: SizeConfig.textMultiplier * 30,
            decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      color: Colors.black12.withOpacity(.05)),
                  BoxShadow(color: Colors.black12)
                ],
                borderRadius: BorderRadius.all(
                    Radius.circular(SizeConfig.widthMultiplier * 2))),

            // Card index
            child: Container(
                padding: EdgeInsets.all(SizeConfig.heightMultiplier * 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      student.id.toString(),
                      style: TextStyle(
                          fontSize: SizeConfig.textMultiplier * 2,
                          fontWeight: FontWeight.w400),
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          student.name + " " + student.surName,
                          style: TextStyle(
                              fontSize: SizeConfig.textMultiplier * 3,
                              fontWeight: FontWeight.w900),
                        ),
                        Text(
                          getStatus(student.status),
                          style: TextStyle(
                              fontSize: SizeConfig.textMultiplier * 2.5,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Last update: ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}",
                          style: TextStyle(
                              fontSize: SizeConfig.textMultiplier * 2,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      " Details => ",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: SizeConfig.textMultiplier * 2),
                    ),
                  ],
                ))),
      ),
    );
  }
}
