import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:valorant/core/domain/usecase/usecase.dart';
import 'package:valorant/features/agents/domain/entities/agents_entity.dart';
import 'package:valorant/features/agents/domain/usecases/agents_usecase.dart';

part 'get_agents_state.dart';

class GetAgentsCubit extends Cubit<GetAgentsState> {
  final AgentsUsecase _getAgentsUsecase;
  GetAgentsCubit({required AgentsUsecase getAgentsUsecase})
      : _getAgentsUsecase = getAgentsUsecase,
        super(GetAgentsInitial());

  Future<void> getAgents() async {
    emit(GetAgentsLoading());

    final (failure, result) = await _getAgentsUsecase(const NoParams());

    if (failure != null) {
      emit(
        GetAgentsError(message: failure.message!),
      );
      return;
    }

    emit(GetAgentsSuccess(
      data: result!,
    ));
  }
}
