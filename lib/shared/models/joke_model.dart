import 'package:freezed_annotation/freezed_annotation.dart';

part 'joke_model.freezed.dart';
part 'joke_model.g.dart';

@freezed
class JokeModel with _$JokeModel {
  const factory JokeModel({
    required String id,
    required String value,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'icon_url') required String iconUrl,
  }) = _JokeModel;

  factory JokeModel.fromJson(Map<String, dynamic> json) =>
      _$JokeModelFromJson(json);
}
