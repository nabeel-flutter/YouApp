import 'package:e_finder/src/flavors/flavors.dart';
import 'package:e_finder/main.dart' as runner;

Future<void> main() async {
  F.appFlavor = Flavor.staging;
  await runner.main();
}
