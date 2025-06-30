extension DateTimeExtension on DateTime {
  String get boxOfficeQueryTime {
    /// yyyyMMdd 형식으로 변환
    return '${year.toString().padLeft(4, '0')}${month.toString().padLeft(2, '0')}${day.toString().padLeft(2, '0')}';
  }

  /// yyyy년 M월 d일 형식으로 변환
  String get koreanDateTime {
    /// yyyy년 MM월 dd일 형식으로 변환
    return '$year년 $month월 $day일';
  }
}
