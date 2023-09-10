import 'package:imc_terminal_calc/src/utils/imc_utils.dart';

class PersonIMCModel {
  final String name;
  final double heightInMeters;
  final double weightInKilograms;
  final double imc;
  PersonIMCModel({
    required this.name,
    required this.heightInMeters,
    required this.weightInKilograms,
  }) : imc = ImcUtils.calculateImc(
          heightInMeters: heightInMeters,
          weightInKilograms: weightInKilograms,
        );

  @override
  String toString() {
    return 'Name: $name\n'
        'Weight:$weightInKilograms\n'
        'Height:$heightInMeters}\n'
        'IMC: ${imc.toStringAsFixed(2)} - '
        '${ImcUtils.getClassification(imc).description}';
  }
}
