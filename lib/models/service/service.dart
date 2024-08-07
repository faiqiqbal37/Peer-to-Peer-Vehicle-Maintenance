import 'package:freezed_annotation/freezed_annotation.dart';

part 'service.freezed.dart';
part 'service.g.dart';

@freezed
class Service with _$Service {
  const factory Service({
    required String id,
    required String serviceProviderId,
    required String serviceName,
    required String serviceType,
    String? description,
    required String price,
    String? eta, // Optional
    required String vehicleType,
    String? image, // Optional, assumed to be a URL or path
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}
