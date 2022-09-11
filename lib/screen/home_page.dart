import 'package:flutter/material.dart';
import 'package:upstrivia/widgets/widgets.dart';
import 'package:upstrivia/providers/trivia_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TriviaProvider>(context);


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Bienvenido!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  SizedBox(height: 20,),
                  Text('Seleccione una categoria para empezar',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
                GameSelectorButton(title: 'Entretenimiento',color:Color(0xFFF1B41C), gameUuid: provider.categoriesList[0]['uuid'] ),
                GameSelectorButton(title: 'Deporte',color:Color(0xFF8549E5), gameUuid: provider.categoriesList[1]['uuid'],),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GameSelectorButton(title: 'Geografia',color:Color(0xFFF11D7D),gameUuid: provider.categoriesList[2]['uuid']),
                GameSelectorButton(title: 'Historia',color:Color(0xFF27BEF1),gameUuid:provider.categoriesList[3]['uuid']),
              ],
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
