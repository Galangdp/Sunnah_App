import 'package:flutter/material.dart';

import '../model/ustads_sunnah.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');

class DetailScreen extends StatelessWidget {
  final UstadzSunnah value;

  const DetailScreen({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return DetailWebPage(value: value);
        } else {
          return DetailMobilePage(value: value);
        }
      },
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}

class DetailWebPage extends StatefulWidget {
  final UstadzSunnah value;
  DetailWebPage({required this.value});

  @override
  State<DetailWebPage> createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 64,
          vertical: 16,
        ),
        child: Center(
          child: Container(
            width: 1200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Wisata Bandung',
                  style: TextStyle(fontFamily: 'Staatliches', fontSize: 32),
                ),
                SizedBox(height: 32),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ClipRRect(
                            child: Image.asset(widget.value.imageAsset),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          SizedBox(height: 16),
                          Scrollbar(
                            controller: _scrollController,
                            isAlwaysShown: true,
                            child: Container(
                              height: 150,
                              padding: EdgeInsets.only(bottom: 16),
                              child: ListView(
                                controller: _scrollController,
                                scrollDirection: Axis.horizontal,
                                children: widget.value.imageUrls.map((url) {
                                  return Padding(
                                    padding: EdgeInsets.all(4),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(url),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 32),
                    Expanded(
                      child: Card(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                child: Text(
                                  widget.value.name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 30, fontFamily: 'Staatliches'),
                                ),
                              ),
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Row(
                              //       children: [
                              //         Icon(Icons.calendar_today),
                              //         SizedBox(width: 8),
                              //         Text(
                              //           widget.value.openDays,
                              //           style: informationTextStyle,
                              //         ),
                              //       ],
                              //     ),
                              //     FavoriteButton()
                              //   ],
                              // ),
                              // Row(
                              //   children: [
                              //     Icon(Icons.access_time),
                              //     SizedBox(width: 8),
                              //     Text(
                              //       widget.value.openTime,
                              //       style: informationTextStyle,
                              //     )
                              //   ],
                              // ),
                              // SizedBox(width: 8),
                              // Row(
                              //   children: [
                              //     Icon(Icons.monetization_on),
                              //     SizedBox(width: 8),
                              //     Text(
                              //       widget.value.ticketPrice,
                              //       style: informationTextStyle,
                              //     )
                              //   ],
                              // ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: Text(
                                  widget.value.description,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 16, fontFamily: 'Oxygen'),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class DetailMobilePage extends StatelessWidget {
  final UstadzSunnah value;
  DetailMobilePage({required this.value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Image.asset(value.imageAsset),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const FavoriteButton()
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Text(
                value.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Staatliches',
                  fontSize: 30.0,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // children: [
                //   Column(
                //     // ignore: prefer_const_literals_to_create_immutables
                //     children: [
                //       const Icon(Icons.calendar_today),
                //       const SizedBox(height: 8.0),
                //       Text(
                //         value.openDays,
                //         style: informationTextStyle,
                //       )
                //     ],
                //   ),
                //   Column(
                //     // ignore: prefer_const_literals_to_create_immutables
                //     children: [
                //       const Icon(Icons.access_time),
                //       const SizedBox(height: 8.0),
                //       Text(
                //         value.openTime,
                //         style: informationTextStyle,
                //       )
                //     ],
                //   ),
                //   Column(
                //     // ignore: prefer_const_literals_to_create_immutables
                //     children: [
                //       const Icon(Icons.monetization_on),
                //       const SizedBox(height: 8.0),
                //       Text(
                //         value.ticketPrice,
                //         style: informationTextStyle,
                //       )
                //     ],
                //   ),
                // ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                value.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Oxygen',
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: value.imageUrls.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      child: Image.network(url),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
