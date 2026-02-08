// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$locationRepositoryHash() =>
    r'f97a4c44d3ec5d3cdff421f6640641041ddeedb7';

/// See also [locationRepository].
@ProviderFor(locationRepository)
final locationRepositoryProvider =
    AutoDisposeProvider<LocationRepository>.internal(
      locationRepository,
      name: r'locationRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$locationRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LocationRepositoryRef = AutoDisposeProviderRef<LocationRepository>;
String _$locationNotifierHash() => r'0e16dc3a6eb828f84a0165fe3b426ec1ca7a9408';

/// See also [LocationNotifier].
@ProviderFor(LocationNotifier)
final locationNotifierProvider =
    AutoDisposeNotifierProvider<LocationNotifier, LocationState>.internal(
      LocationNotifier.new,
      name: r'locationNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$locationNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$LocationNotifier = AutoDisposeNotifier<LocationState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
