// ignore_for_file: avoid_classes_with_only_static_members

enum ImcClassification {
  severelyUnderweight('Severely Underweight'),
  underWeight('Underweight'),
  normal('Normal'),
  overweight('Overweight'),
  obese('Obesity Class 1'),
  severelyObese('Obesity Class 2- Severe'),
  morbidlyObese('Obesity Class 3 - Morbid');

  const ImcClassification(this.description);

  final String description;
}

abstract final class ImcUtils {
  static ImcClassification getClassification(double imc) {
    switch (imc) {
      case < 17:
        return ImcClassification.severelyUnderweight;
      case < 18.5:
        return ImcClassification.underWeight;
      case < 25:
        return ImcClassification.normal;
      case < 30:
        return ImcClassification.overweight;
      case < 35:
        return ImcClassification.obese;
      case < 40:
        return ImcClassification.severelyObese;
      default:
        return ImcClassification.morbidlyObese;
    }
  }
}
