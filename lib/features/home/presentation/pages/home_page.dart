import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:valorant/features/agents/presentation/pages/agents_page.dart';
import 'package:valorant/features/maps/presentation/pages/maps_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16,
            children: [
              Text('AGENTS'),
              InkWell(
                onTap: () {
                  context.push(AgentsPage.routeName);
                },
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Image.asset('assets/images/agents.png'),
                ),
              ),
              Text('MAPS'),
              InkWell(
                onTap: () {
                  context.push(MapsPage.routeName);
                },
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Image.asset(
                    'assets/images/maps.png',
                  ),
                ),
              ),
              Text('WEAPONS'),
              InkWell(
                onTap: () {
                  context.push(MapsPage.routeName);
                },
                child: Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Image.asset('assets/images/weapons.jpg'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
