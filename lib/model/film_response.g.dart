// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmResponse _$FilmResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'FilmResponse',
      json,
      ($checkedConvert) {
        final val = FilmResponse(
          results: $checkedConvert(
              'results',
              (v) => (v as List<dynamic>)
                  .map((e) => Film.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$FilmResponseToJson(FilmResponse instance) =>
    <String, dynamic>{
      'results': instance.results.map((e) => e.toJson()).toList(),
    };
