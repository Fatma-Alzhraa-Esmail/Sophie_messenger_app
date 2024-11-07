class UserModel {
  String? name;
  String? email;
  String? gender;
  String? phone;
  String? image;
  bool? isVerified;
 String? uid;


  UserModel({this.name, this.email, this.gender, this.phone,this.image,this.isVerified, this.uid});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      gender: json['gender'],
      phone: json['phone'],
      image: json['image'], 
      isVerified: json['isVerified'], 
      uid: json['uid'], 
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "gender": gender,
        "phone": phone,
        "image":image,
        "isVerified":isVerified,
        "uid":uid,
      };
}
