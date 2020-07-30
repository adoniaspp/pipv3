class UserAuthModel{
  int id;
  String password;
  String salt;
  String creationDate;
  String idPhone;
  String refreshToken;
  String token;
  String user;

  UserAuthModel(
      {this.id,
      this.password,
      this.salt,
      this.creationDate,
      this.idPhone,
      this.refreshToken,
      this.token,
      this.user});

  UserAuthModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    password = json['password'];
    salt = json['salt'];
    creationDate = json['creation_date'];
    idPhone = json['id_phone'];
    refreshToken = json['refresh_token'];
    token = json['token'];
    user = json['user'];
  }

  UserAuthModel.fromJsonSigin(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    token = json['token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['password'] = this.password;
    data['salt'] = this.salt;
    data['creation_date'] = this.creationDate;
    data['id_phone'] = this.idPhone;
    data['refresh_token'] = this.refreshToken;
    data['user'] = this.user;
    return data;
  }

}