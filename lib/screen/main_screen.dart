import 'package:flutter/material.dart';
import 'package:sunnah_app/model/ustads_sunnah.dart';

import 'detail_screen.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("I Love Sunnah 👍🏻",
          style: TextStyle(
              fontSize: 23),),
          toolbarHeight: 70,
          backgroundColor: Colors.green
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= 600) {
            return UstadzSunnahList();
          } else if (constraints.maxWidth <= 1200) {
            return UstadzSunnahGrid(gridCount: 4);
          } else {
            return UstadzSunnahGrid(gridCount: 6);
          }
        },
      ),
    );
  }
}

class UstadzSunnahList extends StatelessWidget {
  const UstadzSunnahList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final UstadzSunnah value = ustadzSunnahList[index];
        return InkWell(
          onTap: () {
            // navigate to DetailScreen with MaterialPageRoute
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(value: value);
            }));
          },
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(value.imageAsset),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          value.name,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(value.location)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: ustadzSunnahList.length,
    );
  }
}

class UstadzSunnahGrid extends StatelessWidget {
  final int gridCount;

  const UstadzSunnahGrid({Key? key, required this.gridCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: GridView.count(
          crossAxisCount: gridCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: ustadzSunnahList.map((value) {
            return InkWell(
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.asset(
                        value.imageAsset,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        value.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 8),
                      child: Text(
                        value.location,
                      ),
                    )
                  ],
                ),
              ),
              onTap: () {
                // navigate to DetailScreen with MaterialPageRoute
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailScreen(value: value);
                }));
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
