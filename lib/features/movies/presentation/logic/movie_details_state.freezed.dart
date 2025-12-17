// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MovieDetailsState {

 UsecaseStatus get movieDetailsStatus; ErrorResponse? get movieDetailsError; MovieDetails? get movieDetails; UsecaseStatus get trailersStatus; ErrorResponse? get trailersError; List<Trailer> get trailers; UsecaseStatus get similarStatus; ErrorResponse? get similarError; List<Movie> get similarMovies; UsecaseStatus get recommendationsStatus; ErrorResponse? get recommendationsError; List<Movie> get recommendationsMovies;
/// Create a copy of MovieDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieDetailsStateCopyWith<MovieDetailsState> get copyWith => _$MovieDetailsStateCopyWithImpl<MovieDetailsState>(this as MovieDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetailsState&&(identical(other.movieDetailsStatus, movieDetailsStatus) || other.movieDetailsStatus == movieDetailsStatus)&&(identical(other.movieDetailsError, movieDetailsError) || other.movieDetailsError == movieDetailsError)&&(identical(other.movieDetails, movieDetails) || other.movieDetails == movieDetails)&&(identical(other.trailersStatus, trailersStatus) || other.trailersStatus == trailersStatus)&&(identical(other.trailersError, trailersError) || other.trailersError == trailersError)&&const DeepCollectionEquality().equals(other.trailers, trailers)&&(identical(other.similarStatus, similarStatus) || other.similarStatus == similarStatus)&&(identical(other.similarError, similarError) || other.similarError == similarError)&&const DeepCollectionEquality().equals(other.similarMovies, similarMovies)&&(identical(other.recommendationsStatus, recommendationsStatus) || other.recommendationsStatus == recommendationsStatus)&&(identical(other.recommendationsError, recommendationsError) || other.recommendationsError == recommendationsError)&&const DeepCollectionEquality().equals(other.recommendationsMovies, recommendationsMovies));
}


@override
int get hashCode => Object.hash(runtimeType,movieDetailsStatus,movieDetailsError,movieDetails,trailersStatus,trailersError,const DeepCollectionEquality().hash(trailers),similarStatus,similarError,const DeepCollectionEquality().hash(similarMovies),recommendationsStatus,recommendationsError,const DeepCollectionEquality().hash(recommendationsMovies));

@override
String toString() {
  return 'MovieDetailsState(movieDetailsStatus: $movieDetailsStatus, movieDetailsError: $movieDetailsError, movieDetails: $movieDetails, trailersStatus: $trailersStatus, trailersError: $trailersError, trailers: $trailers, similarStatus: $similarStatus, similarError: $similarError, similarMovies: $similarMovies, recommendationsStatus: $recommendationsStatus, recommendationsError: $recommendationsError, recommendationsMovies: $recommendationsMovies)';
}


}

