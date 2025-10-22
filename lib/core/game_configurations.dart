
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:glow_quest/presentation/home/home_view.dart';
import 'package:glow_quest/presentation/quest_one/energy_boost/energy_boost_binding.dart';
import 'package:glow_quest/presentation/quest_one/quest_one_view.dart';
import 'package:glow_quest/presentation/sub_quest_selection/sub_quest_selection_view.dart';

final gamePages = [
    GetPage(
      name: '/home', // Or whatever your home route is
      page: () => HomeView(),
      binding: EnergyBoostBinding(), 
      children: [
        GetPage(
          name: '/quest_one', 
          page: () => SubQuestSelectionView(
            questId: 1,
          ),
          binding: EnergyBoostBinding(), 
          children: [
            GetPage(
              name: '/energy_boost', 
              page: () => QuestOneView(),
              binding: EnergyBoostBinding(), 
            )
          ]
        )
      ]
    ),
];