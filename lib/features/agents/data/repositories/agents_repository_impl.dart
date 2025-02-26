import 'package:valorant/core/domain/failure/failure.dart';
import 'package:valorant/features/agents/data/datasources/agents_datasource.dart';
import 'package:valorant/features/agents/data/exceptions/exceptions.dart';
import 'package:valorant/features/agents/domain/entities/agents_entity.dart';
import 'package:valorant/features/agents/domain/failures/failures.dart';
import 'package:valorant/features/agents/domain/repositories/agents_repository.dart';

class AgentsRepositoryImpl implements AgentsRepository {
  final AgentsDatasource _agentsDatasource;

  AgentsRepositoryImpl({required AgentsDatasource agentsDatasource})
      : _agentsDatasource = agentsDatasource;

  @override
  Future<(Failure?, List<AgentsEntity>?)> getAgents() async {
    try {
      final result = await _agentsDatasource.getAgents();

      return (null, result.agents);
    } on AgentsExeception catch (error) {
      return (
        GetAgentsFailure(message: error.message),
        null,
      );
    }
  }
}
