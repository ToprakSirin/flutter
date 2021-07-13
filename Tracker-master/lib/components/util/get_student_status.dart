import 'package:tracker/models/data_model/user_data_model.dart';

String getStatus(Status val) {
  switch (val) {
    case Status.inBus:
      return "In Bus";
    case Status.wait:
      return "Wait";
    case Status.notTaking:
      return "Not Taking";
    case Status.next:
      return "Next Student";
    default:
      throw Exception('Not Found');
  }
}
