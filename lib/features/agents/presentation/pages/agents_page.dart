import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant/features/agents/presentation/cubit/get_agents_cubit.dart';

class AgentsPage extends StatefulWidget {
  const AgentsPage({super.key});
  static const String routeName = '/agents';

  @override
  State<AgentsPage> createState() => _AgentsPageState();
}

class _AgentsPageState extends State<AgentsPage> {
  late final GetAgentsCubit _getAgentsCubit;

  @override
  void initState() {
    super.initState();
    _getAgentsCubit = context.read<GetAgentsCubit>()..getAgents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Agentes Valorant'),
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<GetAgentsCubit, GetAgentsState>(
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
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Text(
                        'Agentes',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF999999),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: CircleAvatar(
                              backgroundColor: const Color(0XFFBFBFBF),
                              // ignore: unnecessary_null_comparison
                              child: state.data[index].displayIcon != null
                                  ? Image.network(
                                      state.data[index].displayIcon,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Icon(Icons.error);
                                      },
                                    )
                                  : const Icon(Icons.error),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.data[index].displayName,
                                  style: const TextStyle(color: Colors.black),
                                ),
                                Text(
                                  state.data[index].description,
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: Text(
                              state.data[index].role!.displayName,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
