import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'firmware_dtos.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class FirmwareDto  {
  final String path;
  final String version;
  final String modified;
  final double size;
  final String etag;
  final String? changelog;

  FirmwareDto({
    required this.path,
    required this.version,
    required this.modified,
    required this.size,
    required this.etag,
    this.changelog,
  });



  factory FirmwareDto.fromJson(Map<String, dynamic> json) =>
      _$FirmwareDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FirmwareDtoToJson(this);


}
