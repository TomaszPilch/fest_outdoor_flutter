import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_theme_colors.dart';

export 'app_theme_colors.dart';

abstract final class AppSpacing {
  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 12.0;
  static const lg = 16.0;
  static const xl = 24.0;
  static const xxl = 32.0;
}

abstract final class AppRadii {
  static const sm = 8.0;
  static const md = 10.0;
  static const lg = 12.0;
  static const xl = 16.0;
  static const xxl = 20.0;
}

abstract final class AppTheme {
  static const bodyFont = 'Roboto';
  static const displayFont = 'Georgia';
  static const contentMaxWidth = 448.0;
  static const headerOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  );

  // sRGB equivalents of the OKLCH tokens in _template/src/styles.css.
  static const _lightScheme = ColorScheme.light(
    primary: Color(0xFFA1252F),
    onPrimary: Color(0xFFFBF8F5),
    primaryContainer: Color(0xFFFEDBD7),
    onPrimaryContainer: Color(0xFF8D1925),
    secondary: Color(0xFFF8E2E1),
    onSecondary: Color(0xFF651F22),
    secondaryContainer: Color(0xFFF8E2E1),
    onSecondaryContainer: Color(0xFF651F22),
    tertiary: Color(0xFF258651),
    onTertiary: Color(0xFFF3FBF5),
    error: Color(0xFFE7000B),
    onError: Color(0xFFF8FAFC),
    surface: Color(0xFFFEFBF9),
    surfaceDim: Color(0xFFE9E3DF),
    surfaceBright: Color(0xFFFEFBF9),
    onSurface: Color(0xFF1F1917),
    onSurfaceVariant: Color(0xFF6B615C),
    surfaceContainerLowest: Color(0xFFFEFBF9),
    surfaceContainerLow: Color(0xFFFEFBF9),
    surfaceContainer: Color(0xFFF9F6F2),
    surfaceContainerHigh: Color(0xFFE9E3DF),
    surfaceContainerHighest: Color(0xFFE9E3DF),
    outline: Color(0xFFE3DDD8),
    outlineVariant: Color(0xFFE3DDD8),
    inverseSurface: Color(0xFF231E1C),
    onInverseSurface: Color(0xFFF7F5F2),
    inversePrimary: Color(0xFFD9525A),
    surfaceTint: Colors.transparent,
  );

  static const _darkScheme = ColorScheme.dark(
    primary: Color(0xFFE2E8F0),
    onPrimary: Color(0xFF0F172B),
    primaryContainer: Color(0xFF1D293D),
    onPrimaryContainer: Color(0xFFF8FAFC),
    secondary: Color(0xFF1D293D),
    onSecondary: Color(0xFFF8FAFC),
    secondaryContainer: Color(0xFF1D293D),
    onSecondaryContainer: Color(0xFFF8FAFC),
    tertiary: Color(0xFF53AE77),
    onTertiary: Color(0xFF051B0E),
    error: Color(0xFFFF6467),
    onError: Color(0xFFF8FAFC),
    surface: Color(0xFF0F172B),
    surfaceDim: Color(0xFF020618),
    surfaceBright: Color(0xFF1D293D),
    onSurface: Color(0xFFF8FAFC),
    onSurfaceVariant: Color(0xFF90A1B9),
    surfaceContainerLowest: Color(0xFF0F172B),
    surfaceContainerLow: Color(0xFF0F172B),
    surfaceContainer: Color(0xFF020618),
    surfaceContainerHigh: Color(0xFF1D293D),
    surfaceContainerHighest: Color(0xFF1D293D),
    outline: Color(0x1AFFFFFF),
    outlineVariant: Color(0x1AFFFFFF),
    inverseSurface: Color(0xFFF8FAFC),
    onInverseSurface: Color(0xFF0F172B),
    inversePrimary: Color(0xFFA1252F),
    surfaceTint: Colors.transparent,
  );

  static const _lightColors = AppThemeColors(
    muted: Color(0xFFE9E3DF),
    success: Color(0xFF258651),
    onSuccess: Color(0xFFF3FBF5),
    warning: Color(0xFFD49838),
    onWarning: Color(0xFF3A2400),
    header: Color(0xFF231E1C),
    onHeader: Color(0xFFF7F5F2),
    heroForeground: Color(0xFFFBF8F5),
    heroAccent: Color(0xFFD9525A),
    heroOverlayStart: Color(0x8C1E130F),
    heroOverlayEnd: Color(0xA61E1311),
    inputBorder: Color(0xFFE3DDD8),
    ring: Color(0xFFA1252F),
  );

  static final _darkColors = _lightColors.copyWith(
    muted: const Color(0xFF1D293D),
    success: const Color(0xFF53AE77),
    onSuccess: const Color(0xFF051B0E),
    warning: const Color(0xFFE0AE57),
    onWarning: const Color(0xFF2E1E01),
    inputBorder: const Color(0x26FFFFFF),
    ring: const Color(0xFF6A7282),
  );

  static final light = _build(_lightScheme, _lightColors);
  static final dark = _build(_darkScheme, _darkColors);

  static TextTheme _textTheme(ColorScheme scheme) {
    TextStyle display(double size, double height) => TextStyle(
      fontFamily: displayFont,
      fontFamilyFallback: const ['Times New Roman', 'serif'],
      fontSize: size,
      fontWeight: FontWeight.w400,
      height: height,
      color: scheme.onSurface,
    );
    TextStyle sans(
      double size, {
      FontWeight weight = FontWeight.w400,
      double height = 1.5,
      Color? color,
    }) => TextStyle(
      fontFamily: bodyFont,
      fontFamilyFallback: const ['Arial', 'sans-serif'],
      fontSize: size,
      fontWeight: weight,
      height: height,
      color: color ?? scheme.onSurface,
    );

    return TextTheme(
      displayLarge: display(60, 1),
      displayMedium: display(48, 1),
      displaySmall: display(40, 1.1),
      headlineLarge: display(36, 1.2),
      headlineMedium: display(30, 1.2),
      headlineSmall: display(24, 1.25),
      titleLarge: display(20, 1.25),
      titleMedium: display(18, 1.25),
      titleSmall: sans(14, weight: FontWeight.w600),
      bodyLarge: sans(16),
      bodyMedium: sans(14),
      bodySmall: sans(12, color: scheme.onSurfaceVariant),
      labelLarge: sans(14, weight: FontWeight.w500),
      labelMedium: sans(12, weight: FontWeight.w500),
      labelSmall: sans(11, weight: FontWeight.w600),
    );
  }

  static ThemeData _build(ColorScheme scheme, AppThemeColors colors) {
    final text = _textTheme(scheme);
    final background = scheme.surfaceContainer;
    final controlShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadii.md),
    );
    final cardShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadii.xl),
      side: BorderSide(color: scheme.outline),
    );
    OutlineInputBorder inputBorder(Color color, [double width = 1]) =>
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadii.md),
          borderSide: BorderSide(color: color, width: width),
        );

    return ThemeData(
      useMaterial3: true,
      brightness: scheme.brightness,
      colorScheme: scheme,
      fontFamily: bodyFont,
      fontFamilyFallback: const ['Arial', 'sans-serif'],
      textTheme: text,
      scaffoldBackgroundColor: background,
      canvasColor: background,
      dividerColor: scheme.outline,
      disabledColor: scheme.onSurfaceVariant.withValues(alpha: 0.5),
      focusColor: colors.ring.withValues(alpha: 0.15),
      extensions: [colors],
      appBarTheme: AppBarTheme(
        backgroundColor: colors.header,
        foregroundColor: colors.onHeader,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: text.headlineSmall!.copyWith(color: colors.onHeader),
        iconTheme: IconThemeData(color: colors.onHeader),
      ),
      cardTheme: CardThemeData(
        color: scheme.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 1,
        shadowColor: Colors.black.withValues(alpha: 0.08),
        shape: cardShape,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          textStyle: text.labelLarge,
          minimumSize: const Size(64, 44),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.sm,
          ),
          shape: controlShape,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          surfaceTintColor: Colors.transparent,
          elevation: 1,
          shadowColor: Colors.black.withValues(alpha: 0.1),
          textStyle: text.labelLarge,
          minimumSize: const Size(64, 44),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          shape: controlShape,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: scheme.onSurface,
          backgroundColor: background,
          side: BorderSide(color: colors.inputBorder),
          textStyle: text.labelLarge,
          minimumSize: const Size(64, 44),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          shape: controlShape,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: scheme.primary,
          textStyle: text.labelLarge,
          minimumSize: const Size(64, 44),
          shape: controlShape,
        ),
      ),
      inputDecorationTheme: InputDecorationThemeData(
        filled: true,
        fillColor: scheme.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
        hintStyle: text.bodyMedium!.copyWith(color: scheme.onSurfaceVariant),
        labelStyle: text.bodyMedium!.copyWith(color: scheme.onSurfaceVariant),
        border: inputBorder(colors.inputBorder),
        enabledBorder: inputBorder(colors.inputBorder),
        disabledBorder: inputBorder(colors.inputBorder.withValues(alpha: 0.5)),
        focusedBorder: inputBorder(colors.ring, 2),
        errorBorder: inputBorder(scheme.error),
        focusedErrorBorder: inputBorder(scheme.error, 2),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: scheme.surface.withValues(alpha: 0.95),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        height: 80,
        indicatorColor: scheme.primary,
        indicatorShape: const StadiumBorder(),
        iconTheme: WidgetStateProperty.resolveWith(
          (states) => IconThemeData(
            size: 20,
            color: states.contains(WidgetState.selected)
                ? scheme.onPrimary
                : scheme.onSurfaceVariant,
          ),
        ),
        labelTextStyle: WidgetStateProperty.resolveWith(
          (states) => text.labelMedium!.copyWith(
            color: states.contains(WidgetState.selected)
                ? scheme.onSurface
                : scheme.onSurfaceVariant,
          ),
        ),
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: scheme.onPrimary,
        unselectedLabelColor: scheme.onSurfaceVariant,
        labelStyle: text.labelLarge!.copyWith(fontWeight: FontWeight.w600),
        unselectedLabelStyle: text.labelLarge,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: scheme.primary,
          borderRadius: BorderRadius.circular(AppRadii.lg),
        ),
        dividerHeight: 0,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: scheme.primaryContainer,
        selectedColor: scheme.primary,
        labelStyle: text.labelMedium!.copyWith(
          color: WidgetStateColor.resolveWith(
            (states) => states.contains(WidgetState.selected)
                ? scheme.onPrimary
                : scheme.onPrimaryContainer,
          ),
          fontWeight: FontWeight.w600,
        ),
        secondaryLabelStyle: text.labelMedium!.copyWith(
          color: scheme.onPrimary,
        ),
        side: BorderSide.none,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
      ),
      switchTheme: SwitchThemeData(
        trackColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.disabled)
              ? colors.muted
              : states.contains(WidgetState.selected)
              ? scheme.primary
              : scheme.outline,
        ),
        thumbColor: WidgetStatePropertyAll(scheme.surface),
        trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        shape: const CircleBorder(),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: scheme.surface,
        surfaceTintColor: Colors.transparent,
        shape: cardShape,
        titleTextStyle: text.headlineSmall,
        contentTextStyle: text.bodyMedium,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: scheme.surface,
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppRadii.xxl),
          ),
        ),
        dragHandleColor: scheme.outline,
      ),
      dividerTheme: DividerThemeData(
        color: scheme.outline,
        thickness: 1,
        space: 1,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: scheme.primary,
        linearTrackColor: colors.muted,
        circularTrackColor: colors.muted,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colors.header,
        contentTextStyle: text.bodyMedium!.copyWith(color: colors.onHeader),
        actionTextColor: colors.heroAccent,
        behavior: SnackBarBehavior.floating,
        shape: controlShape,
      ),
    );
  }
}
