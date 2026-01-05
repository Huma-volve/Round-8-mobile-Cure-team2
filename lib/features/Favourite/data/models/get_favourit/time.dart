class Time {
  final String? date;
  final String? startTime;
  final String? endTime;

  const Time({this.date, this.startTime, this.endTime});

  factory Time.fromJson(Map<String, dynamic> json) => Time(
    date: json['date'] as String?,
    startTime: json['start_time'] as String?,
    endTime: json['end_time'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'date': date,
    'start_time': startTime,
    'end_time': endTime,
  };
}
