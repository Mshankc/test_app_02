import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'location_state.freezed.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState({
    LatLng? currentPosition,
    String? currentAddress,
    @Default(false) bool isLoading,
    String? error,
  }) = _LocationState;
}
