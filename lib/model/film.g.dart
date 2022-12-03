// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Film _$FilmFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Film',
      json,
      ($checkedConvert) {
        final val = Film(
          id: $checkedConvert('id', (v) => v as String),
          title: $checkedConvert('title', (v) => v as String),
          poster: $checkedConvert('poster_path', (v) => v as String?),
          overview: $checkedConvert('overview', (v) => v as String),
          release: $checkedConvert('release_date', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'poster': 'poster_path', 'release': 'release_date'},
    );

Map<String, dynamic> _$FilmToJson(Film instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'poster_path': instance.poster,
      'overview': instance.overview,
      'release_date': instance.release,
    };
