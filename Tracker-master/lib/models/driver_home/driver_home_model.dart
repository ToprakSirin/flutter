import 'package:flutter/material.dart';
import 'package:tracker/models/data_model/parent_data_model.dart';
import 'package:tracker/models/data_model/user_data_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

enum DriverHomeModelStatus {
  Ended,
  Loading,
  Error,
}

List<Student> students = [
  Student(
      id: 340983564,
      name: "Jhon",
      surName: "Sawyer",
      deliveryStatus: DeliveryStatus.booth,
      status: Status.wait,
      lastUpdate: DateTime.now(),
      pos: LatLng(39.8696, 32.6462),
      parent: Parent(
          name: "Jeremy M",
          surName: "Sawyer",
          id: 000001,
          mail: "w8vooetvmnb@temporary-mail.net",
          adress: "1882  Wayback Lane, NY, ",
          phone: "917-400-2392")),
  Student(
      id: 465952248,
      name: "Harry",
      surName: "Henry",
      deliveryStatus: DeliveryStatus.booth,
      status: Status.wait,
      lastUpdate: DateTime.now(),
      pos: LatLng(39.7942, 32.6318),
      parent: Parent(
          name: "Sherwood J ",
          surName: "Henry",
          id: 000001,
          mail: "bs21vc7uvpr@temporary-mail.net",
          adress: "3041  Morris Street, Hobe Sound, FL",
          phone: "772-245-9231")),
  Student(
      id: 654871354,
      name: "George",
      surName: "Williams",
      deliveryStatus: DeliveryStatus.booth,
      status: Status.wait,
      lastUpdate: DateTime.now(),
      pos: LatLng(39.8401, 32.6977),
      parent: Parent(
          name: "Lorenzo L ",
          surName: "Williams",
          id: 000001,
          mail: "w8vooetvmnb@temporary-mail.net",
          adress: "1882  Wayback Lane, NY, ",
          phone: "917-400-2392")),
  Student(
      id: 198554451,
      name: "Clooi",
      surName: "Reagan",
      deliveryStatus: DeliveryStatus.booth,
      status: Status.wait,
      lastUpdate: DateTime.now(),
      pos: LatLng(39.8027, 32.7224),
      parent: Parent(
          name: "Danielle R ",
          surName: "Reagan",
          id: 000001,
          mail: "8t0nb79wx0w@temporary-mail.net",
          adress: "878  Overlook Drive, El Paso, TX",
          phone: "915-238-8304")),
];

class DriverHomeModel extends ChangeNotifier {
  DriverHomeModelStatus status = DriverHomeModelStatus.Loading;
  String _errorCode;
  String _errorMessage;
  List<Student> _studentData;
  Student _nextStudent;
  bool _isAnyStudentNext = false;

  String get errorCode => _errorCode;
  String get errorMessage => _errorMessage;
  List<Student> get studentData => _studentData;
  Student get nextStudent => _nextStudent;
  bool get isAnyStudentNext => _isAnyStudentNext;

  DriverHomeModel();

  DriverHomeModel.instance() {
    _studentData = students;
  }

  void setNextStudent(int id) {
    status = DriverHomeModelStatus.Loading;
    notifyListeners();
    _studentData.firstWhere((element) => element.id == id).status = Status.next;
    _nextStudent = _studentData.firstWhere((element) => element.id == id);
    _isAnyStudentNext = true;
    status = DriverHomeModelStatus.Ended;
    notifyListeners();
  }

  void setStudentInVehicle(int id) {
    status = DriverHomeModelStatus.Loading;
    notifyListeners();
    _studentData.firstWhere((element) => element.id == id).status =
        Status.inBus;
    _nextStudent = null;
    _isAnyStudentNext = false;

    status = DriverHomeModelStatus.Ended;
    notifyListeners();
  }

  void getter() {
    status = DriverHomeModelStatus.Loading;
    notifyListeners();

    //TODO Add code here

    status = DriverHomeModelStatus.Ended;
    notifyListeners();
  }

  Future<void> setter() async {
    status = DriverHomeModelStatus.Loading;
    notifyListeners();

    status = DriverHomeModelStatus.Ended;
    notifyListeners();
  }

  void update() {
    status = DriverHomeModelStatus.Loading;
    notifyListeners();

    //TODO Add code here

    status = DriverHomeModelStatus.Ended;
    notifyListeners();
  }

  void remove() {
    status = DriverHomeModelStatus.Loading;
    notifyListeners();

    //TODO Add code here

    status = DriverHomeModelStatus.Ended;
    notifyListeners();
  }
}
