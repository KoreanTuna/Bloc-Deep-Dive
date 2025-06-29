extension DateTimeExtension on DateTime {
  String get boxOfficeQueryTime {
    /// yyyyMMdd 형식으로 변환
    return '${year.toString().padLeft(4, '0')}${month.toString().padLeft(2, '0')}${day.toString().padLeft(2, '0')}';
  }
}
