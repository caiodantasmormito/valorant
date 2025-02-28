part of 'get_weapons_cubit.dart';

sealed class GetWeaponsState extends Equatable {
  const GetWeaponsState();

  @override
  List<Object> get props => [];
}

final class GetWeaponsInitial extends GetWeaponsState {}

final class GetWeaponsLoading extends GetWeaponsState {}

final class GetWeaponsError extends GetWeaponsState {
  final String? message;

  const GetWeaponsError({required this.message});
}

final class GetWeaponsSuccess extends GetWeaponsState {
  final List<WeaponsEntity> data;

  const GetWeaponsSuccess({required this.data});

  @override
  List<Object> get props => [data];
}
