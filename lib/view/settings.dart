import 'package:flutter/material.dart';
import 'package:my_sudoku_table/view_modal/sudoku_view_model.dart';
import 'package:provider/provider.dart';

class SettingArea extends StatelessWidget {
  const SettingArea({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SudokuNotifier>(context);

    return SizedBox(
      width: 200,
      child: Column(
        children: [
          RowButton(
            children: [
              AppButton(
                  onPressed: () {
                    vm.toogleInputMode(InputMode.note);
                  },
                  text: "Note",
                  isSelected: vm.inputMode == InputMode.note),
              AppButton(
                  onPressed: () {
                    vm.toogleInputMode(InputMode.value);
                  },
                  text: "Value",
                  isSelected: vm.inputMode == InputMode.value),
            ],
          ),
          const SizedBox(height: 3),
          RowButton(
            children: [
              AppButton(
                  onPressed: () {
                    vm.clearCell(vm.selectedCell);
                  },
                  text: "Clear"),
              AppButton(
                  onPressed: () {
                    vm.clearAll();
                  },
                  text: "Clear All"),
            ],
          )
        ],
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final bool isSelected;

  const AppButton(
      {super.key, this.onPressed, required this.text, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: isSelected ? Colors.blue : Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 13),
        ));
  }
}

class RowButton extends StatelessWidget {
  final Iterable<Widget> children;

  const RowButton({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: children
          .map(
            (e) => Expanded(
              child: Padding(
                padding: const EdgeInsets.all(0.8),
                child: e,
              ),
            ),
          )
          .toList(),
    );
  }
}
