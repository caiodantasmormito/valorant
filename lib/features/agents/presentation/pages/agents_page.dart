import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:valorant/core/widgets/grid_card_widget.dart';
import 'package:valorant/features/agents/presentation/cubit/get_agents_cubit.dart';
import 'package:valorant/features/agents_details/presentation/pages/agent_details_page.dart';

class AgentsPage extends StatefulWidget {
  const AgentsPage({super.key});
  static const String routeName = '/agents';

  @override
  State<AgentsPage> createState() => _AgentsPageState();
}

class _AgentsPageState extends State<AgentsPage>
    with SingleTickerProviderStateMixin {
  late final GetAgentsCubit _getAgentsCubit;

  @override
  void initState() {
    super.initState();
    _getAgentsCubit = context.read<GetAgentsCubit>()..getAgents();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<GetAgentsCubit, GetAgentsState>(
        bloc: _getAgentsCubit,
        builder: (context, state) {
          if (state is GetAgentsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is GetAgentsError) {
            return Center(
              child: Text(state.message!),
            );
          }
          if (state is GetAgentsSuccess) {
            if (state.data.isEmpty) {
              return const Center(
                child: Text('Nenhum agente encontrado.'),
              );
            }
            return GridCardsWidget(
              data: state.data,
              getImageUrl: (agent) => agent.displayIcon,
              getTitle: (agent) => agent.displayName,
              getSubTitle: (agent) => agent.role.displayName,
              onTap: (context, agent) =>
                  context.push(AgentDetailsPage.routeName, extra: agent),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
