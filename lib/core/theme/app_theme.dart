import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
export 'package:clue_player/theme.dart'; // For kPrimary, kBackgroundDark, etc.

// ==========================================
// GREYWAY.Co COLOR SYSTEM
// ==========================================

/// Primary color palette - Blue accent on dark backgrounds
class AppColors {
  // Core brand colors
  static const Color primary = Color(0xFF0D59F2);
  static const Color primaryDark = Color(0xFF0B4ECF);
  static const Color primaryLight = Color(0xFF3A7CF5);
  static const Color primaryContainer = Color(0x1A0D59F2);
  
  // Background hierarchy
  static const Color background = Color(0xFF101623);
  static const Color surface = Color(0xFF182234);
  static const Color surfaceVariant = Color(0xFF222F49);
  static const Color surfaceCard = Color(0xFF222F49);
  
  // Functional colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);
  
  // Text colors
  static const Color onBackground = Colors.white;
  static const Color onSurface = Color(0xFFE5E7EB);
  static const Color onSurfaceVariant = Color(0xFF90A4CB);
  static const Color onPrimary = Colors.white;
  
  // Interactive states
  static const Color hover = Color(0x1AFFFFFF);
  static const Color focus = Color(0x330D59F2);
  static const Color pressed = Color(0x330D59F2);
  static const Color disabled = Color(0xFF4B5563);
}

// ==========================================
// TYPOGRAPHY SYSTEM
// ==========================================

/// Typography constants following 8px grid system
class AppTypography {
  // Display
  static final TextStyle displayLarge = GoogleFonts.inter(
    fontSize: 57,
    fontWeight: FontWeight.w900,
    height: 1.12,
    letterSpacing: -0.25,
  );
  
  static final TextStyle displayMedium = GoogleFonts.inter(
    fontSize: 45,
    fontWeight: FontWeight.w800,
    height: 1.16,
  );
  
  static final TextStyle displaySmall = GoogleFonts.inter(
    fontSize: 36,
    fontWeight: FontWeight.w800,
    height: 1.22,
  );
  
  // Headline
  static final TextStyle headlineLarge = GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.25,
  );
  
  static final TextStyle headlineMedium = GoogleFonts.inter(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    height: 1.29,
  );
  
  static final TextStyle headlineSmall = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.33,
  );
  
  // Title
  static final TextStyle titleLarge = GoogleFonts.inter(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    height: 1.27,
  );
  
  static final TextStyle titleMedium = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
    letterSpacing: 0.15,
  );
  
  static final TextStyle titleSmall = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.43,
    letterSpacing: 0.1,
  );
  
  // Body
  static final TextStyle bodyLarge = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.5,
  );
  
  static final TextStyle bodyMedium = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.43,
    letterSpacing: 0.25,
  );
  
  static final TextStyle bodySmall = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.33,
    letterSpacing: 0.4,
  );
  
  // Label
  static final TextStyle labelLarge = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.43,
    letterSpacing: 0.1,
  );
  
  static final TextStyle labelMedium = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.33,
    letterSpacing: 0.5,
  );
  
  static final TextStyle labelSmall = GoogleFonts.inter(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 1.45,
    letterSpacing: 0.5,
  );
}

// ==========================================
// SPACING & BORDER RADIUS
// ==========================================

class AppSpacing {
  // 8px grid system
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
  
  // Layout spacing
  static const EdgeInsets screenPadding = EdgeInsets.all(16.0);
  static const EdgeInsets cardPadding = EdgeInsets.all(16.0);
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: 16.0,
    vertical: 12.0,
  );
}

class AppBorderRadius {
  static const BorderRadius xs = BorderRadius.all(Radius.circular(4.0));
  static const BorderRadius sm = BorderRadius.all(Radius.circular(8.0));
  static const BorderRadius md = BorderRadius.all(Radius.circular(12.0));
  static const BorderRadius lg = BorderRadius.all(Radius.circular(16.0));
  static const BorderRadius xl = BorderRadius.all(Radius.circular(24.0));
  static const BorderRadius full = BorderRadius.all(Radius.circular(999.0));
}

// ==========================================
// APP THEME DEFINITION
// ==========================================

