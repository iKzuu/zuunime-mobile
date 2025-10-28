class AnimeBroadcast {
  final String? day;
  final String? time;
  final String? timezone;
  final String? string;

  AnimeBroadcast({
    this.day,
    this.time,
    this.timezone,
    this.string,
  });

  factory AnimeBroadcast.fromJson(Map<String, dynamic> json) {
    return AnimeBroadcast(
      day: json["day"],
      time: json["time"],
      timezone: json["timezone"],
      string: json["string"],
    );
  }
}