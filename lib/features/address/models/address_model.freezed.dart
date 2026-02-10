// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) {
  return _AddressModel.fromJson(json);
}

/// @nodoc
mixin _$AddressModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError; // Maps _id from API to this field
  String get name =>
      throw _privateConstructorUsedError; // Label (Home, Work, Other)
  String get customerName => throw _privateConstructorUsedError;
  String get address1 => throw _privateConstructorUsedError;
  String? get address2 => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  List<double>? get coordinates => throw _privateConstructorUsedError;
  String? get pincode => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get additionalDirection => throw _privateConstructorUsedError;
  bool get defaultAddress => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  /// Serializes this AddressModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressModelCopyWith<AddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressModelCopyWith<$Res> {
  factory $AddressModelCopyWith(
    AddressModel value,
    $Res Function(AddressModel) then,
  ) = _$AddressModelCopyWithImpl<$Res, AddressModel>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    String name,
    String customerName,
    String address1,
    String? address2,
    String phone,
    String? email,
    String? city,
    List<double>? coordinates,
    String? pincode,
    String? state,
    String? country,
    String? additionalDirection,
    bool defaultAddress,
    String status,
    bool isSelected,
  });
}

/// @nodoc
class _$AddressModelCopyWithImpl<$Res, $Val extends AddressModel>
    implements $AddressModelCopyWith<$Res> {
  _$AddressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? customerName = null,
    Object? address1 = null,
    Object? address2 = freezed,
    Object? phone = null,
    Object? email = freezed,
    Object? city = freezed,
    Object? coordinates = freezed,
    Object? pincode = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? additionalDirection = freezed,
    Object? defaultAddress = null,
    Object? status = null,
    Object? isSelected = null,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            customerName: null == customerName
                ? _value.customerName
                : customerName // ignore: cast_nullable_to_non_nullable
                      as String,
            address1: null == address1
                ? _value.address1
                : address1 // ignore: cast_nullable_to_non_nullable
                      as String,
            address2: freezed == address2
                ? _value.address2
                : address2 // ignore: cast_nullable_to_non_nullable
                      as String?,
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            city: freezed == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                      as String?,
            coordinates: freezed == coordinates
                ? _value.coordinates
                : coordinates // ignore: cast_nullable_to_non_nullable
                      as List<double>?,
            pincode: freezed == pincode
                ? _value.pincode
                : pincode // ignore: cast_nullable_to_non_nullable
                      as String?,
            state: freezed == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as String?,
            country: freezed == country
                ? _value.country
                : country // ignore: cast_nullable_to_non_nullable
                      as String?,
            additionalDirection: freezed == additionalDirection
                ? _value.additionalDirection
                : additionalDirection // ignore: cast_nullable_to_non_nullable
                      as String?,
            defaultAddress: null == defaultAddress
                ? _value.defaultAddress
                : defaultAddress // ignore: cast_nullable_to_non_nullable
                      as bool,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            isSelected: null == isSelected
                ? _value.isSelected
                : isSelected // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AddressModelImplCopyWith<$Res>
    implements $AddressModelCopyWith<$Res> {
  factory _$$AddressModelImplCopyWith(
    _$AddressModelImpl value,
    $Res Function(_$AddressModelImpl) then,
  ) = __$$AddressModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    String name,
    String customerName,
    String address1,
    String? address2,
    String phone,
    String? email,
    String? city,
    List<double>? coordinates,
    String? pincode,
    String? state,
    String? country,
    String? additionalDirection,
    bool defaultAddress,
    String status,
    bool isSelected,
  });
}

