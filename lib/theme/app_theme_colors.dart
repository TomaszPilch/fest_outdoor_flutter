import 'package:flutter/material.dart';

@immutable
class AppThemeColors extends ThemeExtension<AppThemeColors> {
  final Color muted;
  final Color success;
  final Color onSuccess;
  final Color warning;
  final Color onWarning;
  final Color header;
  final Color onHeader;
  final Color heroForeground;
  final Color heroAccent;
  final Color heroOverlayStart;
  final Color heroOverlayEnd;
  final Color inputBorder;
  final Color ring;

  const AppThemeColors({
    required this.muted,
    required this.success,
    required this.onSuccess,
    required this.warning,
    required this.onWarning,
    required this.header,
    required this.onHeader,
    required this.heroForeground,
    required this.heroAccent,
    required this.heroOverlayStart,
    required this.heroOverlayEnd,
    required this.inputBorder,
    required this.ring,
  });

  static AppThemeColors of(BuildContext context) =>
      Theme.of(context).extension<AppThemeColors>()!;

  LinearGradient get heroOverlay => LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [heroOverlayStart, heroOverlayEnd],
  );

  @override
  AppThemeColors copyWith({
    Color? muted,
    Color? success,
    Color? onSuccess,
    Color? warning,
    Color? onWarning,
    Color? header,
    Color? onHeader,
    Color? heroForeground,
    Color? heroAccent,
    Color? heroOverlayStart,
    Color? heroOverlayEnd,
    Color? inputBorder,
    Color? ring,
  }) => AppThemeColors(
    muted: muted ?? this.muted,
    success: success ?? this.success,
    onSuccess: onSuccess ?? this.onSuccess,
    warning: warning ?? this.warning,
    onWarning: onWarning ?? this.onWarning,
    header: header ?? this.header,
    onHeader: onHeader ?? this.onHeader,
    heroForeground: heroForeground ?? this.heroForeground,
    heroAccent: heroAccent ?? this.heroAccent,
    heroOverlayStart: heroOverlayStart ?? this.heroOverlayStart,
    heroOverlayEnd: heroOverlayEnd ?? this.heroOverlayEnd,
    inputBorder: inputBorder ?? this.inputBorder,
    ring: ring ?? this.ring,
  );

  @override
  AppThemeColors lerp(covariant AppThemeColors? other, double t) {
    if (other == null) return this;
    return AppThemeColors(
      muted: Color.lerp(muted, other.muted, t)!,
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      onWarning: Color.lerp(onWarning, other.onWarning, t)!,
      header: Color.lerp(header, other.header, t)!,
      onHeader: Color.lerp(onHeader, other.onHeader, t)!,
      heroForeground: Color.lerp(heroForeground, other.heroForeground, t)!,
      heroAccent: Color.lerp(heroAccent, other.heroAccent, t)!,
      heroOverlayStart: Color.lerp(
        heroOverlayStart,
        other.heroOverlayStart,
        t,
      )!,
      heroOverlayEnd: Color.lerp(heroOverlayEnd, other.heroOverlayEnd, t)!,
      inputBorder: Color.lerp(inputBorder, other.inputBorder, t)!,
      ring: Color.lerp(ring, other.ring, t)!,
    );
  }
}
