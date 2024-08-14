import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Cell {
  final int index;
  int? value;
  List<int> notes;

  Cell({required this.index, this.value, this.notes = const [1]});
}

class SudokuNotifier extends ChangeNotifier {
  final List<Cell> _cells = List.generate(81, (index) => Cell(index: index));

  List<Cell> get cells => _cells;

  Cell? selectedCell;

  SudokuNotifier() {
    HardwareKeyboard.instance.addHandler(
      (event) {
        if (selectedCell == null) {
          return true;
        }

        switch (event.logicalKey) {
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
          case LogicalKeyboardKey.backspace:
            clearCell(selectedCell!);
            break;
          default:
            return false;
        }
        return true;
      },
    );
  }

  void updateCell(int index, int value) {
    _cells[index].value = value;
    notifyListeners();
  }

  void addNoteToCell(Cell cell, int note) {
    cell.notes.add(note);
    notifyListeners();
  }

  void removeNoteFromCell(Cell cell, int note) {
    cell.notes.remove(note);
    notifyListeners();
  }

  void clearCell(Cell cell) {
    cell.value = null;
    cell.notes = [];
    notifyListeners();
  }

  void selectCell(Cell cell) {
    selectedCell = cell;
    notifyListeners();
  }
}
