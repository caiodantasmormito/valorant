import 'package:provider/provider.dart';
import 'package:valorant/core/infra/http_client.dart';
import 'package:valorant/features/agents/data/datasources/agents_datasource.dart';
import 'package:valorant/features/agents/data/datasources/agents_datasource_impl.dart';
import 'package:valorant/features/agents/data/repositories/agents_repository_impl.dart';
import 'package:valorant/features/agents/domain/repositories/agents_repository.dart';
import 'package:valorant/features/agents/domain/usecases/agents_usecase.dart';
import 'package:valorant/features/agents/presentation/cubit/get_agents_cubit.dart';

sealed class AgentsInjection {
  static final List<Provider> providers = [
    Provider<AgentsDatasource>(
      create: (context) => AgentsDatasourceImpl(
        httpClient: context.read<AuthenticatedClient>(),
      ),
    ),
    Provider<AgentsRepository>(
      create: (context) => AgentsRepositoryImpl(
          agentsDatasource: context.read<AgentsDatasource>()),
    ),
    Provider<AgentsUsecase>(
      create: (context) => AgentsUsecase(
        agentsRepository: context.read<AgentsRepository>(),
      ),
    ),
    Provider<GetAgentsCubit>(
      create: (context) => GetAgentsCubit(
        getAgentsUsecase: context.read<AgentsUsecase>(),
      ),
    ),
  ];
}
