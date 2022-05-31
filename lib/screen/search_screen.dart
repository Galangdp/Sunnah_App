import 'package:flutter/material.dart';import '../model/ustads_sunnah.dart';import 'detail_screen.dart';class SearchScreen extends StatefulWidget {  const SearchScreen({Key? key}) : super(key: key);  @override  State<SearchScreen> createState() => _SearchScreenState();}class _SearchScreenState extends State<SearchScreen> {  // var list = <UstadzSunnah>[];  TextEditingController? _textEditingController = TextEditingController();  List<String> ustadzListOnSearch = [];  List<String> ustadzListText = [    'Ustadz Khalid Basalamah',    'Ustadz Syafiq Riza',    'Ustadz Firanda Andirja',    'Ustadz Badrusalam',    'Ustadz Yazid',    'Ustadz Muhammad Nuzul Dzikri, Lc',    'DR. Zakir Abdul Karim Naik',    'Ustadz Subhan Bawazier',    'Ustadz Abdullah Zaen',    'Ustadz Muhammad Arifin'  ];  @override  Widget build(BuildContext context) {    return Scaffold(      appBar: AppBar(        toolbarHeight: 70,        backgroundColor: Colors.green,        title: Container(          decoration: BoxDecoration(color: Colors.white,          borderRadius: BorderRadius.circular(30),),          child: TextField(            onChanged: (value){              setState(() {                ustadzListOnSearch = ustadzListText.where((element) => element.toLowerCase().contains(value.toLowerCase())).toList();              });            },            controller: _textEditingController,            decoration: InputDecoration(              border: InputBorder.none,              errorBorder: InputBorder.none,              enabledBorder: InputBorder.none,              focusedBorder: InputBorder.none,              contentPadding: EdgeInsets.all(15),              hintText: 'Search'),          ),        ),      ),      body: _textEditingController!.text.isNotEmpty&&ustadzListOnSearch.isEmpty          ? Center(          child: Column(        mainAxisAlignment: MainAxisAlignment.center,            children: [              Icon(Icons.search_off, size: 100, color: Color(0xffDAE5D0),),              Text('No Result Found',                  style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),              ),            ],          ))          : ListView.builder(        itemCount: _textEditingController!.text.isNotEmpty  ? ustadzListOnSearch.length : ustadzListText.length,        itemBuilder: (context, index) {          final UstadzSunnah value = ustadzSunnahList[index];          return InkWell(              onTap: () {            // navigate to DetailScreen with MaterialPageRoute            Navigator.push(context, MaterialPageRoute(builder: (context) {              return DetailScreen(value: value);            }));          },          child: Padding(            padding: const EdgeInsets.all(4.0),            child: Row(              crossAxisAlignment: CrossAxisAlignment.start,              children: [                Expanded(                  flex: 1,                  child: Image.asset(value.imageAsset),                ),                Expanded(                  flex: 2,                  child: Padding(                    padding: const EdgeInsets.all(8),                    child: Column(                      crossAxisAlignment: CrossAxisAlignment.start,                      mainAxisSize: MainAxisSize.min,                      // ignore: prefer_const_literals_to_create_immutables                      children: [                        Text(                          _textEditingController!.text.isNotEmpty  ? ustadzListOnSearch [index]: ustadzListText[index],                          style: const TextStyle(fontSize: 16),                        ),                        const SizedBox(                          height: 10,                        ),                        Text(value.location)                      ],                    ),                  ),                ),              ],            ),          ),);      },      ),    );  }}