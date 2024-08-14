import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum InputMode {
  value,
  note,
}

class Cell {
  final int index;
  int? value;
  List<int> notes = [];

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

 
}

class SudokuNotifier extends ChangeNotifier {
  final List<Cell> _cells = List.generate(81, (index) => Cell(index: index));

  final List<List<Cell>> rows = List.generate(9, (_) => [], growable: false);
  final List<List<Cell>> columns = List.generate(9, (_) => [], growable: false);
  final List<List<Cell>> boxes = List.generate(9, (_) => [], growable: false);

  List<Cell> get cells => _cells;

  Cell? selectedCell;
  InputMode inputMode = InputMode.note;

  SudokuNotifier() {
    for (var cell in _cells) {
      rows[cell.rowNumber].add(cell);
      columns[cell.columnNumber].add(cell);
      boxes[cell.boxNumber].add(cell);
    }
    HardwareKeyboard.instance.addHandler(
      (event) {
        if (event is! KeyDownEvent || selectedCell == null) {
          return true;
        }

        switch (event.logicalKey) {
          // 1-9 keys
          case LogicalKeyboardKey.digit1:
            updateCell(selectedCell!.index, 1);
            break;
          case LogicalKeyboardKey.digit2:
            updateCell(selectedCell!.index, 2);
            break;
          case LogicalKeyboardKey.digit3:
            updateCell(selectedCell!.index, 3);
            break;
          case LogicalKeyboardKey.digit4:
            updateCell(selectedCell!.index, 4);
            break;
          case LogicalKeyboardKey.digit5:
            updateCell(selectedCell!.index, 5);
            break;
          case LogicalKeyboardKey.digit6:
            updateCell(selectedCell!.index, 6);
            break;
          case LogicalKeyboardKey.digit7:
            updateCell(selectedCell!.index, 7);
            break;
          case LogicalKeyboardKey.digit8:
            updateCell(selectedCell!.index, 8);
            break;
          case LogicalKeyboardKey.digit9:
            updateCell(selectedCell!.index, 9);
            break;

          // Manage notes
          case LogicalKeyboardKey.backspace:
            clearCell(selectedCell!);
            break;
          case LogicalKeyboardKey.keyQ:
            toogleInputMode(InputMode.note);
            break;
          case LogicalKeyboardKey.keyW:
            toogleInputMode(InputMode.value);
            break;

          // Arrow keys
          case LogicalKeyboardKey.arrowUp:
            if (selectedCell!.index >= 9) {
              selectCell(_cells[selectedCell!.index - 9]);
            }
            break;
          case LogicalKeyboardKey.arrowDown:
            if (selectedCell!.index < 72) {
              selectCell(_cells[selectedCell!.index + 9]);
            }
            break;
          case LogicalKeyboardKey.arrowLeft:
            if (selectedCell!.index % 9 != 0) {
              selectCell(_cells[selectedCell!.index - 1]);
            }
            break;
          case LogicalKeyboardKey.arrowRight:
            if (selectedCell!.index % 9 != 8) {
              selectCell(_cells[selectedCell!.index + 1]);
            }
            break;
          case LogicalKeyboardKey.tab:
            if (selectedCell!.index < 80) {
              selectCell(_cells[selectedCell!.index + 1]);
            }

          default:
            return false;
        }
        return true;
      },
    );
  }

  void updateCell(int index, int value) {
    if (inputMode == InputMode.note) {
      if (_cells[index].notes.contains(value)) {
        _cells[index].removeNoteFromCell(value);
      } else {
        _cells[index].addNoteToCell(value);
      }
    } else {
      _cells[index].value = value;
    }
    notifyListeners();
  }

  void clearCell(Cell cell) {
    cell.clear();
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
