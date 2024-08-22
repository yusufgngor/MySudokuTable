import 'dart:convert';

import 'package:my_sudoku_table/models/cell_model.dart';
import 'package:my_sudoku_table/view_modal/sudoku_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveManager {
  static final SaveManager _singleton = SaveManager._internal();
  factory SaveManager() {
    return _singleton;
  }
  SaveManager._internal();

  Future<bool> save(SudokuNotifier sudokuNotifier) async {
    final sp = await SharedPreferences.getInstance();
    final cellsJson = jsonEncode(sudokuNotifier.cells);

    return await sp.setString("cells", cellsJson);
  }

  Future<List<Cell>?> load() async {
    final sp = await SharedPreferences.getInstance();

    final cellsJson = sp.getString("cells");
    if (cellsJson == null) {
      return null;
    }

    final List<dynamic> cellsList = jsonDecode(cellsJson);
    return cellsList.map((e) => Cell.fromJson(e)).toList();
  }
}
