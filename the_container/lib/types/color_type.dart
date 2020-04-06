enum ColorType { dropdown, argb }

extension ColorTypeExt on ColorType {
  String get name => const {
        ColorType.dropdown: 'Dropdown',
        ColorType.argb: 'ARGB',
      }[this];
}
