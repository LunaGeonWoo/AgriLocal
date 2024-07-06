class TimeFormatter {
  String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    Duration difference = DateTime.now().difference(dateTime);
    String formattedDate;
    if (difference.inDays >= 1) {
      formattedDate = '${difference.inDays}일 전';
    } else if (difference.inHours >= 1) {
      formattedDate = '${difference.inHours}시간 전';
    } else if (difference.inMinutes >= 1) {
      formattedDate = '${difference.inMinutes}분 전';
    } else {
      formattedDate = '방금 전';
    }
    return formattedDate;
  }

  String formatDetailTime(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return '${dateTime.year}년 ${dateTime.month}월 ${dateTime.day}일';
  }
}
