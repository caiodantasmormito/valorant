import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:valorant/features/agents/presentation/pages/agents_page.dart';

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
              /*InkWell(
                onTap: () {
                  context.push(AgentsPage.routeName);
                },
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Image.network(
                      'https://www.dexerto.com/cdn-image/wp-content/uploads/2024/06/05/agent-buffs-nerfs-valorant-patch-8-11.jpg'),
                ),
              ),*/
              Text('MAPS'),
              /*InkWell(
                onTap: () {
                  context.push(AgentsPage.routeName);
                },
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Image.network(
                      'https://files.bo3.gg/uploads/image/68368/image/webp-1ddbca2c6f39ff448337ee0c62087161.webp'),
                ),
              ),*/
              InkWell(
                  onTap: () {
                    context.push(AgentsPage.routeName);
                  },
                  child: Text('WEAPONS')),
              /*InkWell(
                onTap: () {
                  //context.push(AgentsPage.routeName);
                },
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Image.network(
                      'https://s2-ge.glbimg.com/AWPR8ONO1qyVnOLprWZ3Kfs8rcA=/0x0:960x540/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_bc8228b6673f488aa253bbcb03c80ec5/internal_photos/bs/2021/t/B/EMdta3QdyxT4S7HwnlCA/skins-valorant.png'),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
