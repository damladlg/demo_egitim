import 'dart:convert';
import 'dart:io';
import 'api.dart';
import 'courses.dart';

abstract class CoursesRepository {
  Future<List<Courses>> getCourses();
}

class SampleCoursesRepository implements CoursesRepository {
  Api api = Api();

  parseCourseResponse(Map response) {
    return Courses.fromJson(response);
  }

  @override
  Future<List<Courses>> getCourses() async {
    var response = await api
        .get("users/me/education-plans?per_page=-1&limit=6&sort=-start_date");

    print("istek attı.");
    print(response.body);
    return parseCourseResponse(response.body);
  }
}

class NetworkError implements Exception {
  final String statusCode;
  final String message;

  NetworkError(this.statusCode, this.message);
}
