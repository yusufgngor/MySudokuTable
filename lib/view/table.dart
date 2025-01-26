import 'package:flutter/material.dart';
import 'package:my_sudoku_table/view/cell.dart';
import 'package:my_sudoku_table/view/settings.dart';
import 'package:my_sudoku_table/view_modal/sudoku_view_model.dart';
import 'package:provider/provider.dart';

// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui_web' as ui;
import 'package:flutter/material.dart';

const emptySide = BorderSide(
  color: Colors.black,
  width: 0,
);
const boldSide = BorderSide(
  color: Colors.black,
  width: 4,
);

const BorderSide thinSide = BorderSide(
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

  Widget adsenseAdsView() {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        'adViewType',
        (int viewID) => IFrameElement()
          ..width = '320'
          ..height = '100'
          ..src = 'adview.html'
          ..style.border = 'none');

    return const SizedBox(
      height: 100.0,
      width: 320.0,
      child: HtmlElementView(
        viewType: 'adViewType',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final vm = Provider.of<SudokuNotifier>(context);

    if (vm.loading) return const CircularProgressIndicator();

    //Sudoku table is a 9x9 grid
    return SizedBox(
      height: size.height * 0.75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
                return CellView(
                  index: index,
                  border: getBorder(index),
                );
              },
            ),
          ),
          const SizedBox(width: 20),
          const SettingArea(),
          adsenseAdsView(),
        ],
      ),
    );
  }
}
