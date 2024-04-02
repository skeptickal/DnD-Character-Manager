import 'package:dnd_character_manager/cubits/bio_cubit/cubit/bio_cubit.dart';
import 'package:dnd_character_manager/models/bio.dart';
import 'package:dnd_character_manager/models/character/dnd_character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/text_fields.dart';
import '../../constants/theme_data.dart';

class BioTab extends StatelessWidget {
  final DndCharacter dndCharacter;
  const BioTab({super.key, required this.dndCharacter});

  @override
  Widget build(BuildContext context) {
    context.read<BioCubit>().readBioData(dndCharacter.charID);
    return BlocBuilder<BioCubit, BioState>(
      builder: (context, state) {
        TextEditingController background = TextEditingController();
        TextEditingController personality = TextEditingController();
        TextEditingController dndAlignment = TextEditingController();
        TextEditingController name = TextEditingController();
        TextEditingController race = TextEditingController();
        TextEditingController dndClass = TextEditingController();
        TextEditingController dndSubClass1 = TextEditingController();
        TextEditingController dndSubClass2 = TextEditingController();
        TextEditingController bonds = TextEditingController();
        TextEditingController flaws = TextEditingController();
        background.text = state.bio!.background ?? 'bio';
        personality.text = state.bio!.personality!;
        name.text = dndCharacter.name;
        race.text = dndCharacter.race;
        dndClass.text = dndCharacter.dndClass;
        bonds.text = state.bio!.bonds ?? '';
        flaws.text = state.bio!.flaws ?? '';
        dndAlignment.text = state.bio!.alignment ?? 'Select an Alignment';
        dndSubClass1.text = state.bio!.subclass1 ?? '';
        dndSubClass2.text = state.bio!.subclass2 ?? '';
        BigTextBox nameBox = BigTextBox(
          enabled: state.bioEdit!,
          padding: const EdgeInsets.all(6),
          controller: name,
          hintText: 'name',
          subtitle: 'Name',
        );
        BigTextBox raceBox = BigTextBox(
          enabled: state.bioEdit!,
          padding: const EdgeInsets.all(6),
          controller: race,
          hintText: 'race',
          subtitle: 'Race',
        );
        BigTextBox dndClassBox = BigTextBox(
          enabled: state.bioEdit!,
          padding: const EdgeInsets.all(6),
          controller: dndClass,
          hintText: 'class',
          subtitle: 'Class',
        );
        BigTextBox dndSubClass1Box = BigTextBox(
          enabled: state.bioEdit!,
          padding: const EdgeInsets.all(6),
          controller: dndSubClass1,
          hintText: 'Optional',
          subtitle: 'Subclass (1)',
        );
        BigTextBox dndSubClass2Box = BigTextBox(
          enabled: state.bioEdit!,
          padding: const EdgeInsets.all(6),
          controller: dndSubClass2,
          hintText: 'Optional',
          subtitle: 'Subclass (2)',
        );
        BigTextBox backgroundBox = BigTextBox(
          enabled: state.bioEdit!,
          controller: background,
          padding: const EdgeInsets.all(6),
          hintText: 'bio',
          subtitle: 'Bio/Background',
          minLines: 30,
        );
        BigTextBox personalityBox = BigTextBox(
          enabled: state.bioEdit!,
          controller: personality,
          padding: const EdgeInsets.all(6),
          hintText: 'Personality',
          subtitle: 'Personality + Traits',
          minLines: 5,
        );
        BigTextBox bondsBox = BigTextBox(
          enabled: state.bioEdit!,
          controller: bonds,
          padding: const EdgeInsets.all(6),
          hintText: 'e.g. Bound to ____ Group by Honor',
          subtitle: 'Bonds',
          minLines: 5,
        );
        BigTextBox flawsBox = BigTextBox(
          enabled: state.bioEdit!,
          controller: flaws,
          padding: const EdgeInsets.all(6),
          hintText: 'e.g. Kleptomaniac',
          subtitle: 'Flaws',
          minLines: 5,
        );
        List<String> dndAlignments = [
          'Select an Alignment',
          'Lawful Good',
          'Lawful Evil',
          'Lawful Neutral',
          'Neutral',
          'Chaotic Good',
          'Chaotic Neutral',
          'Chaotic Evil',
        ];
        Column dndAlignmentSelector = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(6),
              child: DropdownButtonFormField<String>(
                key: const Key('alignment_dropdown'),
                value: state.bio!.alignment ?? 'Select an Alignment',
                items: dndAlignments.map((alignment) {
                  return DropdownMenuItem<String>(
                    value: alignment,
                    child: Text(alignment),
                  );
                }).toList(),
                onChanged: state.bioEdit!
                    ? (String? value) {
                        dndAlignment.text = value ?? 'Select an Alignment';
                      }
                    : null,
                decoration: textInputDecoration.copyWith(hintText: 'Select an Alignment'),
              ),
            ),
          ],
        );
        return SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<BioCubit>().bioEdit(!state.bioEdit!);
                      Bio bio = Bio(
                        charID: dndCharacter.charID,
                        alignment: dndAlignment.text,
                        subclass1: dndSubClass1.text,
                        subclass2: dndSubClass2.text,
                        background: background.text,
                        flaws: flaws.text,
                        bonds: bonds.text,
                        personality: personality.text,
                      );
                      context.read<BioCubit>().setBioData(bio);
                      context.read<BioCubit>().readBioData(dndCharacter.charID);
                    },
                    icon: const Icon(
                      Icons.edit,
                    ),
                  ),
                  Text(
                    'Edit/Save',
                    style: dndFont,
                  )
                ],
              ),
              nameBox,
              raceBox,
              dndClassBox,
              dndSubClass1Box,
              dndSubClass2Box,
              Center(
                child: Text(
                  'Select Your Character\'s Alignment',
                  style: dndFont.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              dndAlignmentSelector,
              personalityBox,
              bondsBox,
              flawsBox,
              backgroundBox,
            ],
          ),
        );
      },
    );
  }
}