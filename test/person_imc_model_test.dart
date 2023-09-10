import 'package:imc_terminal_calc/src/person_imc_model.dart';
import 'package:imc_terminal_calc/src/utils/imc_utils.dart';
import 'package:test/test.dart';

void main() {
  group('toString()', () {
    const testPersonName = 'Gertrudes';
    test(testPersonName, () {
      const testPersonHeight = 1.55;
      const testPersonWeight = 59.0;
      final testPerson = PersonIMCModel(
        name: testPersonName,
        heightInMeters: testPersonHeight,
        weightInKilograms: testPersonWeight,
      );
      expect(testPerson.name, testPersonName);
      expect(testPerson.heightInMeters, testPersonHeight);
      expect(testPerson.weightInKilograms, testPersonWeight);
      expect(
        testPerson.imc,
        ImcUtils.calculateImc(
          heightInMeters: testPersonHeight,
          weightInKilograms: testPersonWeight,
        ),
      );
    });
  });
}
