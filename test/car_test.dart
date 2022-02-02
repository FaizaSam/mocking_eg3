import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocking_eg7/car.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements Client {}

main() {
  test('returns a Car from API', () async {
    final client = MockClient();

    when(client.get(Uri.parse('https://some-car-api.org/cars'))).thenAnswer(
        (_) async => http.Response('{"model": "Mazda MX-5 Miata"}', 200));

    expect(await fetchCar(client), isA<Car>());
  });

  test('throws an exception if API call was unsuccessful', () {
    final client = MockClient();

    when(client.get(Uri.parse('https://some-car-api.org/cars')))
        .thenAnswer((_) async => http.Response('Internal Server Error', 500));

    expect(fetchCar(client), throwsException);
  });
}
