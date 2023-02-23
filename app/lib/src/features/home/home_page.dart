import 'package:flutter/material.dart';
import 'package:listinha/src/features/home/widgets/custom_drawer.dart';
import 'package:listinha/src/features/home/widgets/task_card.dart';
import 'package:listinha/src/shared/models/task_model.dart';
import 'package:listinha/src/shared/widgets/user_image_button.dart';
import 'package:realm/realm.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('notas'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: UserImageButton(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed('./edit');
        },
        label: const Text('nova lista'),
        icon: const Icon(Icons.add_circle),
      ),
      body: Center(
        child: Stack(
          children: [
            ListView.separated(
              itemCount: 100,
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 90),
              itemBuilder: (_, index) {
                return TaskCard(
                  task: TaskBoard(
                    Uuid.v4(),
                    'Nova lista',
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10,
                );
              },
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SegmentedButton(
                  segments: const [
                    ButtonSegment(
                      value: 0,
                      label: Text('Todas'),
                    ),
                    ButtonSegment(
                      value: 1,
                      label: Text('Pendentes'),
                    ),
                    ButtonSegment(
                      value: 2,
                      label: Text('Concluídas'),
                    ),
                    ButtonSegment(
                      value: 3,
                      label: Text('Desativadas'),
                    ),
                  ],
                  selected: const {0},
                  onSelectionChanged: (values) {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