/// @nodoc
class __$$AddressModelImplCopyWithImpl<$Res>
    extends _$AddressModelCopyWithImpl<$Res, _$AddressModelImpl>
    implements _$$AddressModelImplCopyWith<$Res> {
  __$$AddressModelImplCopyWithImpl(
    _$AddressModelImpl _value,
    $Res Function(_$AddressModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? customerName = null,
    Object? address1 = null,
    Object? address2 = freezed,
    Object? phone = null,
    Object? email = freezed,
    Object? city = freezed,
    Object? coordinates = freezed,
    Object? pincode = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? additionalDirection = freezed,
    Object? defaultAddress = null,
    Object? status = null,
    Object? isSelected = null,
  }) {
    return _then(
      _$AddressModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        customerName: null == customerName
            ? _value.customerName
            : customerName // ignore: cast_nullable_to_non_nullable
                  as String,
        address1: null == address1
            ? _value.address1
            : address1 // ignore: cast_nullable_to_non_nullable
                  as String,
        address2: freezed == address2
            ? _value.address2
            : address2 // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        city: freezed == city
            ? _value.city
            : city // ignore: cast_nullable_to_non_nullable
                  as String?,
        coordinates: freezed == coordinates
            ? _value._coordinates
            : coordinates // ignore: cast_nullable_to_non_nullable
                  as List<double>?,
        pincode: freezed == pincode
            ? _value.pincode
            : pincode // ignore: cast_nullable_to_non_nullable
                  as String?,
        state: freezed == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as String?,
        country: freezed == country
            ? _value.country
            : country // ignore: cast_nullable_to_non_nullable
                  as String?,
        additionalDirection: freezed == additionalDirection
            ? _value.additionalDirection
            : additionalDirection // ignore: cast_nullable_to_non_nullable
                  as String?,
        defaultAddress: null == defaultAddress
            ? _value.defaultAddress
            : defaultAddress // ignore: cast_nullable_to_non_nullable
                  as bool,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        isSelected: null == isSelected
            ? _value.isSelected
            : isSelected // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressModelImpl implements _AddressModel {
  const _$AddressModelImpl({
    @JsonKey(name: '_id') this.id,
    required this.name,
    required this.customerName,
    required this.address1,
    this.address2,
    required this.phone,
    this.email,
    this.city,
    final List<double>? coordinates,
    this.pincode,
    this.state,
    this.country,
    this.additionalDirection,
    this.defaultAddress = false,
    this.status = 'Active',
    this.isSelected = false,
  }) : _coordinates = coordinates;

  factory _$AddressModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  // Maps _id from API to this field
  @override
  final String name;
  // Label (Home, Work, Other)
  @override
  final String customerName;
  @override
  final String address1;
  @override
  final String? address2;
  @override
  final String phone;
  @override
  final String? email;
  @override
  final String? city;
  final List<double>? _coordinates;
  @override
  List<double>? get coordinates {
    final value = _coordinates;
    if (value == null) return null;
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? pincode;
  @override
  final String? state;
  @override
  final String? country;
  @override
  final String? additionalDirection;
  @override
  @JsonKey()
  final bool defaultAddress;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final bool isSelected;

  @override
  String toString() {
    return 'AddressModel(id: $id, name: $name, customerName: $customerName, address1: $address1, address2: $address2, phone: $phone, email: $email, city: $city, coordinates: $coordinates, pincode: $pincode, state: $state, country: $country, additionalDirection: $additionalDirection, defaultAddress: $defaultAddress, status: $status, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.address1, address1) ||
                other.address1 == address1) &&
            (identical(other.address2, address2) ||
                other.address2 == address2) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.city, city) || other.city == city) &&
            const DeepCollectionEquality().equals(
              other._coordinates,
              _coordinates,
            ) &&
            (identical(other.pincode, pincode) || other.pincode == pincode) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.additionalDirection, additionalDirection) ||
                other.additionalDirection == additionalDirection) &&
            (identical(other.defaultAddress, defaultAddress) ||
                other.defaultAddress == defaultAddress) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    customerName,
    address1,
    address2,
    phone,
    email,
    city,
    const DeepCollectionEquality().hash(_coordinates),
    pincode,
    state,
    country,
    additionalDirection,
    defaultAddress,
    status,
    isSelected,
  );

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressModelImplCopyWith<_$AddressModelImpl> get copyWith =>
      __$$AddressModelImplCopyWithImpl<_$AddressModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressModelImplToJson(this);
  }
}

abstract class _AddressModel implements AddressModel {
  const factory _AddressModel({
    @JsonKey(name: '_id') final String? id,
    required final String name,
    required final String customerName,
    required final String address1,
    final String? address2,
    required final String phone,
    final String? email,
    final String? city,
    final List<double>? coordinates,
    final String? pincode,
    final String? state,
    final String? country,
    final String? additionalDirection,
    final bool defaultAddress,
    final String status,
    final bool isSelected,
  }) = _$AddressModelImpl;

  factory _AddressModel.fromJson(Map<String, dynamic> json) =
      _$AddressModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id; // Maps _id from API to this field
  @override
  String get name; // Label (Home, Work, Other)
  @override
  String get customerName;
  @override
  String get address1;
  @override
  String? get address2;
  @override
  String get phone;
  @override
  String? get email;
  @override
  String? get city;
  @override
  List<double>? get coordinates;
  @override
  String? get pincode;
  @override
  String? get state;
  @override
  String? get country;
  @override
  String? get additionalDirection;
  @override
  bool get defaultAddress;
  @override
  String get status;
  @override
  bool get isSelected;

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressModelImplCopyWith<_$AddressModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
