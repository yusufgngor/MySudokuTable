import 'package:flutter/material.dart';
import 'package:my_sudoku_table/sudoku_view_model.dart';
import 'package:provider/provider.dart';

class CellView extends StatelessWidget {
  final int index;
  final Border border;
  const CellView({super.key, required this.index, required this.border});

  Color cellColor(Cell cell, Cell? selectedCell) {
    if (cell == selectedCell ||
        (selectedCell?.value != null && cell.value == selectedCell?.value)) {
      return Colors.blue.withOpacity(0.5);
    } else if (cell.rowNumber == selectedCell?.rowNumber ||
        cell.columnNumber == selectedCell?.columnNumber ||
        cell.boxNumber == selectedCell?.boxNumber) {
      return Colors.blue.withOpacity(0.1);
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SudokuNotifier>(context, listen: true);
    final cell = vm.cells[index];

    return GestureDetector(
      onTap: () {
        vm.selectCell(cell);
      },
      child: Container(
        height: 50,
        width: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: border,
          color: cellColor(cell, vm.selectedCell),
        ),
        child: CellText(cell: cell),
      ),
    );
  }
}

//CellView Text
class CellText extends StatelessWidget {
  final Cell cell;
  const CellText({super.key, required this.cell});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final fontSize = constraints.maxHeight * 0.75;

      if (cell.value != null) {
        return Text(
          cell.value.toString(),
          textHeightBehavior: const TextHeightBehavior(
            applyHeightToFirstAscent: false,
            applyHeightToLastDescent: false,
          ),
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
          ),
        );
      }
      return CellNote(notes: cell.notes);
    });
  }
}

class CellNote extends StatelessWidget {
  final List<int> notes;
  const CellNote({super.key, required this.notes});
  static const _noteTexts = [
    Align(
      alignment: Alignment.topLeft,
      child: CellNoteText(text: "1"),
    ),
    Align(
      alignment: Alignment.topCenter,
      child: CellNoteText(text: "2"),
    ),
    Align(
      alignment: Alignment.topRight,
      child: CellNoteText(text: "3"),
    ),
    Align(
      alignment: Alignment.centerLeft,
      child: CellNoteText(text: "4"),
    ),
    Align(
      alignment: Alignment.center,
      child: CellNoteText(text: "5"),
    ),
    Align(
      alignment: Alignment.centerRight,
      child: CellNoteText(text: "6"),
    ),
    Align(
      alignment: Alignment.bottomLeft,
      child: CellNoteText(text: "7"),
    ),
    Align(
      alignment: Alignment.bottomCenter,
      child: CellNoteText(text: "8"),
    ),
    Align(
      alignment: Alignment.bottomRight,
      child: CellNoteText(text: "9"),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: notes.map((note) => _noteTexts[note - 1]).toList(),
    );
  }
}

class CellNoteText extends StatelessWidget {
  final String text;
  const CellNoteText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(text,
          textHeightBehavior: const TextHeightBehavior(
            applyHeightToFirstAscent: false,
            applyHeightToLastDescent: false,
          ),
          style: const TextStyle(
            fontWeight: FontWeight.normal,
          )),
    );
  }
}
