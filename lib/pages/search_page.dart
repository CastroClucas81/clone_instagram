import 'package:clone_instagram/constant/search_json.dart';
import 'package:clone_instagram/theme/colors.dart';
import 'package:clone_instagram/widgets/search_category.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  getBody() {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          //button
          SafeArea(
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: size.width - 30,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: textFieldBackground),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: white.withOpacity(0.3),
                      ),
                    ),
                    style: TextStyle(color: white.withOpacity(0.3)),
                    cursorColor: white.withOpacity(0.5),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          //filters buttons
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                  children: List.generate(
                searchCategories.length,
                (index) {
                  return CategoryStoryItem(name: searchCategories[index]);
                },
              )),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Wrap(
            spacing: 1,
            runSpacing: 1,
            children: List.generate(searchImages.length, (index) {
              return Container(
                width: (size.width-3)/3,
                height: (size.width-3)/3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(searchImages[index]),
                        fit: BoxFit.cover)),
              );
            }),
          )
        ],
      ),
    );
  }
}
