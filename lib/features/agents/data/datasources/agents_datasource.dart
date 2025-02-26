import 'package:valorant/features/agents/data/models/agents_model.dart';

abstract interface class AgentsDatasource {
  Future<ListAgentsModel> getAgents();
}