/// Greyway.Co Clue Player Theme - Dark/Blue variant
final ThemeData cluePlayerTheme = ThemeData.dark().copyWith(
  // ============ COLOR SCHEME ============
  colorScheme: ColorScheme.dark(
    primary: AppColors.primary,
    onPrimary: AppColors.onPrimary,
    primaryContainer: AppColors.primaryContainer,
    onPrimaryContainer: AppColors.primary,
    
    secondary: AppColors.primaryLight,
    onSecondary: AppColors.onPrimary,
    
    tertiary: AppColors.surfaceVariant,
    onTertiary: AppColors.onSurface,
    
    surface: AppColors.surface,
    onSurface: AppColors.onSurface,
    
    surfaceContainerHighest: AppColors.surfaceVariant,
    onSurfaceVariant: AppColors.onSurfaceVariant,
    
    error: AppColors.error,
    onError: AppColors.onPrimary,
    
    outline: AppColors.surfaceVariant,
    outlineVariant: AppColors.surfaceVariant.withAlpha(77), // Changed from .withOpacity(0.3) to .withAlpha(77)
    
    shadow: Colors.black.withAlpha(128), // Changed from .withOpacity(0.5) to .withAlpha(128)
    scrim: Colors.black.withAlpha(82), // Changed from .withOpacity(0.32) to .withAlpha(82)
    
    inverseSurface: AppColors.background,
    onInverseSurface: AppColors.onBackground,
  ),
  
  // ============ TYPOGRAPHY ============
  textTheme: TextTheme(
    displayLarge: AppTypography.displayLarge,
    displayMedium: AppTypography.displayMedium,
    displaySmall: AppTypography.displaySmall,
    
    headlineLarge: AppTypography.headlineLarge,
    headlineMedium: AppTypography.headlineMedium,
    headlineSmall: AppTypography.headlineSmall,
    
    titleLarge: AppTypography.titleLarge,
    titleMedium: AppTypography.titleMedium,
    titleSmall: AppTypography.titleSmall,
    
    bodyLarge: AppTypography.bodyLarge,
    bodyMedium: AppTypography.bodyMedium,
    bodySmall: AppTypography.bodySmall,
    
    labelLarge: AppTypography.labelLarge,
    labelMedium: AppTypography.labelMedium,
    labelSmall: AppTypography.labelSmall,
  ),
  
  // ============ COMPONENT THEMES ============
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.background,
  canvasColor: AppColors.surface,
  
  // App Bar
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.background,
    elevation: 0,
    surfaceTintColor: Colors.transparent,
    shadowColor: Colors.transparent,
    iconTheme: const IconThemeData(color: AppColors.onBackground),
    titleTextStyle: AppTypography.titleLarge.copyWith(color: AppColors.onBackground),
    toolbarHeight: 64.0,
  ),
  
  // Bottom Navigation Bar
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.surface,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.onSurfaceVariant,
    elevation: 8.0,
    type: BottomNavigationBarType.fixed,
  ),
  
  // Card
  cardTheme: const CardThemeData(
    color: AppColors.surfaceCard,
    elevation: 1.0,
    shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.md),
    margin: EdgeInsets.zero,
  ),
  
  // Dialog
  dialogTheme:  DialogThemeData(
    backgroundColor: AppColors.surface,
    elevation: 24.0,
    shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.lg),
    titleTextStyle: AppTypography.titleLarge.copyWith(color: AppColors.onSurface),
    contentTextStyle: AppTypography.bodyMedium.copyWith(color: AppColors.onSurfaceVariant),
  ),
  
  // Input Fields
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.surfaceVariant.withAlpha(102), // Changed from .withOpacity(0.4) to .withAlpha(102)
    border: const OutlineInputBorder(
      borderRadius: AppBorderRadius.sm,
      borderSide: BorderSide.none,
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: AppBorderRadius.sm,
      borderSide: BorderSide.none,
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: AppBorderRadius.sm,
      borderSide: BorderSide(color: AppColors.primary, width: 2.0),
    ),
    errorBorder: const OutlineInputBorder(
      borderRadius: AppBorderRadius.sm,
      borderSide: BorderSide(color: AppColors.error, width: 1.0),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderRadius: AppBorderRadius.sm,
      borderSide: BorderSide(color: AppColors.error, width: 2.0),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
    hintStyle: AppTypography.bodyMedium.copyWith(color: AppColors.onSurfaceVariant),
    labelStyle: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant),
    errorStyle: AppTypography.labelSmall.copyWith(color: AppColors.error),
  ),
  
  // Buttons
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.onPrimary,
      disabledBackgroundColor: AppColors.disabled,
      disabledForegroundColor: AppColors.onSurfaceVariant,
      elevation: 0,
      padding: AppSpacing.buttonPadding,
      textStyle: AppTypography.labelLarge,
      shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.sm),
      minimumSize: const Size(64.0, 48.0),
    ),
  ),
  
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.primary,
      disabledForegroundColor: AppColors.disabled,
      side: BorderSide(color: AppColors.primary.withAlpha(153)), // Changed from .withOpacity(0.6) to .withAlpha(153)
      padding: AppSpacing.buttonPadding,
      textStyle: AppTypography.labelLarge,
      shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.sm),
      minimumSize: const Size(64.0, 48.0),
    ),
  ),
  
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primary,
      disabledForegroundColor: AppColors.disabled,
      padding: AppSpacing.buttonPadding,
      textStyle: AppTypography.labelLarge,
      shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.sm),
      minimumSize: const Size(64.0, 48.0),
    ),
  ),
  
  // Chip
  chipTheme: ChipThemeData(
    backgroundColor: AppColors.surfaceVariant,
    disabledColor: AppColors.surfaceVariant.withAlpha(77), // Changed from .withOpacity(0.3) to .withAlpha(77)
    selectedColor: AppColors.primaryContainer,
    secondarySelectedColor: AppColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
    labelStyle: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant),
    secondaryLabelStyle: AppTypography.labelMedium.copyWith(color: AppColors.onPrimary),
    brightness: Brightness.dark,
  ),
  
  // Divider
  dividerTheme: DividerThemeData(
    color: AppColors.surfaceVariant.withAlpha(128), // Changed from .withOpacity(0.5) to .withAlpha(128)
    thickness: 1.0,
    space: 16.0,
  ),
  
  // SnackBar
  snackBarTheme: SnackBarThemeData(
    backgroundColor: AppColors.surface,
    contentTextStyle: AppTypography.bodyMedium.copyWith(color: AppColors.onSurface),
    shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.sm),
    behavior: SnackBarBehavior.floating,
    elevation: 6.0,
  ),
  
  // Progress Indicators
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    linearTrackColor: AppColors.surfaceVariant,
    color: AppColors.primary,
  ),
  
  // Scrollbar
  scrollbarTheme: ScrollbarThemeData(
    thumbVisibility: WidgetStateProperty.all(true),
    thickness: WidgetStateProperty.all(6.0),
    thumbColor: WidgetStateProperty.all(AppColors.primary.withAlpha(153)), // Changed from .withOpacity(0.6) to .withAlpha(153)
    radius: const Radius.circular(4.0),
    minThumbLength: 48.0,
    mainAxisMargin: 4.0,
    crossAxisMargin: 4.0,
  ),
  
  // Navigation Rail
  navigationRailTheme: NavigationRailThemeData(
    backgroundColor: AppColors.surface,
    selectedIconTheme: const IconThemeData(color: AppColors.primary),
    unselectedIconTheme: const IconThemeData(color: AppColors.onSurfaceVariant),
    selectedLabelTextStyle: AppTypography.labelMedium.copyWith(color: AppColors.primary),
    unselectedLabelTextStyle: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant),
  ),
  
  // Tab Bar
  tabBarTheme: TabBarThemeData(
    labelColor: AppColors.primary,
    unselectedLabelColor: AppColors.onSurfaceVariant,
    labelStyle: AppTypography.labelLarge,
    unselectedLabelStyle: AppTypography.labelLarge,
    indicator: const UnderlineTabIndicator(
      borderSide: BorderSide(width: 2.0, color: AppColors.primary),
      insets: EdgeInsets.symmetric(horizontal: 16.0),
    ),
    indicatorSize: TabBarIndicatorSize.tab,
    overlayColor: WidgetStateProperty.all(AppColors.hover),
  ),
  
  // Tooltip
  tooltipTheme: TooltipThemeData(
    decoration: BoxDecoration(
      color: AppColors.surface,
      borderRadius: AppBorderRadius.sm,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withAlpha(51), // Changed from .withOpacity(0.2) to .withAlpha(51)
          blurRadius: 8.0,
          offset: const Offset(0, 4.0),
        ),
      ],
    ),
    textStyle: AppTypography.bodySmall.copyWith(color: AppColors.onSurface),
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
    waitDuration: const Duration(milliseconds: 500),
  ),
  
  // Icon
  iconTheme: const IconThemeData(
    color: AppColors.onSurface,
    size: 24.0,
  ),
  
  // Floating Action Button
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.onPrimary,
    shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.lg),
    sizeConstraints: BoxConstraints(minWidth: 56.0, minHeight: 56.0),
  ),
);

// ==========================================
// EXTENSIONS & UTILITIES
// ==========================================

/// Quick access extension methods for common styling
extension ThemeExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => theme.colorScheme;
  TextTheme get text => theme.textTheme;
  
  // Quick spacing access
  EdgeInsets get screenPadding => AppSpacing.screenPadding;
  EdgeInsets get cardPadding => AppSpacing.cardPadding;
}

/// Common widget shortcuts using theme
class AppThemeWidgets {
  static Widget verticalSpacer({double height = AppSpacing.md}) {
    return SizedBox(height: height);
  }
  
  static Widget horizontalSpacer({double width = AppSpacing.md}) {
    return SizedBox(width: width);
  }
  
  static Widget divider({double? indent}) {
    return Divider(
      color: AppColors.surfaceVariant.withAlpha(128), // Changed from .withOpacity(0.5) to .withAlpha(128)
      thickness: 1.0,
      indent: indent,
      endIndent: indent,
    );
  }
}