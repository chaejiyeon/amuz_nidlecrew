class User {
  final String? userName;
  final String? userEmail;
  final String? gender;
  final String? address;
  final int? phoneNum;


  User({this.userName, this.userEmail, this.gender, this.address, this.phoneNum});


  factory User.fromJson(dynamic json){
    return User(
      userName: json['userName'] as String?,
      userEmail: json['userEmail'] as String?,
      gender: json['gender'] as String?,
      address: json['address'] as String?,
      phoneNum: json['phoneNum'] as int?,
    );
  }


  Map<String, dynamic> toJson(){
    return <String, dynamic>{
      'userName': userName,
      'userEmail': userEmail,
      'gender': gender,
      'address': address,
      'phoneNum': phoneNum,

    };
  }

}