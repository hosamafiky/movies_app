part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  const ThemeState({required this.palette, this.mode = ThemeMode.dark});

  final ThemeMode mode;
  final ColorPalette palette;

  ThemeState copyWith({ColorPalette? palette, ThemeMode? mode}) {
    return ThemeState(palette: palette ?? this.palette, mode: mode ?? this.mode);
  }

  @override
  List<Object> get props => [palette, mode];
}
