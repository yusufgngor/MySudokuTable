import 'package:flutter/material.dart';
import 'package:my_sudoku_table/models/cell_model.dart';
import 'package:my_sudoku_table/view_modal/keyboard_listener.dart';
import 'package:my_sudoku_table/view_modal/save_manager.dart';

enum InputMode {
  value,
  note,
}

class SudokuNotifier extends ChangeNotifier {
  bool loading = true;
  late final List<Cell> _cells;
  final List<List<Cell>> rows = List.generate(9, (_) => [], growable: false);
  final List<List<Cell>> columns = List.generate(9, (_) => [], growable: false);
  final List<List<Cell>> boxes = List.generate(9, (_) => [], growable: false);

  List<Cell> get cells => _cells;

  Cell? selectedCell;
  InputMode inputMode = InputMode.value;

  void init() async {
    final loadedCells = await SaveManager().load();
    if (loadedCells != null) {
      _cells = loadedCells;
    } else {
      _cells = List.generate(81, (index) => Cell(index: index));
    }

    for (var cell in _cells) {
      rows[cell.rowNumber].add(cell);
      columns[cell.columnNumber].add(cell);
      boxes[cell.boxNumber].add(cell);
    }

    SudokuKeyboardListener().register(this);

    loading = false;
    notifyListeners();
  }

  SudokuNotifier() {
    init();
  }

  void updateCell(int index, int value) {
    if (inputMode == InputMode.note) {
      updateCellNote(index, value);
    } else {
      updateCellValue(index, value);
    }

    checkErrors();
    notifyListeners();
    SaveManager().save(this);
  }

  void updateCellNote(int index, int value) {
    if (_cells[index].notes.contains(value)) {
      _cells[index].removeNoteFromCell(value);
    } else {
      _cells[index].addNoteToCell(value);
    }
  }

  void updateCellValue(int index, int value) {
    final cell = _cells[index];
    cell.error = false;

    // remove the value from the notes of the cells in the same row, column and box
    for (var cell in rows[cell.rowNumber]) {
      cell.removeNoteFromCell(value);
    }
    for (var cell in columns[cell.columnNumber]) {
      cell.removeNoteFromCell(value);
    }
    for (var cell in boxes[cell.boxNumber]) {
      cell.removeNoteFromCell(value);
    }

    cell.value = value;
  }

  void checkErrors() {
    for (var cell in _cells) {
      cell.error = false;
    }

    for (var cell in _cells) {
      if (cell.value == null) {
        continue;
      }

      for (var c in rows[cell.rowNumber]) {
        if (c != cell && c.value == cell.value) {
          c.error = true;
          cell.error = true;
        }
      }

      for (var c in columns[cell.columnNumber]) {
        if (c != cell && c.value == cell.value) {
          c.error = true;
          cell.error = true;
        }
      }

      for (var c in boxes[cell.boxNumber]) {
        if (c != cell && c.value == cell.value) {
          c.error = true;
          cell.error = true;
        }
      }
    }
  }

  void clearCell(Cell? cell) {
    cell?.clear();
    notifyListeners();
  }

  void clearAll() {
    for (var cell in _cells) {
      cell.clear();
    }
    notifyListeners();
  }

  void selectCell(Cell cell) {
    selectedCell = cell;
    notifyListeners();
  }

  void toogleInputMode(InputMode inputMode) {
    this.inputMode = inputMode;
    notifyListeners();
  }
}
