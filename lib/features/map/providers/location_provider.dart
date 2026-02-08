import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../repositories/location_repository.dart';
import 'location_state.dart';

part 'location_provider.g.dart';

@riverpod
LocationRepository locationRepository(LocationRepositoryRef ref) {
  return LocationRepository();
}

@riverpod
class LocationNotifier extends _$LocationNotifier {
  @override
  LocationState build() {
    return const LocationState();
  }

  Future<void> getCurrentLocation() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final repository = ref.read(locationRepositoryProvider);
      final position = await repository.getCurrentPosition();
      final latLng = LatLng(position.latitude, position.longitude);
      final address = await repository.getAddressFromCoordinates(
        position.latitude,
        position.longitude,
      );

      state = state.copyWith(
        currentPosition: latLng,
        currentAddress: address,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> getAddressFromCoordinates(double lat, double lng) async {
    try {
      final repository = ref.read(locationRepositoryProvider);
      final address = await repository.getAddressFromCoordinates(lat, lng);

      state = state.copyWith(
        currentPosition: LatLng(lat, lng),
        currentAddress: address,
      );
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  void setPosition(LatLng position) {
    state = state.copyWith(currentPosition: position);
    getAddressFromCoordinates(position.latitude, position.longitude);
  }
}
