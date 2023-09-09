import 'package:imc_terminal_calc/src/utils/imc_utils.dart';
import 'package:test/test.dart';

void main() {
  group('ImcUtils class', () {
    test('Severely Underweight', () {
      expect(
        ImcClassification.severelyUnderweight,
        ImcUtils.getClassification(16.99999),
      );
      expect(
        ImcClassification.severelyUnderweight,
        ImcUtils.getClassification(15),
      );
    });
    test('Underweight', () {
      expect(
        ImcClassification.underWeight,
        ImcUtils.getClassification(17),
      );
      expect(
        ImcClassification.underWeight,
        ImcUtils.getClassification(18),
      );
      expect(
        ImcClassification.underWeight,
        ImcUtils.getClassification(18.49999),
      );
    });
    test('Normal', () {
      expect(
        ImcClassification.normal,
        ImcUtils.getClassification(18.5),
      );
      expect(
        ImcClassification.normal,
        ImcUtils.getClassification(20),
      );
      expect(
        ImcClassification.normal,
        ImcUtils.getClassification(24.99999),
      );
    });
    test('Overweight', () {
      expect(
        ImcClassification.overweight,
        ImcUtils.getClassification(25),
      );
      expect(
        ImcClassification.overweight,
        ImcUtils.getClassification(28),
      );
      expect(
        ImcClassification.overweight,
        ImcUtils.getClassification(29.99999),
      );
    });
    test('Obese Class 1', () {
      expect(
        ImcClassification.obese,
        ImcUtils.getClassification(30),
      );
      expect(
        ImcClassification.obese,
        ImcUtils.getClassification(32),
      );
      expect(
        ImcClassification.obese,
        ImcUtils.getClassification(34.9999),
      );
    });
    test('Obese Class 2', () {
      expect(
        ImcClassification.severelyObese,
        ImcUtils.getClassification(35),
      );
      expect(
        ImcClassification.severelyObese,
        ImcUtils.getClassification(38),
      );
      expect(
        ImcClassification.severelyObese,
        ImcUtils.getClassification(39.99999),
      );
    });
    test('Morbidly Obese', () {
      expect(
        ImcClassification.morbidlyObese,
        ImcUtils.getClassification(40),
      );
      expect(
        ImcClassification.morbidlyObese,
        ImcUtils.getClassification(42),
      );
      expect(
        ImcClassification.morbidlyObese,
        ImcUtils.getClassification(44.99999),
      );
    });
  });
}
