import 'package:flutter/material.dart';
import 'recipe.dart';
import 'recipe_detail.dart';

void main() {
  runApp(const RecipieApp());
}

class RecipieApp extends StatelessWidget {
  const RecipieApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'Recipe Calculator',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.grey,
          secondary: Colors.black,
        ),
      ),
      home: const MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: Recipe.samples.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return RecipeDetail(recipe: Recipe.samples[index]);
                    }),
                  );
                },
                child: buildRecipeCard(Recipe.samples[index], context),
              );
            }),
      ),
    );
  }
}

Widget buildRecipeCard(Recipe recipe, BuildContext context) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    elevation: 3.1,
    child: ClipRRect(
      child: Stack(
        children: [
          Image(image: AssetImage(recipe.imageUrl)),
          Container(
            padding: const EdgeInsets.all(6),
            child: Text(
              recipe.label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
                fontFamily: 'Palatino',
              ),
            ),
            width: MediaQuery.of(context).size.width,
            decoration:
                const BoxDecoration(color: Color.fromARGB(150, 112, 112, 112)),
          ),
        ],
        alignment: AlignmentDirectional.bottomCenter,
      ),
      borderRadius: BorderRadius.circular(20),
    ),
  );
}
