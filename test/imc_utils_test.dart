import 'package:imc_terminal_calc/src/exceptions/exceptions.dart';
import 'package:imc_terminal_calc/src/utils/imc_utils.dart';
import 'package:test/test.dart';

void main() {
  group('ImcUtils.getClassification', () {
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
  group('ImcUtils.calculateIMC', () {
    group('invalid values', () {
      test('values for height and weight below minimum', () {
        expect(
          () => ImcUtils.calculateImc(
            heightInMeters: ImcUtils.heightOfShortestHumanInHistory - 0.01,
            weightInKilograms: 80,
          ),
          throwsA(isA<InvalidArgumentException>()),
        );
        expect(
          () => ImcUtils.calculateImc(
            heightInMeters: -1,
            weightInKilograms: 80,
          ),
          throwsA(isA<InvalidArgumentException>()),
        );
        expect(
          () => ImcUtils.calculateImc(
            heightInMeters: 1.75,
            weightInKilograms: ImcUtils.weightOfSkinniestHuman - 0.01,
          ),
          throwsA(isA<InvalidArgumentException>()),
        );
        expect(
          () => ImcUtils.calculateImc(
            heightInMeters: 1.75,
            weightInKilograms: -1,
          ),
          throwsA(isA<InvalidArgumentException>()),
        );
      });
      test(
        'values above the limit for height and weight',
        () {
          expect(
            () => ImcUtils.calculateImc(
              heightInMeters: ImcUtils.heightOfTallestHumanInHistory + 0.01,
              weightInKilograms: 125,
            ),
            throwsA(isA<InvalidArgumentException>()),
          );
          expect(
            () => ImcUtils.calculateImc(
              heightInMeters: 2.05,
              weightInKilograms: ImcUtils.weightOfHeaviestHumanInHistory + 0.01,
            ),
            throwsA(isA<InvalidArgumentException>()),
          );
        },
      );
    });
    group('test cases', () {
      test('Individual weighing 50kg', () {
        const testGroupWeightInKilograms = 50.0;
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.50,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(22.22, 0.01),
          reason: 'Height: 1.50m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.55,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(20.81, 0.01),
          reason: 'Height: 1.55m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.60,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(19.53, 0.01),
          reason: 'Height: 1.60m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.65,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(18.37, 0.01),
          reason: 'Height: 1.65m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.70,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(17.30, 0.01),
          reason: 'Height: 1.70m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.75,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(16.33, 0.01),
          reason: 'Height: 1.75m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.80,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(15.43, 0.01),
          reason: 'Height: 1.80m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.85,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(14.61, 0.01),
          reason: 'Height: 1.85m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.90,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(13.85, 0.01),
          reason: 'Height: 1.90m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.95,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(13.15, 0.01),
          reason: 'Height: 1.95m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 2.00,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(12.50, 0.01),
          reason: 'Height: 2.00m',
        );
      });
      test('Individual weighing 55kg', () {
        const testGroupWeightInKilograms = 55.0;
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.50,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(24.44, 0.01),
          reason: 'Height: 1.50m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.55,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(22.89, 0.01),
          reason: 'Height: 1.55m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.60,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(21.48, 0.01),
          reason: 'Height: 1.60m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.65,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(20.20, 0.01),
          reason: 'Height: 1.65m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.70,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(19.03, 0.01),
          reason: 'Height: 1.70m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.75,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(17.96, 0.01),
          reason: 'Height: 1.75m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.80,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(16.98, 0.01),
          reason: 'Height: 1.80m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.85,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(16.07, 0.01),
          reason: 'Height: 1.85m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.90,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(15.24, 0.01),
          reason: 'Height: 1.90m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.95,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(14.46, 0.01),
          reason: 'Height: 1.95m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 2.00,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(13.75, 0.01),
          reason: 'Height: 2.00m',
        );
      });
      test('Individual weighing 60kg', () {
        const testGroupWeightInKilograms = 60.0;
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.50,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(26.67, 0.01),
          reason: 'Height: 1.50m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.55,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(24.97, 0.01),
          reason: 'Height: 1.55m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.60,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(23.44, 0.01),
          reason: 'Height: 1.60m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.65,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(22.04, 0.01),
          reason: 'Height: 1.65m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.70,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(20.76, 0.01),
          reason: 'Height: 1.70m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.75,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(19.59, 0.01),
          reason: 'Height: 1.75m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.80,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(18.52, 0.01),
          reason: 'Height: 1.80m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.85,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(17.53, 0.01),
          reason: 'Height: 1.85m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.90,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(16.62, 0.01),
          reason: 'Height: 1.90m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.95,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(15.78, 0.01),
          reason: 'Height: 1.95m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 2.00,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(15.00, 0.01),
          reason: 'Height: 2.00m',
        );
      });
      test('Individual weighing 65kg', () {
        const testGroupWeightInKilograms = 65.0;
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.50,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(28.89, 0.01),
          reason: 'Height: 1.50m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.55,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(27.06, 0.01),
          reason: 'Height: 1.55m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.60,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(25.39, 0.01),
          reason: 'Height: 1.60m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.65,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(23.88, 0.01),
          reason: 'Height: 1.65m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.70,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(22.49, 0.01),
          reason: 'Height: 1.70m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.75,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(21.22, 0.01),
          reason: 'Height: 1.75m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.80,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(20.06, 0.01),
          reason: 'Height: 1.80m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.85,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(18.99, 0.01),
          reason: 'Height: 1.85m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.90,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(18.01, 0.01),
          reason: 'Height: 1.90m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.95,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(17.09, 0.01),
          reason: 'Height: 1.95m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 2.00,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(16.25, 0.01),
          reason: 'Height: 2.00m',
        );
      });
      test('Individual weighing 70kg', () {
        const testGroupWeightInKilograms = 70.0;
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.50,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(31.11, 0.01),
          reason: 'Height: 1.50m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.55,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(29.14, 0.01),
          reason: 'Height: 1.55m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.60,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(27.34, 0.01),
          reason: 'Height: 1.60m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.65,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(25.71, 0.01),
          reason: 'Height: 1.65m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.70,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(24.22, 0.01),
          reason: 'Height: 1.70m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.75,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(22.86, 0.01),
          reason: 'Height: 1.75m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.80,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(21.60, 0.01),
          reason: 'Height: 1.80m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.85,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(20.45, 0.01),
          reason: 'Height: 1.85m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.90,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(19.39, 0.01),
          reason: 'Height: 1.90m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.95,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(18.41, 0.01),
          reason: 'Height: 1.95m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 2.00,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(17.50, 0.01),
          reason: 'Height: 2.00m',
        );
      });
      test('Individual weighing 75kg', () {
        const testGroupWeightInKilograms = 75.0;
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.50,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(33.33, 0.01),
          reason: 'Height: 1.50m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.55,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(31.22, 0.01),
          reason: 'Height: 1.55m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.60,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(29.30, 0.01),
          reason: 'Height: 1.60m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.65,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(27.55, 0.01),
          reason: 'Height: 1.65m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.70,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(25.95, 0.01),
          reason: 'Height: 1.70m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.75,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(24.49, 0.01),
          reason: 'Height: 1.75m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.80,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(23.15, 0.01),
          reason: 'Height: 1.80m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.85,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(21.91, 0.01),
          reason: 'Height: 1.85m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.90,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(20.78, 0.01),
          reason: 'Height: 1.90m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.95,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(19.72, 0.01),
          reason: 'Height: 1.95m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 2.00,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(18.75, 0.01),
          reason: 'Height: 2.00m',
        );
      });
      test('Individual weighing 80kg', () {
        const testGroupWeightInKilograms = 80.0;
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.50,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(35.56, 0.01),
          reason: 'Height: 1.50m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.55,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(33.30, 0.01),
          reason: 'Height: 1.55m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.60,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(31.25, 0.01),
          reason: 'Height: 1.60m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.65,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(29.38, 0.01),
          reason: 'Height: 1.65m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.70,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(27.68, 0.01),
          reason: 'Height: 1.70m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.75,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(26.12, 0.01),
          reason: 'Height: 1.75m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.80,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(24.69, 0.01),
          reason: 'Height: 1.80m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.85,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(23.37, 0.01),
          reason: 'Height: 1.85m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.90,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(22.16, 0.01),
          reason: 'Height: 1.90m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.95,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(21.04, 0.01),
          reason: 'Height: 1.95m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 2.00,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(20.00, 0.01),
          reason: 'Height: 2.00m',
        );
      });
      test('Individual weighing 85kg', () {
        const testGroupWeightInKilograms = 85.0;
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.50,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(37.78, 0.01),
          reason: 'Height: 1.50m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.55,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(35.38, 0.01),
          reason: 'Height: 1.55m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.60,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(33.20, 0.01),
          reason: 'Height: 1.60m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.65,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(31.22, 0.01),
          reason: 'Height: 1.65m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.70,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(29.41, 0.01),
          reason: 'Height: 1.70m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.75,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(27.76, 0.01),
          reason: 'Height: 1.75m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.80,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(26.23, 0.01),
          reason: 'Height: 1.80m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.85,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(24.84, 0.01),
          reason: 'Height: 1.85m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.90,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(23.55, 0.01),
          reason: 'Height: 1.90m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.95,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(22.35, 0.01),
          reason: 'Height: 1.95m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 2.00,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(21.25, 0.01),
          reason: 'Height: 2.00m',
        );
      });
      test('Individual weighing 90kg', () {
        const testGroupWeightInKilograms = 90.0;
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.50,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(40.00, 0.01),
          reason: 'Height: 1.50m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.55,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(37.46, 0.01),
          reason: 'Height: 1.55m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.60,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(35.16, 0.01),
          reason: 'Height: 1.60m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.65,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(33.06, 0.01),
          reason: 'Height: 1.65m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.70,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(31.14, 0.01),
          reason: 'Height: 1.70m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.75,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(29.39, 0.01),
          reason: 'Height: 1.75m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.80,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(27.78, 0.01),
          reason: 'Height: 1.80m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.85,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(26.30, 0.01),
          reason: 'Height: 1.85m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.90,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(24.93, 0.01),
          reason: 'Height: 1.90m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.95,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(23.67, 0.01),
          reason: 'Height: 1.95m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 2.00,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(22.50, 0.01),
          reason: 'Height: 2.00m',
        );
      });
      test('Individual weighing 95kg', () {
        const testGroupWeightInKilograms = 95.0;
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.50,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(42.22, 0.01),
          reason: 'Height: 1.50m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.55,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(39.54, 0.01),
          reason: 'Height: 1.55m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.60,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(37.11, 0.01),
          reason: 'Height: 1.60m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.65,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(34.89, 0.01),
          reason: 'Height: 1.65m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.70,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(32.87, 0.01),
          reason: 'Height: 1.70m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.75,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(31.02, 0.01),
          reason: 'Height: 1.75m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.80,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(29.32, 0.01),
          reason: 'Height: 1.80m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.85,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(27.76, 0.01),
          reason: 'Height: 1.85m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.90,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(26.32, 0.01),
          reason: 'Height: 1.90m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.95,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(24.98, 0.01),
          reason: 'Height: 1.95m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 2.00,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(23.75, 0.01),
          reason: 'Height: 2.00m',
        );
      });
      test('Individual weighing 100kg', () {
        const testGroupWeightInKilograms = 100.0;
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.50,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(44.44, 0.01),
          reason: 'Height: 1.50m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.55,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(41.62, 0.01),
          reason: 'Height: 1.55m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.60,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(39.06, 0.01),
          reason: 'Height: 1.60m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.65,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(36.73, 0.01),
          reason: 'Height: 1.65m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.70,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(34.60, 0.01),
          reason: 'Height: 1.70m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.75,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(32.65, 0.01),
          reason: 'Height: 1.75m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.80,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(30.86, 0.01),
          reason: 'Height: 1.80m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.85,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(29.22, 0.01),
          reason: 'Height: 1.85m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.90,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(27.70, 0.01),
          reason: 'Height: 1.90m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.95,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(26.30, 0.01),
          reason: 'Height: 1.95m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 2.00,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(25.00, 0.01),
          reason: 'Height: 2.00m',
        );
      });
      test('Individual weighing 105kg', () {
        const testGroupWeightInKilograms = 105.0;
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.50,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(46.67, 0.01),
          reason: 'Height: 1.50m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.55,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(43.70, 0.01),
          reason: 'Height: 1.55m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.60,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(41.02, 0.01),
          reason: 'Height: 1.60m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.65,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(38.57, 0.01),
          reason: 'Height: 1.65m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.70,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(36.33, 0.01),
          reason: 'Height: 1.70m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.75,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(34.29, 0.01),
          reason: 'Height: 1.75m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.80,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(32.41, 0.01),
          reason: 'Height: 1.80m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.85,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(30.68, 0.01),
          reason: 'Height: 1.85m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.90,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(29.09, 0.01),
          reason: 'Height: 1.90m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.95,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(27.61, 0.01),
          reason: 'Height: 1.95m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 2.00,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(26.25, 0.01),
          reason: 'Height: 2.00m',
        );
      });
      test('Individual weighing 110kg', () {
        const testGroupWeightInKilograms = 110.0;
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.50,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(48.89, 0.01),
          reason: 'Height: 1.50m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.55,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(45.79, 0.01),
          reason: 'Height: 1.55m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.60,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(42.97, 0.01),
          reason: 'Height: 1.60m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.65,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(40.40, 0.01),
          reason: 'Height: 1.65m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.70,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(38.06, 0.01),
          reason: 'Height: 1.70m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.75,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(35.92, 0.01),
          reason: 'Height: 1.75m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.80,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(33.95, 0.01),
          reason: 'Height: 1.80m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.85,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(32.14, 0.01),
          reason: 'Height: 1.85m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.90,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(30.47, 0.01),
          reason: 'Height: 1.90m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.95,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(28.93, 0.01),
          reason: 'Height: 1.95m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 2.00,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(27.50, 0.01),
          reason: 'Height: 2.00m',
        );
      });
      test('Individual weighing 115kg', () {
        const testGroupWeightInKilograms = 115.0;
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.50,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(51.11, 0.01),
          reason: 'Height: 1.50m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.55,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(47.87, 0.01),
          reason: 'Height: 1.55m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.60,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(44.92, 0.01),
          reason: 'Height: 1.60m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.65,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(42.24, 0.01),
          reason: 'Height: 1.65m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.70,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(39.79, 0.01),
          reason: 'Height: 1.70m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.75,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(37.55, 0.01),
          reason: 'Height: 1.75m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.80,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(35.49, 0.01),
          reason: 'Height: 1.80m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.85,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(33.60, 0.01),
          reason: 'Height: 1.85m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.90,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(31.86, 0.01),
          reason: 'Height: 1.90m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.95,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(30.24, 0.01),
          reason: 'Height: 1.95m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 2.00,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(28.75, 0.01),
          reason: 'Height: 2.00m',
        );
      });
      test('Individual weighing 120kg', () {
        const testGroupWeightInKilograms = 120.0;
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.50,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(53.33, 0.01),
          reason: 'Height: 1.50m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.55,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(49.95, 0.01),
          reason: 'Height: 1.55m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.60,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(46.88, 0.01),
          reason: 'Height: 1.60m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.65,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(44.08, 0.01),
          reason: 'Height: 1.65m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.70,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(41.52, 0.01),
          reason: 'Height: 1.70m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.75,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(39.18, 0.01),
          reason: 'Height: 1.75m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.80,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(37.04, 0.01),
          reason: 'Height: 1.80m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.85,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(35.06, 0.01),
          reason: 'Height: 1.85m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.90,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(33.24, 0.01),
          reason: 'Height: 1.90m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.95,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(31.56, 0.01),
          reason: 'Height: 1.95m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 2.00,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(30.00, 0.01),
          reason: 'Height: 2.00m',
        );
      });
      test('Individual weighing 125kg', () {
        const testGroupWeightInKilograms = 125.0;
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.50,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(55.56, 0.01),
          reason: 'Height: 1.50m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.55,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(52.03, 0.01),
          reason: 'Height: 1.55m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.60,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(48.83, 0.01),
          reason: 'Height: 1.60m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.65,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(45.91, 0.01),
          reason: 'Height: 1.65m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.70,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(43.25, 0.01),
          reason: 'Height: 1.70m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.75,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(40.82, 0.01),
          reason: 'Height: 1.75m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.80,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(38.58, 0.01),
          reason: 'Height: 1.80m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.85,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(36.52, 0.01),
          reason: 'Height: 1.85m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.90,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(34.63, 0.01),
          reason: 'Height: 1.90m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.95,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(32.87, 0.01),
          reason: 'Height: 1.95m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 2.00,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(31.25, 0.01),
          reason: 'Height: 2.00m',
        );
      });
      test('Individual weighing 130kg', () {
        const testGroupWeightInKilograms = 130.0;
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.50,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(57.78, 0.01),
          reason: 'Height: 1.50m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.55,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(54.11, 0.01),
          reason: 'Height: 1.55m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.60,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(50.78, 0.01),
          reason: 'Height: 1.60m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.65,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(47.75, 0.01),
          reason: 'Height: 1.65m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.70,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(44.98, 0.01),
          reason: 'Height: 1.70m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.75,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(42.45, 0.01),
          reason: 'Height: 1.75m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.80,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(40.12, 0.01),
          reason: 'Height: 1.80m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.85,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(37.98, 0.01),
          reason: 'Height: 1.85m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.90,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(36.01, 0.01),
          reason: 'Height: 1.90m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.95,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(34.19, 0.01),
          reason: 'Height: 1.95m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 2.00,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(32.50, 0.01),
          reason: 'Height: 2.00m',
        );
      });
      test('Individual weighing 135kg', () {
        const testGroupWeightInKilograms = 135.0;
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.50,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(60.00, 0.01),
          reason: 'Height: 1.50m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.55,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(56.19, 0.01),
          reason: 'Height: 1.55m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.60,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(52.73, 0.01),
          reason: 'Height: 1.60m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.65,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(49.59, 0.01),
          reason: 'Height: 1.65m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.70,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(46.71, 0.01),
          reason: 'Height: 1.70m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.75,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(44.08, 0.01),
          reason: 'Height: 1.75m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.80,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(41.67, 0.01),
          reason: 'Height: 1.80m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.85,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(39.44, 0.01),
          reason: 'Height: 1.85m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.90,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(37.40, 0.01),
          reason: 'Height: 1.90m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.95,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(35.50, 0.01),
          reason: 'Height: 1.95m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 2.00,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(33.75, 0.01),
          reason: 'Height: 2.00m',
        );
      });
      test('Individual weighing 140kg', () {
        const testGroupWeightInKilograms = 140.0;
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.50,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(62.22, 0.01),
          reason: 'Height: 1.50m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.55,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(58.27, 0.01),
          reason: 'Height: 1.55m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.60,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(54.69, 0.01),
          reason: 'Height: 1.60m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.65,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(51.42, 0.01),
          reason: 'Height: 1.65m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.70,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(48.44, 0.01),
          reason: 'Height: 1.70m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.75,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(45.71, 0.01),
          reason: 'Height: 1.75m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.80,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(43.21, 0.01),
          reason: 'Height: 1.80m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.85,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(40.91, 0.01),
          reason: 'Height: 1.85m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.90,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(38.78, 0.01),
          reason: 'Height: 1.90m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 1.95,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(36.82, 0.01),
          reason: 'Height: 1.95m',
        );
        expect(
          ImcUtils.calculateImc(
            heightInMeters: 2.00,
            weightInKilograms: testGroupWeightInKilograms,
          ),
          closeTo(35.00, 0.01),
          reason: 'Height: 2.00m',
        );
      });
    });
  });
}
