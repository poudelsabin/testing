import 'dart:convert';

UserResponse userResponseFromJson(String str) =>
    UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  bool? status;
  User? user;
  String? token;

  UserResponse({
    this.status,
    this.user,
    this.token,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        status: json["status"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "user": user?.toJson(),
        "token": token,
      };
}

class User {
  Professional? professional;
  String? id;
  String? username;
  String? type;
  String? email;
  String? password;
  bool? isAvatarImageSet;
  String? avatarImage;
  bool? isVerified;
  List<Additional>? additional;
  List<dynamic>? appliedJobs;
  List<dynamic>? savedJobs;
  List<dynamic>? events;
  List<dynamic>? todos;
  int? v;
  String? firstName;
  String? lastName;
  String? phone;

  User({
    this.professional,
    this.id,
    this.username,
    this.type,
    this.email,
    this.password,
    this.isAvatarImageSet,
    this.avatarImage,
    this.isVerified,
    this.additional,
    this.appliedJobs,
    this.savedJobs,
    this.events,
    this.todos,
    this.v,
    this.firstName,
    this.lastName,
    this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        professional: json["professional"] == null
            ? null
            : Professional.fromJson(json["professional"]),
        id: json["_id"],
        username: json["username"],
        type: json["type"],
        email: json["email"],
        password: json["password"],
        isAvatarImageSet: json["isAvatarImageSet"],
        avatarImage: json["avatarImage"],
        isVerified: json["isVerified"],
        additional: json["additional"] == null
            ? []
            : List<Additional>.from(
                json["additional"]!.map((x) => Additional.fromJson(x))),
        appliedJobs: json["appliedJobs"] == null
            ? []
            : List<dynamic>.from(json["appliedJobs"]!.map((x) => x)),
        savedJobs: json["savedJobs"] == null
            ? []
            : List<dynamic>.from(json["savedJobs"]!.map((x) => x)),
        events: json["events"] == null
            ? []
            : List<dynamic>.from(json["events"]!.map((x) => x)),
        todos: json["todos"] == null
            ? []
            : List<dynamic>.from(json["todos"]!.map((x) => x)),
        v: json["__v"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "professional": professional?.toJson(),
        "_id": id,
        "username": username,
        "type": type,
        "email": email,
        "password": password,
        "isAvatarImageSet": isAvatarImageSet,
        "avatarImage": avatarImage,
        "isVerified": isVerified,
        "additional": additional == null
            ? []
            : List<dynamic>.from(additional!.map((x) => x.toJson())),
        "appliedJobs": appliedJobs == null
            ? []
            : List<dynamic>.from(appliedJobs!.map((x) => x)),
        "savedJobs": savedJobs == null
            ? []
            : List<dynamic>.from(savedJobs!.map((x) => x)),
        "events":
            events == null ? [] : List<dynamic>.from(events!.map((x) => x)),
        "todos": todos == null ? [] : List<dynamic>.from(todos!.map((x) => x)),
        "__v": v,
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
      };
}

class Additional {
  dynamic education;
  dynamic experience;
  String? id;

  Additional({
    this.education,
    this.experience,
    this.id,
  });

  factory Additional.fromJson(Map<String, dynamic> json) => Additional(
        education: json["education"],
        experience: json["experience"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "education": education,
        "experience": experience,
        "_id": id,
      };
}

class Professional {
  String? title;
  String? sector;
  List<String>? skills;
  String? summary;

  Professional({
    this.title,
    this.sector,
    this.skills,
    this.summary,
  });

  factory Professional.fromJson(Map<String, dynamic> json) => Professional(
        title: json["title"],
        sector: json["sector"],
        skills: json["skills"] == null
            ? []
            : List<String>.from(json["skills"]!.map((x) => x)),
        summary: json["summary"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "sector": sector,
        "skills":
            skills == null ? [] : List<dynamic>.from(skills!.map((x) => x)),
        "summary": summary,
      };
}
