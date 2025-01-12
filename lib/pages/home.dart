import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newproj/models/popular_model.dart';
import '../models/popular_model.dart';


List<PopularModels> popularDiets = PopularModels.getPopularDiets();
int index = 0;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.white,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          NewWidget(),
          buildCategoryContainer(),
          recommendationPart(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 15 , left: 30 , bottom: 5),
                child: Text(
                  'Popular',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
           ListView.separated(
              scrollDirection: Axis.vertical,
              itemCount: popularDiets.length,
              shrinkWrap: true,
              separatorBuilder: (context , index) => SizedBox(height: 25,),
              padding: const EdgeInsets.only(
                left: 30,
                right: 20,
              ),
              itemBuilder: (context , index){
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.cyanAccent,
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        popularDiets[index].iconPath,
                        width: 65,
                        height: 65,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            popularDiets[index].name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16
                            ),
                          ),
                          Text(
                            '${popularDiets[index].level}  |  ${popularDiets[index].duration}  |   ${popularDiets[index].calorie}',
                            style: const TextStyle(
                                color: Color(0xff7B6F72),
                                fontSize: 11,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      )
                    ],

                  ),
                );
              },
            ),

        ],
      ),
    );
  }
  Container recommendationPart() {
    return Container(
          child: Container(
             margin: EdgeInsets.only(left: 25),
              height: 350,
              width: 500,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 4),
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                          width: 230,
                          child: Text(
                              'Recommendation for Diet',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                        ),
                  ),
                   SizedBox(
                      height: 280,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          buildRecommendationContainer(imagePath: 'assets/icons/honey-pancakes.svg' , name: 'Honey Pancake'),
                          buildRecommendationContainer(imagePath: 'assets/icons/canai-bread.svg' , name: 'Canai Bread'),
                          buildRecommendationContainer(imagePath: 'assets/icons/blueberry-pancake.svg' ,name: 'Blueberry Pancake'),
                        ],
                      ),
                    ),

                ],
              ),
            ),
        );
  }

  Container buildRecommendationContainer({required String imagePath , required String name , String about = "Easy | 30mins | 200kCal"}) {
    return Container(
                          height: 280,
                          width: 220,
                          margin: EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            color: Colors.cyanAccent,
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 100,
                                  child: SvgPicture.asset(
                                    imagePath,
                                    height: 90,width: 60,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10 , bottom: 5),
                                    child: Text(
                                        name,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600
                                        ),
                                      )
                                ),
                                Text(
                                      about,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w300,

                                      ),
                                ),
                                TextButton(onPressed: (){

                                }, 
                                child: Container(
                                  height: 50,
                                  width: 120,
                                  margin: EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [Colors.lightBlueAccent, Colors.lightBlue , Colors.blue]),

                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(25) , bottomLeft:  Radius.circular(25) , topRight:  Radius.circular(25) , bottomRight:  Radius.circular(25) ),
                                  ),
                                  child: Text(
                                      'View',
                                      textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              ],
                            ),
                          ),
                        );
  }

  Container buildCategoryContainer() {
    return Container(
          margin: EdgeInsets.only(top: 15, left: 25),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text('Category',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    )),
              ),
              SizedBox(
                height: 130,
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  Container(

                    height: 125,
                    child: Row(
                      children: [
                        categoryBox(
                            imageLink: 'assets/icons/plate.svg',
                            textContent: 'Salad'),
                        categoryBox(
                            imageLink: 'assets/icons/pancakes.svg',
                            textContent: 'Cake'),
                        categoryBox(
                            imageLink: 'assets/icons/pie.svg',
                            textContent: 'Pie'),
                        categoryBox(
                            imageLink: 'assets/icons/orange-snacks.svg',
                            textContent: 'Smooth Oranges'),
                        categoryBox(
                            imageLink: 'assets/icons/honey-pancakes.svg',
                            textContent: 'Honey Pancakes'),
                        categoryBox(
                            imageLink: 'assets/icons/canai-bread.svg',
                            textContent: 'Bread'),
                      ],
                    ),
                  )
                ],
                ),
              )
            ],
          ),
        );
  }

  SizedBox categoryBox(
      {required String imageLink, required String textContent}) {
    return SizedBox(
      height: 110,
      width: 100,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            color: Colors.cyanAccent, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                height: 50,
                width: 50,
                //color: Colors.red,
                child: SvgPicture.asset(
                  '$imageLink',
                  alignment: Alignment.center,
                )),
            Container(
              margin: EdgeInsets.only(bottom: 4),
              child: Text(
                '$textContent',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    title: Text(
      'Breakfast',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w900,
      ),
    ),
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 4,
    leading: Container(
      margin: EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xffF7F8F8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SvgPicture.asset(
        'assets/icons/Arrow - Left 2.svg',
        height: 20,
        width: 20,
      ),
    ),
    actions: [
      GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          width: 37,
          decoration: BoxDecoration(
           color: Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            'assets/icons/dots.svg',
            height: 5,
            width: 5,
          ),
        ),
      ),
    ],
  );
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0xff1D1617).withOpacity(0.11),
          blurRadius: 40,
          spreadRadius: 0.0,
        )
      ]),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(15),
            hintText: 'Search Pancake',
            hintStyle: TextStyle(color: Colors.black12),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                'assets/icons/Search.svg',
                height: 5,
                width: 5,
              ),
            ),
            suffixIcon: SizedBox(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    VerticalDivider(
                      color: Colors.black,
                      thickness: 0.2,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset('assets/icons/Filter.svg'),
                    ),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            )),
      ),
    );
  }
}