/// @nodoc
abstract mixin class $MovieDetailsStateCopyWith<$Res>  {
  factory $MovieDetailsStateCopyWith(MovieDetailsState value, $Res Function(MovieDetailsState) _then) = _$MovieDetailsStateCopyWithImpl;
@useResult
$Res call({
 UsecaseStatus movieDetailsStatus, ErrorResponse? movieDetailsError, MovieDetails? movieDetails, UsecaseStatus trailersStatus, ErrorResponse? trailersError, List<Trailer> trailers, UsecaseStatus similarStatus, ErrorResponse? similarError, List<Movie> similarMovies, UsecaseStatus recommendationsStatus, ErrorResponse? recommendationsError, List<Movie> recommendationsMovies
});




}
/// @nodoc
class _$MovieDetailsStateCopyWithImpl<$Res>
    implements $MovieDetailsStateCopyWith<$Res> {
  _$MovieDetailsStateCopyWithImpl(this._self, this._then);

  final MovieDetailsState _self;
  final $Res Function(MovieDetailsState) _then;

/// Create a copy of MovieDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? movieDetailsStatus = null,Object? movieDetailsError = freezed,Object? movieDetails = freezed,Object? trailersStatus = null,Object? trailersError = freezed,Object? trailers = null,Object? similarStatus = null,Object? similarError = freezed,Object? similarMovies = null,Object? recommendationsStatus = null,Object? recommendationsError = freezed,Object? recommendationsMovies = null,}) {
  return _then(_self.copyWith(
movieDetailsStatus: null == movieDetailsStatus ? _self.movieDetailsStatus : movieDetailsStatus // ignore: cast_nullable_to_non_nullable
as UsecaseStatus,movieDetailsError: freezed == movieDetailsError ? _self.movieDetailsError : movieDetailsError // ignore: cast_nullable_to_non_nullable
as ErrorResponse?,movieDetails: freezed == movieDetails ? _self.movieDetails : movieDetails // ignore: cast_nullable_to_non_nullable
as MovieDetails?,trailersStatus: null == trailersStatus ? _self.trailersStatus : trailersStatus // ignore: cast_nullable_to_non_nullable
as UsecaseStatus,trailersError: freezed == trailersError ? _self.trailersError : trailersError // ignore: cast_nullable_to_non_nullable
as ErrorResponse?,trailers: null == trailers ? _self.trailers : trailers // ignore: cast_nullable_to_non_nullable
as List<Trailer>,similarStatus: null == similarStatus ? _self.similarStatus : similarStatus // ignore: cast_nullable_to_non_nullable
as UsecaseStatus,similarError: freezed == similarError ? _self.similarError : similarError // ignore: cast_nullable_to_non_nullable
as ErrorResponse?,similarMovies: null == similarMovies ? _self.similarMovies : similarMovies // ignore: cast_nullable_to_non_nullable
as List<Movie>,recommendationsStatus: null == recommendationsStatus ? _self.recommendationsStatus : recommendationsStatus // ignore: cast_nullable_to_non_nullable
as UsecaseStatus,recommendationsError: freezed == recommendationsError ? _self.recommendationsError : recommendationsError // ignore: cast_nullable_to_non_nullable
as ErrorResponse?,recommendationsMovies: null == recommendationsMovies ? _self.recommendationsMovies : recommendationsMovies // ignore: cast_nullable_to_non_nullable
as List<Movie>,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieDetailsState].
extension MovieDetailsStatePatterns on MovieDetailsState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieDetailsState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _MovieDetailsState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _MovieDetailsState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UsecaseStatus movieDetailsStatus,  ErrorResponse? movieDetailsError,  MovieDetails? movieDetails,  UsecaseStatus trailersStatus,  ErrorResponse? trailersError,  List<Trailer> trailers,  UsecaseStatus similarStatus,  ErrorResponse? similarError,  List<Movie> similarMovies,  UsecaseStatus recommendationsStatus,  ErrorResponse? recommendationsError,  List<Movie> recommendationsMovies)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieDetailsState() when $default != null:
return $default(_that.movieDetailsStatus,_that.movieDetailsError,_that.movieDetails,_that.trailersStatus,_that.trailersError,_that.trailers,_that.similarStatus,_that.similarError,_that.similarMovies,_that.recommendationsStatus,_that.recommendationsError,_that.recommendationsMovies);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UsecaseStatus movieDetailsStatus,  ErrorResponse? movieDetailsError,  MovieDetails? movieDetails,  UsecaseStatus trailersStatus,  ErrorResponse? trailersError,  List<Trailer> trailers,  UsecaseStatus similarStatus,  ErrorResponse? similarError,  List<Movie> similarMovies,  UsecaseStatus recommendationsStatus,  ErrorResponse? recommendationsError,  List<Movie> recommendationsMovies)  $default,) {final _that = this;
switch (_that) {
case _MovieDetailsState():
return $default(_that.movieDetailsStatus,_that.movieDetailsError,_that.movieDetails,_that.trailersStatus,_that.trailersError,_that.trailers,_that.similarStatus,_that.similarError,_that.similarMovies,_that.recommendationsStatus,_that.recommendationsError,_that.recommendationsMovies);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UsecaseStatus movieDetailsStatus,  ErrorResponse? movieDetailsError,  MovieDetails? movieDetails,  UsecaseStatus trailersStatus,  ErrorResponse? trailersError,  List<Trailer> trailers,  UsecaseStatus similarStatus,  ErrorResponse? similarError,  List<Movie> similarMovies,  UsecaseStatus recommendationsStatus,  ErrorResponse? recommendationsError,  List<Movie> recommendationsMovies)?  $default,) {final _that = this;
switch (_that) {
case _MovieDetailsState() when $default != null:
return $default(_that.movieDetailsStatus,_that.movieDetailsError,_that.movieDetails,_that.trailersStatus,_that.trailersError,_that.trailers,_that.similarStatus,_that.similarError,_that.similarMovies,_that.recommendationsStatus,_that.recommendationsError,_that.recommendationsMovies);case _:
  return null;

}
}

}

