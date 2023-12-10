import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:mealapp/about_page.dart';
import 'package:mealapp/detail_page.dart';
import 'package:mealapp/global.dart';
import 'package:mealapp/models/mealdata.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List<MealData> meal = [
    MealData(
      strMeal: "Escovitch Fish",
      strMealThumb:
          "https://www.themealdb.com/images/media/meals/1520084413.jpg",
      idMeal: "52944",
      strCategory: "Seafood",
      strArea: "Jamaican",
    ),
    MealData(
      strMeal: "Fish fofos",
      strMealThumb:
          "https://www.themealdb.com/images/media/meals/a15wsa1614349126.jpg",
      idMeal: "53043",
      strCategory: "Seafood",
      strArea: "Portuguese",
    ),
    MealData(
        strMeal: "Fish pie",
        strMealThumb:
            "https://www.themealdb.com/images/media/meals/ysxwuq1487323065.jpg",
        idMeal: "52802",
        strCategory: "Seafood",
        strArea: "British"),
    MealData(
      strMeal: "Fish Soup (Ukha)",
      strMealThumb:
          "https://www.themealdb.com/images/media/meals/7n8su21699013057.jpg",
      idMeal: "53079",
      strCategory: "Seafood",
      strArea: "Russian",
    ),
    MealData(
      strMeal: "Fish Stew with Rouille",
      strMealThumb:
          "https://www.themealdb.com/images/media/meals/vptqpw1511798500.jpg",
      idMeal: "52918",
      strCategory: "Seafood",
      strArea: "French",
    ),
    MealData(
      strMeal: "Garides Saganaki",
      strMealThumb:
          "https://www.themealdb.com/images/media/meals/wuvryu1468232995.jpg",
      idMeal: "52764",
      strCategory: "Seafood",
      strArea: "Greek",
    ),
    MealData(
      strMeal: "Apam balik",
      strMealThumb:
          "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
      idMeal: "53049",
      strCategory: "Dessert",
      strArea: "Malaysian",
    ),
    MealData(
      strMeal: "Carrot Cake",
      strMealThumb:
          "https://www.themealdb.com/images/media/meals/vrspxv1511722107.jpg",
      idMeal: "52897",
      strCategory: "Dessert",
      strArea: "British",
    ),
    MealData(
      strMeal: "BeaverTails",
      strMealThumb:
          "https://www.themealdb.com/images/media/meals/ryppsv1511815505.jpg",
      idMeal: "52928",
      strCategory: "Dessert",
      strArea: "Canadian",
    )
  ];

  List<MealData> display_list = List.from(meal);

  void UpdateList(String value) {
    setState(() {
      display_list = meal
          .where((element) =>
              element.strMeal!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  void _navigateToDetail(String idMeal) async {
    final response = await http.get(
      Uri.parse("https://www.themealdb.com/api/json/v1/1/lookup.php?i=$idMeal"),
    );
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailPage(response.body)),
      );
    } else {
      // Handle error
      print("Failed to load meal details");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(children: [
          IconButton(
            onPressed: (() => {}),
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          Text(
            "Meal App",
            style: GoogleFonts.montserrat(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutPage()));
            },
            icon: Image.asset('assets/svg/user.png'),
            iconSize: 10.0,
          ),
        ]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => UpdateList(value),
              style: const TextStyle(
                fontSize: 15,
              ),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: primary,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Search",
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: display_list.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 8.0),
                itemBuilder: (context, index) => GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    _navigateToDetail(display_list[index].idMeal!);
                  },
                  child: Card(
                    color: primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 17, top: 12, bottom: 12),
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              display_list[index].strMeal!,
                              style: GoogleFonts.montserratAlternates(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_city,
                                  size: 15,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  display_list[index].strArea!,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              display_list[index].strCategory!,
                              style: GoogleFonts.montserrat(fontSize: 10),
                            ),
                          ],
                        ),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child:
                              Image.network(display_list[index].strMealThumb!),
                        ),
                        trailing: IconButton(
                          onPressed: (() {
                            _navigateToDetail(display_list[index].idMeal!);
                          }),
                          icon: const Icon(
                            Icons.info_outline_rounded,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
