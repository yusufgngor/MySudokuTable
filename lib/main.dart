import 'package:flutter/material.dart';
import 'package:my_sudoku_table/sudoku_view_model.dart';
import 'package:my_sudoku_table/view/table.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SudokuNotifier()),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: Center(
              child: SudokuTable(),
            ),
          ),
        ));
  }
}
