import 'package:demo_egitim/courses.dart';

class CoursesAnswer {
  List<Courses>? coursesList;

  CoursesAnswer({this.coursesList});

  factory CoursesAnswer.fromJson(Map<String, dynamic> json) {
    var jsonArray = json["data"] as List;

    List<Courses> coursesList = jsonArray
        .map((jsonArrayObject) => Courses.fromJson(jsonArrayObject))
        .toList();

    return CoursesAnswer(coursesList: json["data"]);
  }
}
