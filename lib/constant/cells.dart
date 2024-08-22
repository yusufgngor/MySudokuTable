import 'package:flutter/material.dart';
import 'package:my_sudoku_table/view/cell.dart';

const unselectedNotes = [
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

const selectedNotes = [
  Align(
    alignment: Alignment.topLeft,
    child: CellNoteText(text: "1", isBold: true),
  ),
  Align(
    alignment: Alignment.topCenter,
    child: CellNoteText(text: "2", isBold: true),
  ),
  Align(
    alignment: Alignment.topRight,
    child: CellNoteText(text: "3", isBold: true),
  ),
  Align(
    alignment: Alignment.centerLeft,
    child: CellNoteText(text: "4", isBold: true),
  ),
  Align(
    alignment: Alignment.center,
    child: CellNoteText(text: "5", isBold: true),
  ),
  Align(
    alignment: Alignment.centerRight,
    child: CellNoteText(text: "6", isBold: true),
  ),
  Align(
    alignment: Alignment.bottomLeft,
    child: CellNoteText(text: "7", isBold: true),
  ),
  Align(
    alignment: Alignment.bottomCenter,
    child: CellNoteText(text: "8", isBold: true),
  ),
  Align(
    alignment: Alignment.bottomRight,
    child: CellNoteText(text: "9", isBold: true),
  )
];
