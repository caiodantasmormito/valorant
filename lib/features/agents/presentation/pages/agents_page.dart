import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
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
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _getAgentsCubit = context.read<GetAgentsCubit>()..getAgents();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
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
              return _buildHomeView(state);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildHomeView(GetAgentsSuccess state) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                height: 64,
                width: 64,
                child: SvgPicture.asset('assets/icons/valorant_icon.svg'),
              ),
            ),
            const Text(
              "Choose your \nAgent",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 32),
            ),
            _gridCards(state),
          ],
        ),
      ),
    );
  }

  Widget _gridCards(GetAgentsSuccess state) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: state.data.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            context.push(DetailScreen.routeName, extra: state.data[index]);
          },
          child: Stack(
            children: [
              Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.01)
                  ..rotateY(-0.06)
                  ..rotateX(-0.1),
                alignment: FractionalOffset.bottomLeft,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.purple,
                        Colors.deepPurple,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CachedNetworkImage(
                  imageUrl: state.data[index].displayIcon,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, color: Colors.white),
                ),
              ),
              Positioned(
                left: 10,
                bottom: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.data[index].displayName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        letterSpacing: 2.0,
                      ),
                    ),
                    Text(
                      state.data[index].role.displayName ?? "",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
