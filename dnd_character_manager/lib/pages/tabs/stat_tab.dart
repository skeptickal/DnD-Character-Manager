import 'package:dnd_character_manager/cubits/character_cubit/character_cubit.dart';
import 'package:dnd_character_manager/models/character/dnd_character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../client/spacing.dart';
import '../../constants/text_fields.dart';
import '../../constants/theme_data.dart';

class StatTab extends StatelessWidget {
  final DndCharacter dndCharacter;
  const StatTab({super.key, required this.dndCharacter});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterCubit, CharacterState>(
      builder: (context, state) {
        TextEditingController str = TextEditingController();
        str.text = '';
        TextEditingController dex = TextEditingController();
        dex.text = '';
        TextEditingController con = TextEditingController();
        con.text = '';
        TextEditingController int = TextEditingController();
        int.text = '';
        TextEditingController wis = TextEditingController();
        wis.text = '';
        TextEditingController cha = TextEditingController();
        cha.text = '';
        TextEditingController currentHP = TextEditingController();
        currentHP.text = '';
        TextEditingController maxHP = TextEditingController();
        maxHP.text = '';
        return SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => context.read<CharacterCubit>().statEdit(!state.statEdit!),
                    icon: const Icon(
                      Icons.edit,
                    ),
                  ),
                  Text(
                    'Edit/Save',
                    style: dndFont,
                  ),
                ],
              ),
              seperation,
              seperation,
              Row(
                children: [
                  Flexible(
                    child: StatTextBox(
                      enabled: state.statEdit!,
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      controller: str,
                      hintText: 'Player Level',
                      subtitle: 'Player Level',
                    ),
                  ),
                  Flexible(
                    child: StatTextBox(
                      enabled: state.statEdit!,
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      controller: dex,
                      hintText: 'Class Level',
                      subtitle: 'Class Level',
                    ),
                  ),
                ],
              ),
              seperation,
              Row(
                children: [
                  Flexible(
                    child: StatTextBox(
                      enabled: state.statEdit!,
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      controller: con,
                      hintText: 'Subclass (1) Level',
                      subtitle: 'Subclass (1) Level',
                    ),
                  ),
                  Flexible(
                    child: StatTextBox(
                      enabled: state.statEdit!,
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      controller: con,
                      hintText: 'Subclass (2) Level',
                      subtitle: 'Subclass (2) Level',
                    ),
                  ),
                ],
              ),
              seperation,
              Text(
                'hint: Class + Subclass Level should = Player Level',
                style: dndFont,
              ),
              seperation,
              horizontalLine,
              seperation,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: StatTextBox(
                      enabled: state.statEdit!,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      controller: currentHP,
                      hintText: 'Current HP',
                      subtitle: 'Current HP',
                    ),
                  ),
                  Flexible(
                    child: StatTextBox(
                      enabled: state.statEdit!,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      controller: maxHP,
                      hintText: 'MAX HP',
                      subtitle: 'MAX HP',
                    ),
                  ),
                ],
              ),
              seperation,
              horizontalLine,
              seperation,
              Row(
                children: [
                  Flexible(
                    child: StatTextBox(
                      enabled: state.statEdit!,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      controller: str,
                      hintText: 'STR',
                      subtitle: 'STR',
                    ),
                  ),
                  Flexible(
                    child: StatTextBox(
                      enabled: state.statEdit!,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      controller: dex,
                      hintText: 'DEX',
                      subtitle: 'DEX',
                    ),
                  ),
                  Flexible(
                    child: StatTextBox(
                      enabled: state.statEdit!,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      controller: con,
                      hintText: 'CON',
                      subtitle: 'CON',
                    ),
                  ),
                ],
              ),
              seperation,
              Row(
                children: [
                  Flexible(
                    child: StatTextBox(
                      enabled: state.statEdit!,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      controller: int,
                      hintText: 'INT',
                      subtitle: 'INT',
                    ),
                  ),
                  Flexible(
                    child: StatTextBox(
                      enabled: state.statEdit!,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      controller: wis,
                      hintText: 'WIS',
                      subtitle: 'WIS',
                    ),
                  ),
                  Flexible(
                    child: StatTextBox(
                      enabled: state.statEdit!,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      controller: cha,
                      hintText: 'CHA',
                      subtitle: 'CHA',
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
