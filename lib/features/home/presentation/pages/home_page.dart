import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:valorant/features/agents/presentation/pages/agents_page.dart';
import 'package:valorant/features/maps/presentation/pages/maps_page.dart';
import 'package:valorant/features/weapons/presentation/pages/weapons_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
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
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.15,
                child: SvgPicture.asset('assets/icons/valorant_icon.svg'),
              ),
            ),
            const Text(
              "Make your \nchoice",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 32),
            ),
            Expanded(
              child: _tabSection(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        children: [
          TabBar(
            labelStyle: const TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
            indicatorPadding: EdgeInsets.zero,
            indicatorColor: Colors.purple,
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 2.0,
                color: Colors.purple,
              ),
              insets: EdgeInsets.symmetric(horizontal: 50.0),
            ),
            labelPadding: EdgeInsets.zero,
            labelColor: Colors.purple,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(text: 'Agents'),
              Tab(text: 'Maps'),
              Tab(text: 'Weapons'),
            ],
            controller: _tabController,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
                _tabController.animateTo(index);
              });
            },
          ),
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: const [
                AgentsPage(),
                MapsPage(),
                WeaponsPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
