// ignore_for_file: avoid_classes_with_only_static_members

enum ImcClassification {
  severelyUnderweight('Severely Underweight'),
  underWeight('Underweight'),
  normal('Normal'),
  overweight('Overweight'),
  obeseClass1('Obese Class 1'),
  obeseClass2('Obese Class 2'),
  severelyObese('Severely Obese'),
  morbidlyObese('Morbidly Obese'),
  superObese('Super Obese'),
  hyperObese('Hyper Obese');

  const ImcClassification(this.description);

  final String description;
}

abstract final class ImcUtils {
  static ImcClassification getClassification(double imc) {
    switch (imc) {
      case < 16.5:
        return ImcClassification.severelyUnderweight;
      case < 18.5:
        return ImcClassification.underWeight;
      case < 25:
        return ImcClassification.normal;
      case < 30:
        return ImcClassification.overweight;
      case < 35:
        return ImcClassification.obeseClass1;
      case < 40:
        return ImcClassification.obeseClass2;
      case < 45:
        return ImcClassification.severelyObese;
      case < 50:
        return ImcClassification.morbidlyObese;
      case < 60:
        return ImcClassification.superObese;
      default:
        return ImcClassification.hyperObese;
    }
  }
}
