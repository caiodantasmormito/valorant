import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:valorant/core/infra/http_client.dart';
import 'package:valorant/core/routes/routes.dart';
import 'package:valorant/core/utils/app_theme.dart';
import 'package:valorant/core/utils/colors.dart';
import 'package:valorant/features/agents/core/agents_providers.dart';
import 'package:valorant/main.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => HttpClient(),
        ),
        Provider<SharedPreferences>(
          create: (context) => preferences!,
        ),
        Provider(
          create: (context) => AuthenticatedClient(
            sharedPreferences: context.read<SharedPreferences>(),
          ),
        ),
        ...AgentsInjection.providers,
      ],
      child: MaterialApp.router(
        color: AppColors.background,
        theme: themeDataDark,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
