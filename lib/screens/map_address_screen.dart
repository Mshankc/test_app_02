import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_theme.dart';
import '../providers/address_provider.dart';
import 'add_address_form_screen.dart';

class MapAddressScreen extends ConsumerStatefulWidget {
  const MapAddressScreen({super.key});

  @override
  ConsumerState<MapAddressScreen> createState() => _MapAddressScreenState();
}

class _MapAddressScreenState extends ConsumerState<MapAddressScreen> {
  final Completer<GoogleMapController> _mapController = Completer();
  static const LatLng _defaultCenter = LatLng(53.7940, -1.5410);
  LatLng _currentPosition = _defaultCenter;
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initPosition();
  }

  Future<void> _initPosition() async {
    final saved = ref.read(mapPositionProvider);
    if (saved != null) {
      setState(() => _currentPosition = saved);
      return;
    }
    final permitted = await Geolocator.checkPermission();
    if (permitted == LocationPermission.denied) {
      await Geolocator.requestPermission();
    }
    if (await Geolocator.isLocationServiceEnabled()) {
      try {
        final pos = await Geolocator.getCurrentPosition();
        setState(() => _currentPosition = LatLng(pos.latitude, pos.longitude));
      } catch (_) {}
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onConfirm() {
    ref.read(mapPositionProvider.notifier).state = _currentPosition;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => AddAddressFormScreen(initialPosition: _currentPosition),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface600,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: TextField(
          controller: _searchController,
          style: AppTextStyles.bodyLarge.copyWith(color: AppColors.text500),
          decoration: InputDecoration(
            hintText: 'Search an area or address',
            hintStyle: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.text300,
              fontSize: 14,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 8,
            ),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.close,
                    size: 18,
                    color: AppColors.text400,
                  ),
                  onPressed: () => _searchController.clear(),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 40,
                    minHeight: 40,
                  ),
                ),
                Container(
                  width: 32,
                  height: 32,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: AppColors.green500,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.mic_none_outlined,
                      size: 18,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _currentPosition,
              zoom: 14,
            ),
            onMapCreated: (controller) {
              _mapController.complete(controller);
            },
            onCameraMove: (position) {
              setState(() => _currentPosition = position.target);
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            markers: {
              Marker(
                markerId: const MarkerId('pin'),
                position: _currentPosition,
                infoWindow: const InfoWindow(title: 'GMAP Analytics'),
              ),
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 90,
            child: Center(
              child: Material(
                color: const Color(0xFF2C2C2C),
                borderRadius: BorderRadius.circular(24),
                elevation: 2,
                child: InkWell(
                  onTap: () async {
                    if (await Geolocator.isLocationServiceEnabled()) {
                      try {
                        final pos = await Geolocator.getCurrentPosition();
                        final newPos = LatLng(pos.latitude, pos.longitude);
                        setState(() => _currentPosition = newPos);
                        final controller = await _mapController.future;
                        controller.animateCamera(
                          CameraUpdate.newLatLng(newPos),
                        );
                      } catch (_) {}
                    }
                  },
                  borderRadius: BorderRadius.circular(24),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.green500,
                          ),
                          child: Icon(
                            Icons.my_location,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Use Current Location',
                          style: AppTextStyles.labelMedium.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 20,
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _onConfirm,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Confirm & Proceed'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
