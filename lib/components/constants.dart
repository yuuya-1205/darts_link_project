import 'package:cloud_firestore/cloud_firestore.dart';

class HowLongAgo {
  static String since(Timestamp time) {
    final now = DateTime.now();
    final targetDate = time.toDate();
    final difference = now.difference(targetDate);
    if (difference.compareTo(const Duration(minutes: 1)) <= 0) {
      // １分以内のとき。
      return '今';
    } else if ((difference.compareTo(const Duration(hours: 1)) <= 0)) {
      // １時間以内の時
      return '${difference.inMinutes}分前';
    } else if ((difference.compareTo(const Duration(days: 1)) <= 0)) {
      // １日以内の時
      return '${difference.inHours}時間前';
    } else if ((difference.compareTo(const Duration(days: 30)) <= 0)) {
      // 30日以内の時
      return '${difference.inDays}日前';
    } else {
      return '${targetDate.year}年${targetDate.month}月${targetDate.day}日';
    }
  }
}
