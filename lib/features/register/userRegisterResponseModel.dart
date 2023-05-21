class UserRegisterResponseModel {
  int code;
  String message;
  Data data;

  UserRegisterResponseModel({
    required this.code,
    required this.message,
    required this.data,
  });

  UserRegisterResponseModel copyWith({
    int? code,
    String? message,
    Data? data,
  }) =>
      UserRegisterResponseModel(
        code: code ?? this.code,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory UserRegisterResponseModel.fromJson(Map<String, dynamic> json) => UserRegisterResponseModel(
    code: json["code"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  int id;
  String userName;
  String phone;
  String email;
  String password;
  int registerStatus;
  bool isActive;
  DateTime createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  Data({
    required this.id,
    required this.userName,
    required this.phone,
    required this.email,
    required this.password,
    required this.registerStatus,
    required this.isActive,
    required this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  Data copyWith({
    int? id,
    String? userName,
    String? phone,
    String? email,
    String? password,
    int? registerStatus,
    bool? isActive,
    DateTime? createdAt,
    dynamic updatedAt,
    dynamic deletedAt,
  }) =>
      Data(
        id: id ?? this.id,
        userName: userName ?? this.userName,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        password: password ?? this.password,
        registerStatus: registerStatus ?? this.registerStatus,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    userName: json["userName"],
    phone: json["phone"],
    email: json["email"],
    password: json["password"],
    registerStatus: json["registerStatus"],
    isActive: json["isActive"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"],
    deletedAt: json["deletedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userName": userName,
    "phone": phone,
    "email": email,
    "password": password,
    "registerStatus": registerStatus,
    "isActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt,
    "deletedAt": deletedAt,
  };
}