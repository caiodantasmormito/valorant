import 'package:valorant/core/domain/failure/failure.dart';
import 'package:valorant/features/agents/domain/entities/agents_entity.dart';

abstract class AgentsRepository {
  Future<(Failure?, List<AgentsEntity>?)> getAgents();
}
