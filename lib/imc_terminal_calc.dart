import 'dart:io';

void run() {
  while (true) {
    stdout.writeln('=======================================');
    stdout.writeln('        IMC Terminal Calculator        ');
    stdout.writeln('=======================================');
    stdout.write('Type in your name: ');
    String? name = stdin.readLineSync();
    while (name == null || name.isEmpty) {
      stdout.write("Invalid. Type in your name: ");
      name = stdin.readLineSync();
    }

    stdout.write('Type in your height(in meters): ');
    double? heightInMeters = double.tryParse(stdin.readLineSync() ?? '');
    while (heightInMeters == null) {
      stdout.write("Invalid. Type in your height: ");
      heightInMeters = double.tryParse(stdin.readLineSync() ?? '');
    }

    stdout.write('Type in your weight(in kilograms): ');
    double? weightInKilograms = double.tryParse(stdin.readLineSync() ?? '');
    while (weightInKilograms == null) {
      stdout.write("Invalid. Type in your weight: ");
      weightInKilograms = double.tryParse(stdin.readLineSync() ?? '');
    }

    //TODO: calculate IMC

    stdout.write('Would you like to try again? (Y/N):');
    final tryAgainResponse = stdin.readLineSync();
    if (!['Y', 'YES'].contains(tryAgainResponse?.toUpperCase())) break;
  }
}
