class MyUser {
  final String userID;
  MyUser(
    this.userID,
  );

  Map<String, dynamic> toMap() {
    return {
      'userID':userID,
    };
  }
}
