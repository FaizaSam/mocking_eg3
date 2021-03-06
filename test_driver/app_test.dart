import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main(List<String> args) {
  group("Flutter Reverse AppTest", () {
    FlutterDriver driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() {
      if (driver != null) {
        driver.close();
      }
    });
    var textField = find.byType("TextField");
    var button = find.text("Reverse");
    var reverse = find.text("olleH");
    test("Reverses The String", () async {
      await driver.tap(textField);
      await Future.delayed(Duration(seconds: 3));
      await driver.enterText("Hello");
      await driver.waitForAbsent(reverse);
      await driver.tap(button);
      await driver.waitFor(reverse);
      await driver.waitUntilNoTransientCallbacks();
      assert(reverse != null);
    });
  });
}
