// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressModelImpl _$$AddressModelImplFromJson(Map<String, dynamic> json) =>
    _$AddressModelImpl(
      id: json['_id'] as String?,
      name: json['name'] as String,
      customerName: json['customerName'] as String,
      address1: json['address1'] as String,
      address2: json['address2'] as String?,
      phone: json['phone'] as String,
      email: json['email'] as String?,
      city: json['city'] as String?,
      coordinates: (json['coordinates'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      pincode: json['pincode'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      additionalDirection: json['additionalDirection'] as String?,
      defaultAddress: json['defaultAddress'] as bool? ?? false,
      status: json['status'] as String? ?? 'Active',
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$AddressModelImplToJson(_$AddressModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'customerName': instance.customerName,
      'address1': instance.address1,
      'address2': instance.address2,
      'phone': instance.phone,
      'email': instance.email,
      'city': instance.city,
      'coordinates': instance.coordinates,
      'pincode': instance.pincode,
      'state': instance.state,
      'country': instance.country,
      'additionalDirection': instance.additionalDirection,
      'defaultAddress': instance.defaultAddress,
      'status': instance.status,
      'isSelected': instance.isSelected,
    };
