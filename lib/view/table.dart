import 'package:flutter/material.dart';
import 'package:my_sudoku_table/view/cell.dart';
import 'package:my_sudoku_table/view/settings.dart';

final emptySide = BorderSide(
  color: Colors.black,
  width: 0,
);
final boldSide = BorderSide(
  color: Colors.black,
  width: 1,
);

final BorderSide thinSide = BorderSide(
  color: Colors.black,
  width: 0,
);

Border getBorder(int index) {
  // 9x9 sudoku tablosu
  int row = index ~/ 9;
  int col = index % 9;

  return Border(
    top: (row % 3 == 0) ? boldSide : emptySide,
    left: (col % 3 == 0) ? boldSide : emptySide,
    right: (col == 8)
        ? boldSide
        : (col % 3 == 2)
            ? thinSide
            : emptySide,
    bottom: (row == 8)
        ? boldSide
        : (row % 3 == 2)
            ? thinSide
            : emptySide,
  );
}

class SudokuTable extends StatelessWidget {
  const SudokuTable({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    //Sudoku table is a 9x9 grid
    return Row(
      children: [
        SizedBox(
          height: size.height * 0.75,
          width: size.height * 0.75,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 9,
            ),
            itemCount: 81,
            itemBuilder: (context, index) {
              return Cell(
                index: index,
                border: getBorder(index),
              );
            },
          ),
        ),
        SettingArea()
      ],
    );
  }
}
