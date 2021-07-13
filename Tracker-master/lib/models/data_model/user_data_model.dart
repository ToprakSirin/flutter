import 'package:tracker/models/data_model/parent_data_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

enum Status {
  inBus,
  wait,
  notTaking,
  next,
}

enum DeliveryStatus {
  homeToSchool,
  schoolToHome,
  booth,
}

class Student {
  int id;
  String name;
  String surName;
  Status status;
  DateTime lastUpdate;
  DeliveryStatus deliveryStatus;
  Parent parent;
  LatLng pos;

  Student(
      {this.id,
      this.name,
      this.surName,
      this.status,
      this.deliveryStatus,
      this.lastUpdate,
      this.parent,
      this.pos});
}
