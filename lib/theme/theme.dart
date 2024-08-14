import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff565d79),
      surfaceTint: Color(0xff565d79),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffdde2ff),
      onPrimaryContainer: Color(0xff404762),
      secondary: Color(0xff5b5e6a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffe4e5f4),
      onSecondaryContainer: Color(0xff474a55),
      tertiary: Color(0xff71566d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xfffdd9f5),
      onTertiaryContainer: Color(0xff5a4057),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffcf8fb),
      onSurface: Color(0xff1b1b1d),
      onSurfaceVariant: Color(0xff45464d),
      outline: Color(0xff76767e),
      outlineVariant: Color(0xffc6c6ce),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303032),
      inversePrimary: Color(0xffbec5e5),
      primaryFixed: Color(0xffdbe1ff),
      onPrimaryFixed: Color(0xff131a33),
      primaryFixedDim: Color(0xffbec5e5),
      onPrimaryFixedVariant: Color(0xff3e4660),
      secondaryFixed: Color(0xffe0e1f0),
      onSecondaryFixed: Color(0xff181b25),
      secondaryFixedDim: Color(0xffc4c6d4),
      onSecondaryFixedVariant: Color(0xff444652),
      tertiaryFixed: Color(0xfffcd8f4),
      onTertiaryFixed: Color(0xff291428),
      tertiaryFixedDim: Color(0xffdfbcd8),
      onTertiaryFixedVariant: Color(0xff583f55),
      surfaceDim: Color(0xffdcd9dc),
      surfaceBright: Color(0xfffcf8fb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f3f5),
      surfaceContainer: Color(0xfff0edef),
      surfaceContainerHigh: Color(0xffeae7ea),
      surfaceContainerHighest: Color(0xffe4e2e4),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff3a425c),
      surfaceTint: Color(0xff565d79),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff6c7490),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff40424e),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff727481),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff543b51),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff896c84),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf8fb),
      onSurface: Color(0xff1b1b1d),
      onSurfaceVariant: Color(0xff414249),
      outline: Color(0xff5e5f66),
      outlineVariant: Color(0xff7a7a81),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303032),
      inversePrimary: Color(0xffbec5e5),
      primaryFixed: Color(0xff6c7490),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff545b77),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff727481),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff595b67),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff896c84),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff6f536b),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdcd9dc),
      surfaceBright: Color(0xfffcf8fb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f3f5),
      surfaceContainer: Color(0xfff0edef),
      surfaceContainerHigh: Color(0xffeae7ea),
      surfaceContainerHighest: Color(0xffe4e2e4),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff1a213a),
      surfaceTint: Color(0xff565d79),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff3a425c),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff1f222c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff40424e),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff311a2f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff543b51),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf8fb),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff22242a),
      outline: Color(0xff414249),
      outlineVariant: Color(0xff414249),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303032),
      inversePrimary: Color(0xffe8ebff),
      primaryFixed: Color(0xff3a425c),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff242c45),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff40424e),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff2a2c37),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff543b51),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff3c253a),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdcd9dc),
      surfaceBright: Color(0xfffcf8fb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f3f5),
      surfaceContainer: Color(0xfff0edef),
      surfaceContainerHigh: Color(0xffeae7ea),
      surfaceContainerHighest: Color(0xffe4e2e4),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffffff),
      surfaceTint: Color(0xffbec5e5),
      onPrimary: Color(0xff282f49),
      primaryContainer: Color(0xffccd3f4),
      onPrimaryContainer: Color(0xff373e58),
      secondary: Color(0xffc4c6d4),
      onSecondary: Color(0xff2d303b),
      secondaryContainer: Color(0xff3a3d48),
      onSecondaryContainer: Color(0xffcfd0de),
      tertiary: Color(0xffffffff),
      onTertiary: Color(0xff40293e),
      tertiaryContainer: Color(0xffedcae6),
      onTertiaryContainer: Color(0xff50374d),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff131315),
      onSurface: Color(0xffe4e2e4),
      onSurfaceVariant: Color(0xffc6c6ce),
      outline: Color(0xff909098),
      outlineVariant: Color(0xff45464d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe4e2e4),
      inversePrimary: Color(0xff565d79),
      primaryFixed: Color(0xffdbe1ff),
      onPrimaryFixed: Color(0xff131a33),
      primaryFixedDim: Color(0xffbec5e5),
      onPrimaryFixedVariant: Color(0xff3e4660),
      secondaryFixed: Color(0xffe0e1f0),
      onSecondaryFixed: Color(0xff181b25),
      secondaryFixedDim: Color(0xffc4c6d4),
      onSecondaryFixedVariant: Color(0xff444652),
      tertiaryFixed: Color(0xfffcd8f4),
      onTertiaryFixed: Color(0xff291428),
      tertiaryFixedDim: Color(0xffdfbcd8),
      onTertiaryFixedVariant: Color(0xff583f55),
      surfaceDim: Color(0xff131315),
      surfaceBright: Color(0xff39393b),
      surfaceContainerLowest: Color(0xff0e0e10),
      surfaceContainerLow: Color(0xff1b1b1d),
      surfaceContainer: Color(0xff1f1f21),
      surfaceContainerHigh: Color(0xff2a2a2c),
      surfaceContainerHighest: Color(0xff353437),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffffff),
      surfaceTint: Color(0xffbec5e5),
      onPrimary: Color(0xff282f49),
      primaryContainer: Color(0xffccd3f4),
      onPrimaryContainer: Color(0xff171e37),
      secondary: Color(0xffc9cad8),
      onSecondary: Color(0xff131620),
      secondaryContainer: Color(0xff8e909d),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffffff),
      onTertiary: Color(0xff40293e),
      tertiaryContainer: Color(0xffedcae6),
      onTertiaryContainer: Color(0xff2e182c),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff131315),
      onSurface: Color(0xfffdfafc),
      onSurfaceVariant: Color(0xffcbcad2),
      outline: Color(0xffa2a2aa),
      outlineVariant: Color(0xff82828a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe4e2e4),
      inversePrimary: Color(0xff404762),
      primaryFixed: Color(0xffdbe1ff),
      onPrimaryFixed: Color(0xff081028),
      primaryFixedDim: Color(0xffbec5e5),
      onPrimaryFixedVariant: Color(0xff2e354f),
      secondaryFixed: Color(0xffe0e1f0),
      onSecondaryFixed: Color(0xff0e111b),
      secondaryFixedDim: Color(0xffc4c6d4),
      onSecondaryFixedVariant: Color(0xff333641),
      tertiaryFixed: Color(0xfffcd8f4),
      onTertiaryFixed: Color(0xff1e091d),
      tertiaryFixedDim: Color(0xffdfbcd8),
      onTertiaryFixedVariant: Color(0xff462e44),
      surfaceDim: Color(0xff131315),
      surfaceBright: Color(0xff39393b),
      surfaceContainerLowest: Color(0xff0e0e10),
      surfaceContainerLow: Color(0xff1b1b1d),
      surfaceContainer: Color(0xff1f1f21),
      surfaceContainerHigh: Color(0xff2a2a2c),
      surfaceContainerHighest: Color(0xff353437),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffffff),
      surfaceTint: Color(0xffbec5e5),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffccd3f4),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffcfaff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffc9cad8),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffffff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffedcae6),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff131315),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffcfaff),
      outline: Color(0xffcbcad2),
      outlineVariant: Color(0xffcbcad2),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe4e2e4),
      inversePrimary: Color(0xff212942),
      primaryFixed: Color(0xffe1e6ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffc2c9ea),
      onPrimaryFixedVariant: Color(0xff0d152d),
      secondaryFixed: Color(0xffe5e6f4),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffc9cad8),
      onSecondaryFixedVariant: Color(0xff131620),
      tertiaryFixed: Color(0xffffddf7),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffe3c0dc),
      onTertiaryFixedVariant: Color(0xff240f22),
      surfaceDim: Color(0xff131315),
      surfaceBright: Color(0xff39393b),
      surfaceContainerLowest: Color(0xff0e0e10),
      surfaceContainerLow: Color(0xff1b1b1d),
      surfaceContainer: Color(0xff1f1f21),
      surfaceContainerHigh: Color(0xff2a2a2c),
      surfaceContainerHighest: Color(0xff353437),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
