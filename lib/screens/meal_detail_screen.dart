// import 'package:flutter/material.dart';
// import '../data/dummy_data.dart';

// import '../models/meal.dart';

// class MealDetailScreen extends StatelessWidget {
//   static const routeName = '/meal-item';
//   final Function toggleFavorite;
//   final Function isFavorite;

//   const MealDetailScreen(this.toggleFavorite, this.isFavorite);

//   Widget buildSectionTitle(BuildContext context, String text) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       child: Text(
//         '$text',
//         style: Theme.of(context).textTheme.headline6,
//       ),
//     );
//   }

//   Widget buildContainer(Widget child) {
//     return Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(color: Colors.grey),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         margin: EdgeInsets.all(10),
//         padding: EdgeInsets.all(10),
//         height: 150,
//         width: 300,
//         child: child);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final mealId = ModalRoute.of(context).settings.arguments as String;
//     final mealItem = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('${mealItem.title}'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Container(
//               height: 300,
//               width: double.infinity,
//               child: Image.network(
//                 mealItem.imageUrl,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             buildSectionTitle(context, 'Ingredients'),
//             buildContainer(
//               ListView.builder(
//                 itemBuilder: (ctx, index) {
//                   return Card(
//                     color: Theme.of(context).accentColor,
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(
//                         vertical: 5,
//                         horizontal: 10,
//                       ),
//                       child: Text(mealItem.ingredients[index]),
//                     ),
//                   );
//                 },
//                 itemCount: mealItem.ingredients.length,
//               ),
//             ),
//             buildSectionTitle(context, 'Steps'),
//             buildContainer(
//               ListView.builder(
//                 itemBuilder: (ctx, index) {
//                   return Column(
//                     children: <Widget>[
//                       ListTile(
//                         leading: CircleAvatar(
//                           child: Text("#${index + 1}"),
//                         ),
//                         title: Text('${mealItem.steps[index]}'),
//                       ),
//                       Divider()
//                     ],
//                   );
//                 },
//                 itemCount: mealItem.ingredients.length,
//               ),
//             )
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.of(context).pop(mealId);
//         },
//         child: Icon(Icons.delete),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../data/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(selectedMeal.ingredients[index])),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                      ),
                    ),
                    Divider()
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
