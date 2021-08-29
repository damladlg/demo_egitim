import 'package:demo_egitim/coursesCubit.dart';
import 'package:demo_egitim/coursesState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'CoursesRepository.dart';
import 'CoursesView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => CoursesCubit(SampleCoursesRepository())),
      ],
      child: ViewMyCourses(),
    );
  }
}
