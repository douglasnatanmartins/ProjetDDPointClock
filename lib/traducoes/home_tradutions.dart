import "package:i18n_extension/i18n_extension.dart";

extension Localization on String {
  String get i18n => localize(this, t);
  static var t = Translations("pt_br") +
      {
        "en_us": "Hitting point",
        "pt_br": "Bater ponto",
        "es-py": "Marcar punto"
      } +
      {
        "en_us": "Day",
        "pt_br": "Dia",
        "es-py": "Día"
      } +
      {
        "en_us": "Month",
        "pt_br": "Mês",
        "es-py": "Mes"
      };
}