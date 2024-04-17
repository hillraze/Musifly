import 'package:flutter/material.dart';
import 'package:musifly/utils/theme/colors.dart';
import 'package:musifly/utils/theme/text_styles.dart';

class MusTheme {
  MusTheme({
    required this.key,
    required this.name,
  })  : primaryDeepPurple = const Color(kPrimaryDeepPurple),
        primaryWhite = const Color(kPrimaryWhite),
        textPrimary = const Color(kTextPrimary),
        textPrimaryTeen = const Color(kTextPrimaryTeen),
        textSecondary = const Color(kTextSecondary),
        textTeritary = const Color(kTextTeritary),
        textDarkGrey = const Color(kTextDarkGrey),
        uiWarning = const Color(kUiWarning),
        uiWarningTint = const Color(kUiWarningTint),
        uiKeylineGrey = const Color(kUiKeylineGrey),
        uiMidGrey = const Color(kUiMidGrey),
        uiError = const Color(kUiError),
        iconPrimary = const Color(kIconPrimary),
        iconPrimaryTeen = const Color(kIconPrimaryTeen),
        iconSecondary = const Color(kIconSecondary),
        iconInactive = const Color(kIconInactive),
        iconDisabled = const Color(kIconDisabled),
        iconWhite = const Color(kIconWhite),
        iconGreen = const Color(kIconGreen),
        bgTintWhite = const Color(kBgWhite),
        bgTintLightGrey = const Color(kBgLightGrey),
        bgTintGrey = const Color(kBgGrey),
        bgTintGreen = const Color(kBgGreen),
        bgTintGreen2 = const Color(kBgGreen2),
        bgPurple = const Color(kBgPurple);

  // Primary
  final Color primaryDeepPurple;
  final Color primaryWhite;

  // Secondary

  // Text
  final Color textPrimary;
  final Color textPrimaryTeen;
  final Color textSecondary;
  final Color textTeritary;
  final Color textDarkGrey;

  // UI
  final Color uiWarning;
  final Color uiWarningTint;
  final Color uiKeylineGrey;
  final Color uiMidGrey;
  final Color uiError;

  // Iconography
  final Color iconPrimary;
  final Color iconPrimaryTeen;
  final Color iconSecondary;
  final Color iconInactive;
  final Color iconDisabled;
  final Color iconWhite;
  final Color iconGreen;

  // Background Tints
  final Color bgTintWhite;
  final Color bgTintLightGrey;
  final Color bgTintGrey;
  final Color bgTintGreen;
  final Color bgTintGreen2;
  final Color bgPurple;

  final String key;
  final String name;

  final data = ThemeData(
    fontFamily: "Inter",
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        color: Color(kTextPrimary),
      ),
      bodyMedium: TextStyle(
        color: Color(kTextPrimary),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(const Size(32.0, 32.0)),
        padding: MaterialStateProperty.all(const EdgeInsets.all(2.0)),
        shape: MaterialStateProperty.all(const OvalBorder(eccentricity: 0.0)),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            vertical: 0.0,
            horizontal: 24.0,
          ),
        ),
        textStyle: MaterialStateProperty.all(
          TextStyles.s16.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
    useMaterial3: true,
  );
}

extension TextStyleExt on TextStyle {
  Size sizeOf(String text, {double? textScaleFactor}) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: this),
      maxLines: 1,
      textScaleFactor: textScaleFactor ?? 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);

    return textPainter.size;
  }

  /// Returns the generic height of the font used by `this` style.
  double get fontHeight {
    // Set of characters to take into account the biggest height and width
    return sizeOf('£\$MWMqbmw9').height;
  }
}
