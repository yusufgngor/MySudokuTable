import 'dart:collection';
import 'dart:convert';

import 'package:my_sudoku_table/models/cell_model.dart';
import 'package:my_sudoku_table/view_modal/sudoku_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveManager {
  final SudokuNotifier _sudokuNotifier;

  SaveManager(this._sudokuNotifier);

  Future<bool> save() async {
    //save cells
    final sp = await SharedPreferences.getInstance();

    final cellsJson = jsonEncode(_sudokuNotifier.cells);
    final actionsJson = jsonEncode(_sudokuNotifier.lastActions.toList());

    final jobs = await Future.wait([
      sp.setString("cells", cellsJson),
      sp.setString("actions", actionsJson),
    ]);

    return jobs.first && jobs.last;
  }

  Future<(List<Cell>?, Queue<Cell>?)> load() async {
    final sp = await SharedPreferences.getInstance();

    List<Cell>? cells;
    Queue<Cell>? actions;

    final cellsJson = sp.getString("cells");
    if (cellsJson != null) {
      final List<dynamic> cellsList = jsonDecode(cellsJson);
      cells = cellsList.map((e) => Cell.fromJson(e)).toList();
    }
    //load history
    final actionsJson = sp.getString("actions");
    if (actionsJson != null) {
      final List<dynamic> cellsList = jsonDecode(actionsJson);
      final actionList = cellsList.map<Cell>((e) => Cell.fromJson(e));
      actions = Queue.from(actionList);
    }

    return (cells, actions);
  }


  void clear() async {
    final sp = await SharedPreferences.getInstance();
    await sp.clear();
  }
}
