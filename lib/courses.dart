class Courses {
  final String? name;
  final String? startDate;
  final String? endDate;

  Courses({this.name, this.startDate, this.endDate});

  factory Courses.fromJson(Map<dynamic, dynamic> json) {
    return Courses(
      name: json['name'],
      startDate: json['start_date'],
      endDate: json['end_date'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    return data;
  }
}
