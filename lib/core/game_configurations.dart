
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:glow_quest/presentation/home/home_view.dart';
import 'package:glow_quest/presentation/quest_one/energy_boost/energy_boost_binding.dart';
import 'package:glow_quest/presentation/quest_one/quest_one_view.dart';
import 'package:glow_quest/presentation/quest_one/quests_base_binding.dart';

final gamePages = [
    GetPage(
      name: '/home', // Or whatever your home route is
      page: () => HomeView(),
      binding: QuestsBinding(), 
      children: [
        GetPage(
          name: '/quest_one', 
          page: () => QuestOneView(),
          binding: EnergyBoostBinding(), 
        )
      ]
    ),
];