import 'dart:convert';

class Wordle {
  String id;
  int indexWord;
  String name;

  Wordle({
    required this.id,
    required this.indexWord,
    required this.name,
  });

  Wordle copyWith({
    String? id,
    int? indexWord,
    String? name,
  }) {
    return Wordle(
      id: id ?? this.id,
      indexWord: indexWord ?? this.indexWord,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'indexWord': indexWord,
      'name': name,
    };
  }

  factory Wordle.fromMap(Map<String, dynamic> map) {
    return Wordle(
      id: map['id'] ?? '',
      indexWord: map['indexWord']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Wordle.fromJson(String source) => Wordle.fromMap(json.decode(source));

  @override
  String toString() => 'Wordle(id: $id, indexWord: $indexWord, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Wordle && other.id == id && other.indexWord == indexWord && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ indexWord.hashCode ^ name.hashCode;
}
