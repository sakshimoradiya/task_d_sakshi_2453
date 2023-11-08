import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:task_d_sakshi_2453/Widget/category_button.dart';
import 'package:task_d_sakshi_2453/Widget/icon_widget.dart';
import 'package:task_d_sakshi_2453/componant/color.dart';
import 'package:task_d_sakshi_2453/componant/size.dart';

import '../../Controller/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.themeColor,
        title: const Text("Fast food Del"),
        centerTitle: true,

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder(
            init: HomeController(),
            builder: (HomeController controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      iconWidget(icon: Icon(Icons.dehaze_rounded, color: MyColor.white,), color: MyColor.themeColor),
                      Text(
                        "📍 Surat - 394107",
                        style: TextStyle(fontSize: 18, color: MyColor.grey),
                      ),
                      iconWidget(
                        color: MyColor.themeColor,
                        icon: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            'https://media.licdn.com/dms/image/D4D03AQGA_uI8GovT3Q/profile-displayphoto-shrink_200_200/0/1680071922583?e=1685577600&v=beta&t=ZKUnyIWjk0D2IY1Qi6HOW135tTVt085H5DrSP5f84fU',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Hi Saksh",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: MyColor.themeColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Find Your Food",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: MyColor.black,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const CupertinoSearchTextField(),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => controller.selectCategory('All'),
                        child: categoryButton(title: "All"),
                      ),
                      GestureDetector(
                        onTap: () => controller.selectCategory('Food'),
                        child: categoryButton(title: "Food"),
                      ),
                      GestureDetector(
                        onTap: () => controller.selectCategory('Fruit'),
                        child: categoryButton(title: "Fruit"),
                      ),
                      GestureDetector(
                        onTap: () => controller.selectCategory('Vegetable'),
                        child: categoryButton(title: "Vegetable"),
                      ),
                    ],
                  ),
                  Expanded(
                    child: StreamBuilder(
                      stream: (controller.category.value == "All")
                          ? FirebaseFirestore.instance.collection('food').snapshots()
                          : FirebaseFirestore.instance.collection('food').where('category', isEqualTo: controller.category.value,).snapshots(),
                      builder: (context, snapshot) {
                        if(snapshot.hasError) {
                          return const Center(child: Text("Something went Wrong!!"),);
                        } else if(snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else {
                          return GridView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.only(top: 10),
                            itemCount: snapshot.data!.docs.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1/1.25,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemBuilder: (context, index) {
                              List data = snapshot.data!.docs;
                              return GestureDetector(
                                // onTap: () => Get.to(() => FoodDetails(food: snapshot.data!.docs[index],)),
                                child: Card(
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          alignment: Alignment.centerRight,
                                          child: IconButton(
                                            icon: (data[index]['fav'])
                                                ? Icon(CupertinoIcons.heart_fill, color: MyColor.red,)
                                                : Icon(CupertinoIcons.heart, color: MyColor.grey,),
                                            splashRadius: 5,
                                            onPressed: () => controller.updateFavourite(snapshot.data!.docs[index].id, data[index]['fav']),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height : 60,
                                          child: Hero(
                                            tag: data[index]['img'],
                                            child: Image.network("${data[index]['img']}"),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 15),
                                          child: Text("${data[index]['name']}",
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 15),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: const [
                                              Text("20 Min"),
                                              Text("⭐ 4.6"),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 15),
                                          child: Text("₹ ${data[index]['price']}"),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: GestureDetector(
                                            onTap: () => controller.addCart(context, snapshot.data!.docs[index].id, data[index]['cart']),
                                            child: Container(
                                              height: MySize.height * 0.046,
                                              width: MySize.width * 0.1,
                                              decoration: BoxDecoration(
                                                color: MyColor.themeColor,
                                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                                              ),
                                              child: Icon(CupertinoIcons.add, color: MyColor.white,),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              );
            }
        ),
      ),
    );
  }
}
