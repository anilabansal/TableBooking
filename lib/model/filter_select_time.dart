class FilterSelectTime {
  String? startTime;
  String? endTime;
  FilterSelectTime({this.startTime, this.endTime});
  FilterSelectTime.fromJson(Map<String, dynamic> json) {
    startTime = json['startTime'];
    endTime = json['endTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    return data;
  }
}