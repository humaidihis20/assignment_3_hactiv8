class TypecodeModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  TypecodeModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  // factory TypecodeModel.fromJson(Map<String, dynamic> json) {
  //   return TypecodeModel(
  //     userId: json['userId'] ?? 0,
  //     id: json['id'] ?? 0,
  //     title: json['title'] ?? '',
  //     body: json['body'] ?? '',
  //   );
  // }
}
