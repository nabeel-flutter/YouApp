import 'package:new_beginnings/src/flavors/flavors.dart';
import 'package:new_beginnings/main.dart' as runner;

Future<void> main() async {
  F.appFlavor = Flavor.prod;
  await runner.main();
}
