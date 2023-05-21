class UserRegisterModel {
  String userName;
  String email;
  String phone;
  String password;

  UserRegisterModel({
    required this.userName,
    required this.email,
    required this.phone,
    required this.password,
  });

  UserRegisterModel copyWith({
    String? userName,
    String? email,
    String? phone,
    String? password,
  }) =>
      UserRegisterModel(
        userName: userName ?? this.userName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        password: password ?? this.password,
      );

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) => UserRegisterModel(
    userName: json["userName"],
    email: json["email"],
    phone: json["phone"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "userName": userName,
    "email": email,
    "phone": phone,
    "password": password,
  };
}