import 'package:valorant/core/domain/failure/failure.dart';
import 'package:valorant/core/domain/usecase/usecase.dart';
import 'package:valorant/features/agents/domain/entities/agents_entity.dart';
import 'package:valorant/features/agents/domain/repositories/agents_repository.dart';

class AgentsUsecase implements UseCase<List<AgentsEntity>, NoParams> {
  final AgentsRepository _agentsRepository;
  AgentsUsecase({required AgentsRepository agentsRepository})
      : _agentsRepository = agentsRepository;

  @override
  Future<(Failure?, List<AgentsEntity>?)> call(NoParams params) =>
      _agentsRepository.getAgents();
}
