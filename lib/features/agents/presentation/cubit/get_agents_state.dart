part of 'get_agents_cubit.dart';

sealed class GetAgentsState extends Equatable {
  const GetAgentsState();

  @override
  List<Object> get props => [];
}

final class GetAgentsInitial extends GetAgentsState {}

final class GetAgentsLoading extends GetAgentsState {}

final class GetAgentsError extends GetAgentsState {
  final String? message;

  const GetAgentsError({required this.message});
}

final class GetAgentsSuccess extends GetAgentsState {
  final List<AgentsEntity> data;

  const GetAgentsSuccess({required this.data});

  @override
  List<Object> get props => [data];
}
