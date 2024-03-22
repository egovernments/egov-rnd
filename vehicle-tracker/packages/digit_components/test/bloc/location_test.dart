import 'package:bloc_test/bloc_test.dart';
import 'package:digit_components/blocs/location/location.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:location/location.dart';
import 'package:location_platform_interface/location_platform_interface.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockLocationPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements LocationPlatform {}

void main() {
  const mockLat = -25.953724;
  const mockLng = 32.588711;

  group('Location bloc', () {
    blocTest(
      'throws if location permission is not granted',
      build: () => LocationBloc(location: Location()),
      setUp: () {
        final mock = MockLocationPlatform();
        const denied = PermissionStatus.denied;

        when(() => mock.hasPermission()).thenAnswer((_) async => denied);
        when(() => mock.requestPermission()).thenAnswer((_) async => denied);

        LocationPlatform.instance = mock;
      },
      act: (bloc) => bloc.add(const RequestLocationPermissionEvent()),
      errors: () => [isA<Exception>()],
    );
  });

  blocTest(
    'throws if location services are not enabled',
    build: () => LocationBloc(location: Location()),
    setUp: () {
      final mock = MockLocationPlatform();

      const granted = PermissionStatus.granted;
      when(() => mock.hasPermission()).thenAnswer((_) async => granted);
      when(() => mock.serviceEnabled()).thenAnswer((_) async => false);
      when(() => mock.requestService()).thenAnswer((_) async => false);

      LocationPlatform.instance = mock;
    },
    act: (bloc) => bloc.add(const RequestLocationServiceEvent()),
    errors: () => [isA<Exception>()],
  );

  blocTest(
    'loads with mock latLng',
    build: () => LocationBloc(location: Location()),
    setUp: () {
      final mock = MockLocationPlatform();
      when(() => mock.serviceEnabled()).thenAnswer((_) async => true);
      when(() => mock.hasPermission()).thenAnswer(
        (_) async => PermissionStatus.granted,
      );

      when(() => mock.getLocation()).thenAnswer(
        (invocation) async => LocationData.fromMap({
          'latitude': mockLat,
          'longitude': mockLng,
          'accuracy': 1.0,
        }),
      );

      LocationPlatform.instance = mock;
    },
    act: (bloc) => bloc.add(const LoadLocationEvent()),
    expect: () => [
      isA<LocationState>().having(
        (state) => state.loading,
        'will enter loading state',
        true,
      ),
      isA<LocationState>().having(
        (state) => state.hasPermissions,
        'has permission granted',
        true,
      ),
      isA<LocationState>().having(
        (state) => state.serviceEnabled,
        'has services enabled',
        true,
      ),
      isA<LocationState>()
          .having((state) => state.latitude, 'will fetch mocked lat', mockLat)
          .having((state) => state.longitude, 'will fetch mocked lng', mockLng),
      isA<LocationState>().having(
        (state) => state.loading,
        'will enter loading state',
        false,
      ),
    ],
  );
}
