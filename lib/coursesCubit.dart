import 'package:flutter_bloc/flutter_bloc.dart';
import 'CoursesRepository.dart';
import 'CoursesState.dart';

class CoursesCubit extends Cubit<CoursesState> {
  final CoursesRepository _coursesRepository;
  CoursesCubit(this._coursesRepository) : super(CoursesInitial());

  Future<void> loadCourses() async {
    try {
      emit(CoursesLoading());
      print("yükleniyor.");
      final response = await _coursesRepository.getCourses();
      print("kursları getir.");
      print(response);
      emit(CoursesCompleted(response));
      print("kurslar tamalandı.");
    } catch (e) {
      emit(CoursesError("Hata oluştu."));
      print("HATA HATA HALAAA");
    }
  }
}
