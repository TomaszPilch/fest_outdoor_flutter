import 'package:fest_outdoor/models/guest.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'guest records accept missing or null titles without losing other data',
    () {
      final json = <String, dynamic>{
        'id': 147,
        'start': '2026-11-20T10:00:00.000Z',
        'end': '2026-11-20T11:00:00.000Z',
        'description': 'Festival talk',
        'content': <Map<String, dynamic>>[],
      };

      for (final data in [
        json,
        {...json, 'title': null},
      ]) {
        final guest = Guest.fromJson(data);
        expect(guest.title, isEmpty);
        expect(guest.name, isEmpty);
        expect(guest.id, 147);
        expect(guest.description, 'Festival talk');
      }
      expect(
        Guest.fromJson({...json, 'title': 'Announced guest'}).title,
        'Announced guest',
      );
      final namedGuest = Guest.fromJson({
        ...json,
        'name': 'Anna Kowalska',
        'title': 'Across the mountains',
      });
      expect(namedGuest.name, 'Anna Kowalska');
      expect(namedGuest.toJson()['name'], 'Anna Kowalska');
      expect(Guest.fromJson({...json, 'name': null}).name, isEmpty);
    },
  );
}
