class TokenRefreshModel {
  final String access;

  TokenRefreshModel.fromJson(Map<String, dynamic> json)
      : access = json['access'];
}
