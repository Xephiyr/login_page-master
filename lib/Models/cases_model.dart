class Cases {
  String time;
  String partyName;
  String court;
  String caseno;
  String caseName;

  Cases({this.time, this.partyName, this.court, this.caseno, this.caseName});

  Cases.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    partyName = json['party_name'];
    court = json['court'];
    caseno = json['caseno'];
    caseName = json['case_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['party_name'] = this.partyName;
    data['court'] = this.court;
    data['caseno'] = this.caseno;
    data['case_name'] = this.caseName;
    return data;
  }
}
