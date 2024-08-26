import 'package:flutter/services.dart';
import 'package:my_sudoku_table/view_modal/sudoku_view_model.dart';

class SudokuKeyboardListener {
  static final SudokuKeyboardListener _instance =
      SudokuKeyboardListener._internal();
  factory SudokuKeyboardListener() => _instance;
  SudokuKeyboardListener._internal();

  bool register(SudokuNotifier sudokuNotifier) {
    final updateCell = sudokuNotifier.updateCell;
    final clearCell = sudokuNotifier.clearCell;
    final toogleInputMode = sudokuNotifier.toogleInputMode;
    final selectCell = sudokuNotifier.selectCell;

    // Keyboard listener code
    HardwareKeyboard.instance.addHandler(
      (event) {
        final cells = sudokuNotifier.cells;
        final selectedCell = sudokuNotifier.selectedCell;

        if (event is! KeyDownEvent || selectedCell == null) {
          return true;
        }

        switch (event.logicalKey) {
          // 1-9 keys
          case LogicalKeyboardKey.numpad1:
          case LogicalKeyboardKey.digit1:
            sudokuNotifier.updateCell(selectedCell.index, 1);
            break;
          case LogicalKeyboardKey.numpad2:
          case LogicalKeyboardKey.digit2:
            updateCell(selectedCell.index, 2);
            break;
          case LogicalKeyboardKey.numpad3:
          case LogicalKeyboardKey.digit3:
            updateCell(selectedCell.index, 3);
            break;
          case LogicalKeyboardKey.numpad4:
          case LogicalKeyboardKey.digit4:
            updateCell(selectedCell.index, 4);
            break;
          case LogicalKeyboardKey.numpad5:
          case LogicalKeyboardKey.digit5:
            updateCell(selectedCell.index, 5);
            break;
          case LogicalKeyboardKey.numpad6:
          case LogicalKeyboardKey.digit6:
            updateCell(selectedCell.index, 6);
            break;

          case LogicalKeyboardKey.numpad7:
          case LogicalKeyboardKey.digit7:
            updateCell(selectedCell.index, 7);
            break;
          case LogicalKeyboardKey.numpad8:
          case LogicalKeyboardKey.digit8:
            updateCell(selectedCell.index, 8);
            break;
          case LogicalKeyboardKey.numpad9:
          case LogicalKeyboardKey.digit9:
            updateCell(selectedCell.index, 9);
            break;

          // Manage notes
          case LogicalKeyboardKey.backspace:
          case LogicalKeyboardKey.delete:
            clearCell(selectedCell);
            break;
          case LogicalKeyboardKey.keyQ:
            toogleInputMode(InputMode.note);
            break;
          case LogicalKeyboardKey.keyW:
            toogleInputMode(InputMode.value);
            break;

          // Arrow keys
          case LogicalKeyboardKey.arrowUp:
            if (selectedCell.index >= 9) {
              selectCell(cells[selectedCell.index - 9]);
            }
            break;
          case LogicalKeyboardKey.arrowDown:
            if (selectedCell.index < 72) {
              selectCell(cells[selectedCell.index + 9]);
            }
            break;
          case LogicalKeyboardKey.arrowLeft:
            if (selectedCell.index % 9 != 0) {
              selectCell(cells[selectedCell.index - 1]);
            }
            break;
          case LogicalKeyboardKey.arrowRight:
            if (selectedCell.index % 9 != 8) {
              selectCell(cells[selectedCell.index + 1]);
            }
            break;
          case LogicalKeyboardKey.tab:
            if (selectedCell.index < 80) {
              selectCell(cells[selectedCell.index + 1]);
            }

          default:
            return false;
        }
        return true;
      },
    );

    return true;
  }
}
