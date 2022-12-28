class FilterSelectTime {
  String? startTime;
  String? endTime;
  bool? isSelected;
  FilterSelectTime({this.startTime, this.endTime,this.isSelected});
  FilterSelectTime.fromJson(Map<String, dynamic> json) {
    startTime = json['startTime'];
    endTime = json['endTime'];
    isSelected = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    return data;
  }
}