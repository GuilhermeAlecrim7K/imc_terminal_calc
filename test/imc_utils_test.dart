import 'package:imc_terminal_calc/src/utils/imc_utils.dart';
import 'package:test/test.dart';

void main() {
  group('ImcUtils class', () {
    test('Severely Underweight', () {
      expect(
        ImcClassification.severelyUnderweight,
        ImcUtils.getClassification(16.49999),
      );
      expect(
        ImcClassification.severelyUnderweight,
        ImcUtils.getClassification(15),
      );
    });
    test('Underweight', () {
      expect(
        ImcClassification.underWeight,
        ImcUtils.getClassification(16.5),
      );
      expect(
        ImcClassification.underWeight,
        ImcUtils.getClassification(17),
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
        ImcClassification.obeseClass1,
        ImcUtils.getClassification(30),
      );
      expect(
        ImcClassification.obeseClass1,
        ImcUtils.getClassification(32),
      );
      expect(
        ImcClassification.obeseClass1,
        ImcUtils.getClassification(34.9999),
      );
    });
    test('Obese Class 2', () {
      expect(
        ImcClassification.obeseClass2,
        ImcUtils.getClassification(35),
      );
      expect(
        ImcClassification.obeseClass2,
        ImcUtils.getClassification(38),
      );
      expect(
        ImcClassification.obeseClass2,
        ImcUtils.getClassification(39.99999),
      );
    });
    test('Severely Obese', () {
      expect(
        ImcClassification.severelyObese,
        ImcUtils.getClassification(40),
      );
      expect(
        ImcClassification.severelyObese,
        ImcUtils.getClassification(42),
      );
      expect(
        ImcClassification.severelyObese,
        ImcUtils.getClassification(44.99999),
      );
    });
    test('Morbidly Obese', () {
      expect(
        ImcClassification.morbidlyObese,
        ImcUtils.getClassification(45),
      );
      expect(
        ImcClassification.morbidlyObese,
        ImcUtils.getClassification(47),
      );
      expect(
        ImcClassification.morbidlyObese,
        ImcUtils.getClassification(49.99999),
      );
    });
    test('Super Obese', () {
      expect(
        ImcClassification.superObese,
        ImcUtils.getClassification(50),
      );
      expect(
        ImcClassification.superObese,
        ImcUtils.getClassification(55),
      );
      expect(
        ImcClassification.superObese,
        ImcUtils.getClassification(59.99999),
      );
    });
    test('Hyper Obese', () {
      expect(
        ImcClassification.hyperObese,
        ImcUtils.getClassification(60),
      );
      expect(
        ImcClassification.hyperObese,
        ImcUtils.getClassification(70),
      );
      expect(
        ImcClassification.hyperObese,
        ImcUtils.getClassification(80),
      );
    });
  });
}
