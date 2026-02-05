import 'package:google_maps_flutter/google_maps_flutter.dart';

enum AddressLabel { home, work, other }

class SavedAddress {
  final String id;
  final String name;
  final String fullAddress;
  final AddressLabel label;
  final bool isSelected;
  final LatLng? position;

  const SavedAddress({
    required this.id,
    required this.name,
    required this.fullAddress,
    this.label = AddressLabel.home,
    this.isSelected = false,
    this.position,
  });

  SavedAddress copyWith({
    String? id,
    String? name,
    String? fullAddress,
    AddressLabel? label,
    bool? isSelected,
    LatLng? position,
  }) {
    return SavedAddress(
      id: id ?? this.id,
      name: name ?? this.name,
      fullAddress: fullAddress ?? this.fullAddress,
      label: label ?? this.label,
      isSelected: isSelected ?? this.isSelected,
      position: position ?? this.position,
    );
  }
}

class AddressFormData {
  String houseNoFloor;
  String buildingBlock;
  String landmarkArea;
  AddressLabel label;
  String receiverName;
  String receiverPhone;
  LatLng? position;
  String? displayAddress;

  AddressFormData({
    this.houseNoFloor = '',
    this.buildingBlock = '',
    this.landmarkArea = '',
    this.label = AddressLabel.home,
    this.receiverName = '',
    this.receiverPhone = '',
    this.position,
    this.displayAddress,
  });
}
