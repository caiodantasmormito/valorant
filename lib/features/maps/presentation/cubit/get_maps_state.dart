part of 'get_maps_cubit.dart';

sealed class GetMapsState extends Equatable {
  const GetMapsState();

  @override
  List<Object> get props => [];
}

final class GetMapsInitial extends GetMapsState {}

final class GetMapsLoading extends GetMapsState {}

final class GetMapsError extends GetMapsState {
  final String? message;

  const GetMapsError({required this.message});
}

final class GetMapsSuccess extends GetMapsState {
  final List<MapsEntity> data;

  const GetMapsSuccess({required this.data});

  @override
  List<Object> get props => [data];
}
