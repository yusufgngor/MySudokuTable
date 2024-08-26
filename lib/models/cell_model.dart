import 'dart:convert';

class Cell {
  final int index;
  int? value;
  List<int> notes = [];
  bool error = false;

  get rowNumber => index ~/ 9;
  get columnNumber => index % 9;
  get boxNumber => (rowNumber ~/ 3) * 3 + (columnNumber ~/ 3);

  Cell({required this.index, this.value});

  addNoteToCell(int note) {
    notes.add(note);
  }

  removeNoteFromCell(int note) {
    notes.remove(note);
  }

  clear() {
    value = null;
    notes = [];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "index": index,
      "value": value,
      "notes": notes,
    };
  }

  factory Cell.fromMap(Map<String, dynamic> map) {
    final cell = Cell(
      index: map["index"]?.toInt(),
      value: map["value"]?.toInt(),
    );
    cell.notes = List<int>.from(map["notes"]?.map((x) => x.toInt()));
    return cell;
  }

  String toJson() => json.encode(toMap());

  factory Cell.fromJson(String source) => Cell.fromMap(json.decode(source));
}
