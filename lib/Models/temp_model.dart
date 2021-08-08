class Users {
  String username;
  String email;
  String phone;
  String id;

  Users({this.username, this.email, this.phone, this.id});

  Users.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['Email'];
    phone = json['phone'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['Email'] = this.email;
    data['phone'] = this.phone;
    data['id'] = this.id;
    return data;
  }
}
