class TokenModel {
  final String access;
  final String refresh;

  TokenModel.fromJson(Map<String, dynamic> json)
      : access = json['access'],
        refresh = json['refresh'];
}
