class User {
  final String id;

  User({
    required this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'];

  @override
  String toString() {
    return 'id: $id \n';
  }
}