/// @nodoc


class _MovieDetailsState implements MovieDetailsState {
  const _MovieDetailsState({this.movieDetailsStatus = UsecaseStatus.initial, this.movieDetailsError, this.movieDetails, this.trailersStatus = UsecaseStatus.initial, this.trailersError, final  List<Trailer> trailers = const [], this.similarStatus = UsecaseStatus.initial, this.similarError, final  List<Movie> similarMovies = const [], this.recommendationsStatus = UsecaseStatus.initial, this.recommendationsError, final  List<Movie> recommendationsMovies = const []}): _trailers = trailers,_similarMovies = similarMovies,_recommendationsMovies = recommendationsMovies;
  

@override@JsonKey() final  UsecaseStatus movieDetailsStatus;
@override final  ErrorResponse? movieDetailsError;
@override final  MovieDetails? movieDetails;
@override@JsonKey() final  UsecaseStatus trailersStatus;
@override final  ErrorResponse? trailersError;
 final  List<Trailer> _trailers;
@override@JsonKey() List<Trailer> get trailers {
  if (_trailers is EqualUnmodifiableListView) return _trailers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_trailers);
}

@override@JsonKey() final  UsecaseStatus similarStatus;
@override final  ErrorResponse? similarError;
 final  List<Movie> _similarMovies;
@override@JsonKey() List<Movie> get similarMovies {
  if (_similarMovies is EqualUnmodifiableListView) return _similarMovies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_similarMovies);
}

@override@JsonKey() final  UsecaseStatus recommendationsStatus;
@override final  ErrorResponse? recommendationsError;
 final  List<Movie> _recommendationsMovies;
@override@JsonKey() List<Movie> get recommendationsMovies {
  if (_recommendationsMovies is EqualUnmodifiableListView) return _recommendationsMovies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recommendationsMovies);
}


/// Create a copy of MovieDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieDetailsStateCopyWith<_MovieDetailsState> get copyWith => __$MovieDetailsStateCopyWithImpl<_MovieDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieDetailsState&&(identical(other.movieDetailsStatus, movieDetailsStatus) || other.movieDetailsStatus == movieDetailsStatus)&&(identical(other.movieDetailsError, movieDetailsError) || other.movieDetailsError == movieDetailsError)&&(identical(other.movieDetails, movieDetails) || other.movieDetails == movieDetails)&&(identical(other.trailersStatus, trailersStatus) || other.trailersStatus == trailersStatus)&&(identical(other.trailersError, trailersError) || other.trailersError == trailersError)&&const DeepCollectionEquality().equals(other._trailers, _trailers)&&(identical(other.similarStatus, similarStatus) || other.similarStatus == similarStatus)&&(identical(other.similarError, similarError) || other.similarError == similarError)&&const DeepCollectionEquality().equals(other._similarMovies, _similarMovies)&&(identical(other.recommendationsStatus, recommendationsStatus) || other.recommendationsStatus == recommendationsStatus)&&(identical(other.recommendationsError, recommendationsError) || other.recommendationsError == recommendationsError)&&const DeepCollectionEquality().equals(other._recommendationsMovies, _recommendationsMovies));
}


@override
int get hashCode => Object.hash(runtimeType,movieDetailsStatus,movieDetailsError,movieDetails,trailersStatus,trailersError,const DeepCollectionEquality().hash(_trailers),similarStatus,similarError,const DeepCollectionEquality().hash(_similarMovies),recommendationsStatus,recommendationsError,const DeepCollectionEquality().hash(_recommendationsMovies));

