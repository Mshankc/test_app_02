// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressModelImpl _$$AddressModelImplFromJson(Map<String, dynamic> json) =>
    _$AddressModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      type: json['type'] as String,
      isSelected: json['isSelected'] as bool? ?? false,
      houseNo: json['houseNo'] as String?,
      building: json['building'] as String?,
      landmark: json['landmark'] as String?,
      receiverName: json['receiverName'] as String?,
      receiverPhone: json['receiverPhone'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$AddressModelImplToJson(_$AddressModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'type': instance.type,
      'isSelected': instance.isSelected,
      'houseNo': instance.houseNo,
      'building': instance.building,
      'landmark': instance.landmark,
      'receiverName': instance.receiverName,
      'receiverPhone': instance.receiverPhone,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
