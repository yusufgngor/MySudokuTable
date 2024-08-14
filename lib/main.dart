import 'package:flutter/material.dart';
import 'package:my_sudoku_table/sudoku_view_model.dart';
import 'package:my_sudoku_table/theme/theme.dart';
import 'package:my_sudoku_table/theme/util.dart';
import 'package:my_sudoku_table/view/table.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Roboto", "Abhaya Libre");
    MaterialTheme theme = MaterialTheme(textTheme);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SudokuNotifier()),
        ],
        child: MaterialApp(
          theme: theme.light(),
          home: const Scaffold(
            body: Center(
              child: SudokuTable(),
            ),
          ),
        ));
  }
}
