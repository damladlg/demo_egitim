import 'package:flutter/foundation.dart';
import 'courses.dart';

abstract class CoursesState {
  const CoursesState();
}

class CoursesInitial extends CoursesState {
  const CoursesInitial();
}

class CoursesLoading extends CoursesState {
  const CoursesLoading();
}

class CoursesCompleted extends CoursesState {
  final List<Courses> coursesList;

  const CoursesCompleted(this.coursesList);
}

class CoursesError extends CoursesState {
  String message;
  CoursesError(this.message);
}
