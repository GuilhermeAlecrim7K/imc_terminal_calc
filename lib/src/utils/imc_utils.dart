// ignore_for_file: avoid_classes_with_only_static_members

import 'package:imc_terminal_calc/src/exceptions/exceptions.dart';

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

  // https://en.wikipedia.org/wiki/List_of_the_verified_shortest_people
  static const heightOfShortestHumanInHistory = 0.5464;
  // https://en.wikipedia.org/wiki/Robert_Wadlow
  static const heightOfTallestHumanInHistory = 2.72;
  // https://en.wikipedia.org/wiki/Lizzie_Vel%C3%A1squez
  static const weightOfSkinniestHuman = 29.0;
  // https://en.wikipedia.org/wiki/Jon_Brower_Minnoch
  static const weightOfHeaviestHumanInHistory = 635.0;

  static double calculateImc({
    required double heightInMeters,
    required double weightInKilograms,
  }) {
    if (heightInMeters < heightOfShortestHumanInHistory ||
        heightInMeters > heightOfTallestHumanInHistory) {
      throw InvalidArgumentException('height', '${heightInMeters}m');
    }
    if (weightInKilograms < weightOfSkinniestHuman ||
        weightInKilograms > weightOfHeaviestHumanInHistory) {
      throw InvalidArgumentException('weight', '${weightInKilograms}kg');
    }
    return weightInKilograms / (heightInMeters * heightInMeters);
  }
}
