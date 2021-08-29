import 'package:demo_egitim/courses.dart';
import 'package:demo_egitim/coursesCubit.dart';
import 'package:demo_egitim/CoursesState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'CoursesRepository.dart';

class ViewMyCourses extends StatefulWidget {
  const ViewMyCourses({
    Key? key,
  }) : super(key: key);

  @override
  _ViewMyCourses createState() => _ViewMyCourses();
}

class _ViewMyCourses extends State<ViewMyCourses> {
  @override
  void initState() {
    super.initState();
    context.read<CoursesCubit>().loadCourses();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(child: buildTabbar()),
      ),
    );
  }

  DefaultTabController buildTabbar() {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "Eğitimlerim"),
                Tab(text: "Ön Kayıtlı Eğitimlerim")
              ],
              indicatorColor: Colors.blueGrey,
              labelColor: Colors.black,
            ),
            backgroundColor: Colors.white,
          ),
          body: TabBarView(
            children: [ListViewBuilder(), ListViewBuilder()],
          ),
        ));
  }
}

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<CoursesCubit, CoursesState>(
        builder: (context, state) {
          if (state is CoursesCompleted) {
            return ListView.builder(
              itemCount: state.coursesList.length,
              itemBuilder: (context, index) {
                var course = state.coursesList[index];
                print("${course.name}");
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SizedBox(
                        height: 29,
                        width: 45,
                        child: SvgPicture.network(
                          'http://educatet.com:3000/_nuxt/img/education-default.8891400.svg',
                          //placeholderBuilder: (context) => CircularProgressIndicator(),
                          color: Colors.amber,
                        ),
                      ),
                    ),
                    title: Text("${course.name}",
                        style: new TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w600,
                        )),
                    subtitle: new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                            child: new Text("aaa"),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 4.0),
                            child: new Text(
                                "Başlangıç Tarihi: ${course.startDate}",
                                style: new TextStyle(fontSize: 11.0)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
                            child: new Text("Bitiş Tarihi: ${course.endDate}",
                                style: new TextStyle(fontSize: 11.0)),
                          ),
                          1 > 0
                              ? ProgressBar()
                              : Text("Kursu Başlat",
                                  style: new TextStyle(
                                      fontSize: 13.0, color: Colors.pink)),
                        ]),
                  ),
                );
              },
            );
          } else {
            return Text("hata damlaaaaa");
          }
        },
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
            child: LinearPercentIndicator(
              width: 330.0,
              lineHeight: 10.0,
              percent: 0.6,
              //linearStrokeCap: LinearStrokeCap.butt,
              progressColor: Colors.blueGrey,
            ),
          ),
          Text("%60 Tamamlandı")
        ]);
  }
}
