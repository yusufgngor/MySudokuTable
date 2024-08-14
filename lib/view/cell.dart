import 'package:flutter/material.dart';
import 'package:my_sudoku_table/sudoku_view_model.dart';
import 'package:provider/provider.dart';

class Cell extends StatelessWidget {
  final int index;
  final Border border;
  const Cell({super.key, required this.index, required this.border});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SudokuNotifier>(context, listen: true);
    final cell = vm.cells[index];

    return GestureDetector(
      onTap: (){
        vm.selectCell(cell);
      },
      child: Container(
          height: 50,
          width: 50,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: border,
            color: vm.selectedCell == vm.cells[index]
                ? Colors.blue.withOpacity(0.4)
                : Colors.white,
          ),
          alignment: Alignment.center,
                
          // child: const Center(child: CellText(text: "1")),
          //sudoku notes
          child: Builder(builder: (context) {
            if (cell.value != null) {
              return CellText(text: cell.value.toString());
            }
                
            return CellNote(notes: cell.notes);
          })),
    );
  }
}

//Cell Text
class CellText extends StatelessWidget {
  final String text;
  const CellText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.normal,
        ));
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
    return Text(text,
        textHeightBehavior: const TextHeightBehavior(
          applyHeightToFirstAscent: false,
          applyHeightToLastDescent: false,
        ),
        style: const TextStyle(
          fontSize: 4,
          fontWeight: FontWeight.normal,
        ));
  }
}
