class MyUser {
  String ?userID;
  String ?email;
  String ?userName;
  String ?profilURL;
  DateTime ?creadeAt;
  DateTime? updatedAt;
  int ?seviye;

 MyUser({required this.userID, required this.email});

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'email': email,
      'userName': userName ?? '',
      'profilURL': profilURL ?? 'https://w7.pngwing.com/pngs/81/570/png-transparent-profile-logo-computer-icons-user-user-blue-heroes-logo-thumbnail.png',
      'creadeAt': creadeAt ?? '',
      'updatedAt': updatedAt ?? '',
      'seviye':seviye ?? '',
    };
  }
}
