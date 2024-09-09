class Item {
  final int? id;
  final String name;
  final String description;

  Item({this.id, required this.name, required this.description});

  // SQLite에서 데이터를 읽어올 때 Map 형태로 변환
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  // SQLite에서 데이터를 Map 형태로 읽어올 때, 다시 Item 객체로 변환
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      name: map['name'],
      description: map['description'],
    );
  }
}
