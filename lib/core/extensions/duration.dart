extension DurationFormatting on Duration {
  String get format {
    final minutes = inMinutes;
    final seconds = inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  String get hoursAndMinutes {
    final hours = inHours;
    final minutes = inMinutes % 60;
    final hoursPart = hours > 0 ? '${hours}h ' : '';
    final minutesPart = minutes > 0 ? '${minutes}m' : '';
    return '$hoursPart$minutesPart'.trim();
  }
}

extension MinutesExtension on int {
  Duration get toDuration => Duration(minutes: this);
}
