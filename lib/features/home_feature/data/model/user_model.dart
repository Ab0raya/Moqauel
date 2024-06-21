class User {
  int? userId;
  String userName;
  String language;
  int themeColor;
  String avatar;

  User({
    this.userId,
    required this.userName,
    required this.language,
    required this.themeColor,
    required this.avatar,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'userName': userName,
      'language': language,
      'themeColor': themeColor,
      'avatar':avatar
    };
  }
}