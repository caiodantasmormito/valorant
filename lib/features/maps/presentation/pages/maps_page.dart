import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:valorant/core/widgets/grid_card_widget.dart';
import 'package:valorant/features/agents_details/presentation/pages/agent_details_page.dart';
import 'package:valorant/features/maps/presentation/cubit/get_maps_cubit.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});
  static const String routeName = '/maps';

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage>
    with SingleTickerProviderStateMixin {
  late final GetMapsCubit _getMapsCubit;

  @override
  void initState() {
    super.initState();
    _getMapsCubit = context.read<GetMapsCubit>()..getMaps();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocBuilder<GetMapsCubit, GetMapsState>(
          bloc: _getMapsCubit,
          builder: (context, state) {
            if (state is GetMapsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is GetMapsError) {
              return Center(
                child: Text(state.message!),
              );
            }
            if (state is GetMapsSuccess) {
              if (state.data.isEmpty) {
                return const Center(
                  child: Text('Nenhum mapa encontrado.'),
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

  Widget _buildHomeView(GetMapsSuccess state) {
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
              "Choose your \nMap",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 32),
            ),
            GridCardsWidget(
              data: state.data,
              getImageUrl: (map) => map.splash,
              getTitle: (map) => map.displayName,
              getSubTitle: (map) => map.description,
              onTap: (context, agent) =>
                  context.push(AgentDetailsPage.routeName, extra: agent),
            ),
          ],
        ),
      ),
    );
  }
}
