import 'package:test/scaffolding.dart';
import 'package:mocking_eg7/MyNewApp.dart';
import 'package:test/test.dart';

void main() {
  test("String should be reversed", () {
    String initial = 'Hello world';
    String reversed = reverse(initial);
    expect(reversed, 'dlrow olleH');
  });
}