@override
String toString() {
  return 'MovieDetailsState(movieDetailsStatus: $movieDetailsStatus, movieDetailsError: $movieDetailsError, movieDetails: $movieDetails, trailersStatus: $trailersStatus, trailersError: $trailersError, trailers: $trailers, similarStatus: $similarStatus, similarError: $similarError, similarMovies: $similarMovies, recommendationsStatus: $recommendationsStatus, recommendationsError: $recommendationsError, recommendationsMovies: $recommendationsMovies)';
}


}

/// @nodoc
abstract mixin class _$MovieDetailsStateCopyWith<$Res> implements $MovieDetailsStateCopyWith<$Res> {
  factory _$MovieDetailsStateCopyWith(_MovieDetailsState value, $Res Function(_MovieDetailsState) _then) = __$MovieDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 UsecaseStatus movieDetailsStatus, ErrorResponse? movieDetailsError, MovieDetails? movieDetails, UsecaseStatus trailersStatus, ErrorResponse? trailersError, List<Trailer> trailers, UsecaseStatus similarStatus, ErrorResponse? similarError, List<Movie> similarMovies, UsecaseStatus recommendationsStatus, ErrorResponse? recommendationsError, List<Movie> recommendationsMovies
});




}
/// @nodoc
class __$MovieDetailsStateCopyWithImpl<$Res>
    implements _$MovieDetailsStateCopyWith<$Res> {
  __$MovieDetailsStateCopyWithImpl(this._self, this._then);

  final _MovieDetailsState _self;
  final $Res Function(_MovieDetailsState) _then;

/// Create a copy of MovieDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? movieDetailsStatus = null,Object? movieDetailsError = freezed,Object? movieDetails = freezed,Object? trailersStatus = null,Object? trailersError = freezed,Object? trailers = null,Object? similarStatus = null,Object? similarError = freezed,Object? similarMovies = null,Object? recommendationsStatus = null,Object? recommendationsError = freezed,Object? recommendationsMovies = null,}) {
  return _then(_MovieDetailsState(
movieDetailsStatus: null == movieDetailsStatus ? _self.movieDetailsStatus : movieDetailsStatus // ignore: cast_nullable_to_non_nullable
as UsecaseStatus,movieDetailsError: freezed == movieDetailsError ? _self.movieDetailsError : movieDetailsError // ignore: cast_nullable_to_non_nullable
as ErrorResponse?,movieDetails: freezed == movieDetails ? _self.movieDetails : movieDetails // ignore: cast_nullable_to_non_nullable
as MovieDetails?,trailersStatus: null == trailersStatus ? _self.trailersStatus : trailersStatus // ignore: cast_nullable_to_non_nullable
as UsecaseStatus,trailersError: freezed == trailersError ? _self.trailersError : trailersError // ignore: cast_nullable_to_non_nullable
as ErrorResponse?,trailers: null == trailers ? _self._trailers : trailers // ignore: cast_nullable_to_non_nullable
as List<Trailer>,similarStatus: null == similarStatus ? _self.similarStatus : similarStatus // ignore: cast_nullable_to_non_nullable
as UsecaseStatus,similarError: freezed == similarError ? _self.similarError : similarError // ignore: cast_nullable_to_non_nullable
as ErrorResponse?,similarMovies: null == similarMovies ? _self._similarMovies : similarMovies // ignore: cast_nullable_to_non_nullable
as List<Movie>,recommendationsStatus: null == recommendationsStatus ? _self.recommendationsStatus : recommendationsStatus // ignore: cast_nullable_to_non_nullable
as UsecaseStatus,recommendationsError: freezed == recommendationsError ? _self.recommendationsError : recommendationsError // ignore: cast_nullable_to_non_nullable
as ErrorResponse?,recommendationsMovies: null == recommendationsMovies ? _self._recommendationsMovies : recommendationsMovies // ignore: cast_nullable_to_non_nullable
as List<Movie>,
  ));
}


}

// dart format on
