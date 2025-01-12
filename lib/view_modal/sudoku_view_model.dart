import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:my_sudoku_table/models/cell_model.dart';
import 'package:my_sudoku_table/view_modal/keyboard_listener.dart';
import 'package:my_sudoku_table/view_modal/save_manager.dart';

enum InputMode {
  value,
  note,
}

abstract class CellAction {
  final Cell cell;

  const CellAction(this.cell);
}

class CellValueAction extends CellAction {
  final int value;

  const CellValueAction(super.cell, this.value);
}

class CellNoteAction extends CellAction {
  final int value;

  const CellNoteAction(super.cell, this.value);
}

class CellClearAction extends CellAction {
  const CellClearAction(super.cell);
}

class CellUndoAction extends CellAction {
  const CellUndoAction(super.cell);
}

class SudokuNotifier extends ChangeNotifier {
  bool loading = true;
  late final SaveManager _saveManager = SaveManager(this);

  late List<Cell> _cells;
  final List<List<Cell>> rows = List.generate(9, (_) => [], growable: false);
  final List<List<Cell>> columns = List.generate(9, (_) => [], growable: false);
  final List<List<Cell>> boxes = List.generate(9, (_) => [], growable: false);

  late Queue<Cell> _lastActions;

  List<Cell> get cells => _cells;
  Queue<Cell> get lastActions => _lastActions;

  Cell? selectedCell;
  InputMode inputMode = InputMode.value;

  void init() async {
    SudokuKeyboardListener().register(this);
    late final emptyCells = List.generate(81, (index) => Cell(index: index));

    final (loadedCells, actions) = await _saveManager.load();
    _lastActions = actions ?? Queue();
    setCells(loadedCells ?? emptyCells);

    loading = false;
    notifyListeners();
  }

  SudokuNotifier() {
    init();
  }

  void setCells(List<Cell> newCells) {
    _cells = newCells;
    for (var cell in _cells) {
      rows[cell.rowNumber].add(cell);
      columns[cell.columnNumber].add(cell);
      boxes[cell.boxNumber].add(cell);
    }
    checkErrors();
    notifyListeners();
  }

  void updateCell(int index, int value) {
    final cell = _cells[index];
    if (inputMode == InputMode.note) {
      updateCellAction(CellNoteAction(cell, value));
    } else {
      updateCellAction(CellValueAction(cell, value));
    }
  }

  void updateCellAction(CellAction action) {
    final cell = action.cell;

    if (action is CellNoteAction) {
      _lastActions.add(cell.copy());
      updateCellNote(cell, action.value);
    } else if (action is CellValueAction) {
      _lastActions.add(cell.copy());

      updateCellValue(cell, action.value);
    } else if (action is CellClearAction) {
      _lastActions.add(cell.copy());

      clearCell(cell);
    } else if (action is CellUndoAction) {
      _cells[cell.index].value = cell.value;
    }
    checkErrors();
    _saveManager.save();

    notifyListeners();
  }

  void updateCellNote(Cell cell, int value) {
    if (cell.notes.contains(value)) {
      cell.removeNoteFromCell(value);
    } else {
      cell.addNoteToCell(value);
    }
  }

  void updateCellValue(Cell cell, int value) {
    cell.error = false;

    // remove the value from the notes of the cells in the same row, column and box
    for (var c in rows[cell.rowNumber]) {
      c.removeNoteFromCell(value);
    }
    for (var c in columns[cell.columnNumber]) {
      c.removeNoteFromCell(value);
    }
    for (var c in boxes[cell.boxNumber]) {
      c.removeNoteFromCell(value);
    }

    cell.value = value;
  }

  void checkErrors() {
    for (var cell in _cells) {
      cell.error = false;

      if (cell.value == null) {
        continue;
      }

      final row = rows[cell.rowNumber];
      for (var c in row) {
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
    if (cell != null) {
      updateCellAction(CellClearAction(cell));
    }
    notifyListeners();
  }

  void clearAll() {
    final emptyCellList = List.generate(81, (index) => Cell(index: index));
    //clear rows, columns and boxes
    for (var cell in _cells) {
      rows[cell.rowNumber].clear();
      columns[cell.columnNumber].clear();
      boxes[cell.boxNumber].clear();
    }

    setCells(emptyCellList);
    _lastActions.clear();
    _saveManager.clear();
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

  void undo() {
    if (_lastActions.isNotEmpty) {
      final cell = _lastActions.removeLast();
      updateCellAction(CellUndoAction(cell));
    }
  }
}
