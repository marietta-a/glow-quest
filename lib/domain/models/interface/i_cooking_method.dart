/// [cook] method, cook food with name [name]
/// using [equipment]
library;

import 'package:glow_quest/domain/models/interface/i_cooking_equipment.dart';

abstract class ICookingMethod {
    late String name;
    ICookingEquipment getCookingEquipment();
    void cook();
}