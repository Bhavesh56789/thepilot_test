import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thepilot_test/features/assigned_class/model/student.model.dart';

final studentControllerProvider = Provider<StudentController>((ref) {
  return StudentController();
});

class StudentController {
  List<StudentModel> getCards() {
    return [
      StudentModel(name: "Bhavesh Bellaney", attendance: "42"),
      StudentModel(name: "Sathak Hussam", attendance: "42"),
    ];
  }
}
