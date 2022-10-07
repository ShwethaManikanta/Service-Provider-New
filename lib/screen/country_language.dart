import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:serviceprovider/common/common_styles.dart';
import 'package:serviceprovider/common/utils.dart';
import 'package:serviceprovider/screen/signin_screen.dart';
import 'package:serviceprovider/service/api_service.dart';
import 'package:serviceprovider/service/language_api_provider.dart';
import 'package:serviceprovider/service/translation_api_provider.dart';
import 'package:provider/provider.dart';

import '../model/language_model.dart';

class CountryLanguageScreen extends StatefulWidget {
  const CountryLanguageScreen({Key? key}) : super(key: key);

  @override
  _CountryLanguageScreenState createState() => _CountryLanguageScreenState();
}

class _CountryLanguageScreenState extends State<CountryLanguageScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(
        seconds: 5,
      ),
      vsync: this,
      value: 1,
    );
    /*_animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceOut,
    );*/

    _animation = Tween<double>(begin: 0.5, end: 1).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.bounceOut));
    _animationController.forward();
    showAnimations();
    // TODO: implement initState
    super.initState();
  }

  showAnimations() {
    Future.delayed(Duration(seconds: 5)).whenComplete(() {
      setState(() {
        showAnimation = true;
      });
    });
  }

  bool showAnimation = false;
  bool animate = true;

  final durationConst = const Duration(seconds: 1);
  final durationConstLong = const Duration(seconds: 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 50,
              child: AnimatedOpacity(
                opacity: showAnimation ? 1.0 : 0.0,
                duration: durationConstLong,
                child: SizedBox(
                    // height: deviceHeight(context),
                    width: deviceWidth(context),
                    height: MediaQuery.of(context).size.height,
                    child: Container(
                        padding: EdgeInsets.only(bottom: 50),
                        child: GetLanguage(
                          animate: animate,
                        ))),
              ),
            ),
            if (animate == true)
              AnimatedPositioned(
                duration: durationConst,
                height: showAnimation ? 200 : 250,
                width: showAnimation ? 300 : 250,
                top: showAnimation ? 10 : 200,
                child: Container(
                  decoration: const BoxDecoration(
                      //   color: Colors.black,
                      //  shape: BoxShape.circle,
                      ),
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "assets/images/logo2.png",
                            ))),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class GetLanguage extends StatefulWidget {
  bool animate;
  GetLanguage({Key? key, required this.animate}) : super(key: key);

  @override
  State<GetLanguage> createState() => _GetLanguageState();
}

class _GetLanguageState extends State<GetLanguage> {
  String lanKey = "en";

  List<Color> colorizeColors = [
    Colors.white54,
    Colors.white70,
    Colors.white,
    Colors.white70,
  ];

  List<Color> silverColors = [
    HexColor("#b8d3fe"),
    HexColor("#aecad6"),
    HexColor("#b8d3fe"),
    HexColor("#aecad6"),
  ];

  String countryName = "";
  String countryCode = "";

  List<String> continent = [
    "assets/africa1.png",
    "assets/Asia1.png",
    "assets/Australia.png",
    "assets/Europe1.png",
    "assets/north.png",
    "assets/south.png",
    "assets/antarctica.jpeg"
  ];
  List<String> countryEurope = [
    "assets/europe/Albania.png",
    "assets/europe/Andorra.png",
    "assets/europe/Austria.png",
    "assets/europe/Belarus.png",
    "assets/europe/Belgium.png",
    "assets/europe/Bosnia and Herzegovina.png",
    "assets/europe/Bulgaria.png",
    "assets/europe/Croatia.png",
    "assets/europe/Czechia (Czech Republic).png",
    "assets/europe/Denmark.png",
    "assets/europe/Estonia.png",
    "assets/europe/Finland.png",
    "assets/europe/France.png",
    "assets/europe/Germany.png",
    "assets/europe/Greece.png",
    "assets/europe/Holy See.png",
    "assets/europe/Hungary.png",
    "assets/europe/Iceland.png",
    "assets/europe/Ireland.png",
    "assets/europe/Italy.png",
    "assets/europe/Latvia.png",
    "assets/europe/Liechtenstein.png",
    "assets/europe/Lithuania.png",
    "assets/europe/Luxembourg.png",
    "assets/europe/Malta.png",
    "assets/europe/Moldova.png",
    "assets/europe/Monaco.png",
    "assets/europe/Montenegro.png",
    "assets/europe/Netherlands.png",
    "assets/europe/North Macedonia.png",
    "assets/europe/Norway.png",
    "assets/europe/Poland.png",
    "assets/europe/Portugal.png",
    "assets/europe/Romania.png",
    "assets/europe/Russia.png",
    "assets/europe/San Marino.png",
    "assets/europe/Serbia.png",
    "assets/europe/Slovakia.png",
    "assets/europe/Slovenia.png",
    "assets/europe/Spain.png",
    "assets/europe/Sweden.png",
    "assets/europe/Switzerland.png",
    "assets/europe/Ukraine.png",
    "assets/europe/United Kingdom.png",
  ];
  List<String> countryMap = [
    "assets/country_map/india1.png",
    "assets/country_map/CHINA.png",
    "assets/country_map/INDONESIA.png",
    "assets/country_map/JAPAN.png",
    "assets/country_map/SINGAPORE.png",
    "assets/country_map/THAILAND.png",
    "assets/country_map/1.png",
    "assets/country_map/2.png",
    "assets/country_map/3.png",
    "assets/country_map/4.png",
    "assets/country_map/5.png",
    "assets/country_map/Afghanistan.png",
    "assets/country_map/Armenia.png",
    "assets/country_map/Azerbaijan.png",
    "assets/country_map/Bahrain.png",
    "assets/country_map/Bangladesh.png",
    "assets/country_map/Bhutan.png",
    "assets/country_map/Brunei.png",
    "assets/country_map/Cambodia.png",
    "assets/country_map/Cyprus.png",
    "assets/country_map/Georgia.png",
    "assets/country_map/Iran.png",
    "assets/country_map/Iraq.png",
    "assets/country_map/Israel.png",
    "assets/country_map/Jordan.png",
    "assets/country_map/Kazakhstan.png",
    "assets/country_map/Kyrgyzstan.png",
    "assets/country_map/Laos.png",
    "assets/country_map/Lebanon.png",
    "assets/country_map/Malaysia.png",
    "assets/country_map/Maldives.png",
    "assets/country_map/Mongolia.png",
    "assets/country_map/Oman.png",
    "assets/country_map/Pakistan.png",
    "assets/country_map/Philippines.png",
    "assets/country_map/Qatar.png",
    "assets/country_map/Saudi Arabia.png",
    "assets/country_map/Sri Lanka.png",
    "assets/country_map/Tajikistan.png",
    "assets/country_map/Timor-Leste.png",
    "assets/country_map/Turkey.png",
    "assets/country_map/Turkmenistan.png",
    "assets/country_map/United Arab Emirates.png",
    "assets/country_map/Uzbekistan.png",
    "assets/country_map/Vietnam.png",
    "assets/country_map/Yemen.png",
  ];

  List<String> continentName = [
    "Africa",
    "Asia",
    "Austrialia",
    "Europe",
    "NorthAmerica",
    "SouthAmerica",
    "Antarctica",
  ];

  List<String> countryNameMap = [
    "India",
    "Singapore",
    "Japan",
    "Indonesia",
    "China",
    "Thailand",
  ];

  @override
  void initState() {
    if (context.read<LanguageAPIProvider>().languageModel == null) {
      context.read<LanguageAPIProvider>().getLanguageList();
      print("Language Key --------" + APIService.lanKey);
    }
    initialize();
    // TODO: implement initState
    super.initState();
  }

  initialize() {
    if (context.read<TranslationAPIProvider>().translationModel == null) {
      context.read<TranslationAPIProvider>().getTranslationList();
      print("Language Key --------" + APIService.lanKey);
    }
  }

  bool continentSelect = false;

  @override
  Widget build(BuildContext context) {
    final _languageAPIProvider = Provider.of<LanguageAPIProvider>(context);

    // List<LanguageList> indialist = [];
    // List<LanguageList?> data = [];
    // List<LanguageList?> nullableWidgets = [];
    // nullableWidgets.removeWhere((element) => element == '1');
    // final res = nullableWidgets
    //     .where((element) => element['country_name_id'] == '1')
    //     .toList();
    final translationAPIProvider = Provider.of<TranslationAPIProvider>(context);

    return Scaffold(
        backgroundColor: Colors.blue[800],
        /* bottomNavigationBar: translationAPIProvider.translationModel == null
            ? const SizedBox(
                height: 70,
                width: 100,
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 0.5,
                  ),
                ),
              )
            : SizedBox(
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: NeumorphicButton(
                    style: const NeumorphicStyle(
                        color: Colors.lightBlueAccent, intensity: 30),
                    onPressed: () {
                      if (countryCode.isNotEmpty) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignInScreen(
                                  countryCode: countryCode,
                                  lanKey: APIService.lanKey,
                                )));
                      } else {
                        Utils.showSnackBar(
                            context: context, text: "Choose Your Country");
                      }
                    },
                    padding: const EdgeInsets.all(15),
                    child: Center(
                      child: Text(
                          translationAPIProvider
                              .translationModel!.languageDetails![3],
                          style: CommonStyles.whiteText16BoldW500()),
                    ),
                  ),
                ),
              ),*/
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 150,
                ),
                translationAPIProvider.translationModel == null
                    ? const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 0.5,
                        ),
                      )
                    : Column(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                AnimatedTextKit(
                                  animatedTexts: [
                                    ColorizeAnimatedText(
                                        '${translationAPIProvider.translationModel!.languageDetails![80]}'
                                            .toUpperCase(),
                                        textStyle: CommonStyles.black57S18(),
                                        textAlign: TextAlign.right,
                                        colors: colorizeColors)
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: AnimatedTextKit(
                                      animatedTexts: [
                                        ColorizeAnimatedText(
                                            '${translationAPIProvider.translationModel!.languageDetails![78]}',
                                            textStyle: CommonStyles.green9(),
                                            textAlign: TextAlign.right,
                                            colors: colorizeColors)
                                      ],
                                    ),
                                  ),
                                ),
                                /* SizedBox(
                                  height: 50,
                                ),*/

                                /*   Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: Text(
                                      "The Day Wage Job Platform Across the World",
                                      style: CommonStyles.blue10(),
                                    ),
                                  ),
                                ),*/
                                SizedBox(
                                  height: 50,
                                ),
                                if (continentSelect == false)
                                  GestureDetector(
                                      onTap: () {
                                        widget.animate == true;
                                        print("Animate -------" +
                                            widget.animate.toString());
                                        print("Continent ------------ value" +
                                            continentSelect.toString());
                                        showDialog(
                                            barrierColor: Colors.blue[800],
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                contentPadding: EdgeInsets.zero,
                                                content: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.blue[800],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      1,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: Center(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8.0),
                                                      child: GridView.builder(
                                                          shrinkWrap: true,
                                                          itemCount:
                                                              continentName
                                                                  .length,
                                                          gridDelegate:
                                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                                  crossAxisSpacing:
                                                                      15,
                                                                  crossAxisCount:
                                                                      2,
                                                                  mainAxisSpacing:
                                                                      45,
                                                                  mainAxisExtent:
                                                                      180),
                                                          itemBuilder:
                                                              (context, index) {
                                                            return GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  //TODO:switch case
                                                                  // switch (
                                                                  //     index) {
                                                                  //   case 0:
                                                                  // }
                                                                  // continentSelect =
                                                                  // true;
                                                                  print("Continent ---------Change--- value" +
                                                                      continentSelect
                                                                          .toString());

                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();

                                                                  (index == 1)
                                                                      ? buildCountiesMap(
                                                                          context,
                                                                          index)
                                                                      : (index ==
                                                                              3)
                                                                          ? buildCountiesMap(
                                                                              context,
                                                                              index)
                                                                          : Utils.showSnackBar(
                                                                              context: context,
                                                                              text: "Will be update soon !!!");
                                                                });
                                                              },
                                                              child: Container(
                                                                height: 200,
                                                                width: 200,
                                                                //  color: Colors.black12,
                                                                decoration: const BoxDecoration(
                                                                    color: Colors
                                                                        .black12),
                                                                child: Stack(
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      child: Image
                                                                          .asset(
                                                                              continent[index]),
                                                                    ),
                                                                    /*  Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      child:
                                                                          Text(
                                                                        continentName[
                                                                            index],
                                                                        style: CommonStyles
                                                                            .white12(),
                                                                      ),
                                                                    ) */
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          }),
                                                    ),
                                                  ),
                                                ),
                                                backgroundColor: Colors.blue,
                                              );
                                            });
                                      },
                                      child: Image.asset(
                                        "assets/images/globe4.gif",
                                        height: 170,
                                      )),
                              ],
                            ),
                          ),

                          /*  AnimatedTextKit(
                            animatedTexts: [
                              ColorizeAnimatedText(
                                  'The Day wage Job Platform across the world',
                                  textStyle: CommonStyles.green9(),
                                  textAlign: TextAlign.right,
                                  colors: colorizeColors)
                            ],
                          ),*/

                          /*Align(
                            alignment: Alignment.centerRight,
                            child: AnimatedTextKit(
                              animatedTexts: [
                                ColorizeAnimatedText(
                                    'Created by  -   Joythi Girigowda    ',
                                    textStyle: CommonStyles.blue13(),
                                    //  textAlign: TextAlign.right,
                                    colors: colorizeColors)
                              ],
                            ),
                          ),*/
                          /* SizedBox(
                            height: 10,
                          ),*/
                          /*  Align(
                            alignment: Alignment.centerRight,
                            child: AnimatedTextKit(
                              animatedTexts: [
                                ColorizeAnimatedText(
                                    'Shiva Mani                 ',
                                    textStyle: CommonStyles.blue13(),
                                    //  textAlign: TextAlign.right,
                                    colors: colorizeColors)
                              ],
                            ),
                          ),*/
                          /* const SizedBox(
                            height: 30,
                          ),*/

                          if (continentSelect == false)
                            Container(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 80,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: AnimatedTextKit(
                                      animatedTexts: [
                                        ColorizeAnimatedText(
                                            'Shiva Kayakave Kailasa',
                                            textStyle: CommonStyles.grey15(),
                                            //  textAlign: TextAlign.right,
                                            colors: silverColors)
                                      ],
                                    ),
                                  ),

                                  /* Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Created by : - ",
                                        style: CommonStyles.grey15(),
                                      )),*/
                                  // SizedBox(
                                  //   height: 10,
                                  // ),
                                  // Align(
                                  //   alignment: Alignment.center,
                                  //   child: AnimatedTextKit(
                                  //     animatedTexts: [
                                  //       ColorizeAnimatedText('Jyothi Girigowda',
                                  //           textStyle:
                                  //               CommonStyles.black10thin(),
                                  //           //  textAlign: TextAlign.right,
                                  //           colors: silverColors)
                                  //     ],
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   height: 10,
                                  // ),
                                  // Align(
                                  //     alignment: Alignment.center,
                                  //     child: AnimatedTextKit(
                                  //       animatedTexts: [
                                  //         ColorizeAnimatedText('ShivaMani',
                                  //             textStyle:
                                  //                 CommonStyles.black10thin(),
                                  //             //  textAlign: TextAlign.right,
                                  //             colors: silverColors)
                                  //       ],
                                  //     )),
                                  // SizedBox(
                                  //   height: 10,
                                  // ),
                                  /* Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "Developed by -                                    ",
                                        style: CommonStyles.black13(),
                                      )),
                                  SizedBox(
                                    height: 5,
                                  ),*/
                                  // Align(
                                  //     alignment: Alignment.center,
                                  //     child: AnimatedTextKit(
                                  //       animatedTexts: [
                                  //         ColorizeAnimatedText(
                                  //             'Madvistara PVT.LTD',
                                  //             textStyle:
                                  //                 CommonStyles.black10thin(),
                                  //             //  textAlign: TextAlign.right,
                                  //             colors: silverColors)
                                  //       ],
                                  //     )),
                                ],
                              ),
                            ),
                          if (continentSelect == true)
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 1,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            countryName.isEmpty
                                                ? "${translationAPIProvider.translationModel!.languageDetails![81]}   :   +  91  India"
                                                : countryName,
                                            style: CommonStyles.blue13(),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            CountryLanguageScreen()));
                                              });
                                            },
                                            child: const Icon(
                                              CupertinoIcons.globe,
                                              size: 20,
                                              color: Colors.blue,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          Utils.getSizedBox(height: 30),
                          if (continentSelect == true)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AnimatedTextKit(
                                  animatedTexts: [
                                    ColorizeAnimatedText(
                                        translationAPIProvider.translationModel!
                                            .languageDetails![2],
                                        textStyle: CommonStyles.black13(),
                                        //  textAlign: TextAlign.right,
                                        colors: silverColors)
                                  ],
                                ),

                                /*  Text(
                                  translationAPIProvider
                                      .translationModel!.languageDetails![2],
                                  style: CommonStyles.black13(),
                                ),*/
                                const SizedBox(
                                  height: 20,
                                ),
                                //    GetLanguage()
                              ],
                            ),
                        ],
                      ),

                //////

                if (continentSelect == true)
                  Container(
                    child: _languageAPIProvider.ifLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 1,
                            ),
                          )
                        : GridView.builder(
                            //      delay: Duration(milliseconds: 10),
                            //    showItemDuration: Duration(milliseconds: 10),
                            reverse: true,
                            //   clipBehavior: Clip.antiAlias,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(0),
                            primary: false,
                            // itemCount: data.length,
                            // itemCount: 10,
                            // itemCount: _languageAPIProvider
                            //     .languageModel!.languageList!.length,
                            itemCount: _languageAPIProvider.list2.length,
                            // itemCount: list1.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 15,
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 20,
                                    mainAxisExtent: 70),
                            itemBuilder: (context, index) {
                              print(
                                  'dee${_languageAPIProvider.languageModel!.languageList!.where((element) => element.country_name_id == '1').length}');
                              // var r = _languageAPIProvider
                              //     .languageModel!.languageList!
                              //     .indexWhere((element) =>
                              //         element.country_name_id == '1');
                              // if (_languageAPIProvider
                              //         .languageModel!
                              //         .languageList![index]
                              //         .country_name_id! ==
                              //     '1') {
                              return buildNeumorphicButton(
                                  _languageAPIProvider, index, context);

                              // }
                            },
                          ),
                  ),
                const SizedBox(
                  height: 30,
                ),

                /*  HtmlWidget(
                  "${htmlWidget}",
                  webView: true,
                ),*/

                if (continentSelect == true)
                  Column(
                    children: [
                      SizedBox(
                        height: 70,
                        child: InkWell(
                          onTap: () {
                            print(
                                'langdetails${translationAPIProvider.translationModel!.languageDetails![3]}');
                            if (countryCode.isEmpty) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignInScreen(
                                        countryCode: countryCode,
                                        lanKey: APIService.lanKey,
                                      )));
                            } else {
                              Utils.showSnackBar(
                                  context: context,
                                  text: "Choose Your Country");
                            }
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0.0),
                              child: Center(
                                child: Text(
                                    translationAPIProvider
                                        .translationModel!.languageDetails![3],
                                    style: CommonStyles.blue18900()),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                        child: InkWell(
                          onTap: () {
                            print(
                                'langdetails${translationAPIProvider.translationModel!.languageDetails![3]}');
                            if (countryCode.isEmpty) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignInScreen(
                                        countryCode: countryCode,
                                        lanKey: APIService.lanKey,
                                      )));
                            } else {
                              Utils.showSnackBar(
                                  context: context,
                                  text: "Choose Your Country");
                            }
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0.0),
                              child: Center(
                                child: Text(
                                    translationAPIProvider
                                        .translationModel!.languageDetails![3],
                                    style: CommonStyles.blue18900()),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
              ],
            ),
          ),
        ));
  }

  Future<dynamic> buildCountiesMap(BuildContext context, int indexw) {
    return showDialog(
        barrierColor: Colors.blue[800],
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: EdgeInsets.zero,
            content: Container(
              decoration: BoxDecoration(
                  color: Colors.blue[800],
                  borderRadius: BorderRadius.circular(8)),
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Neumorphic(
                    style: NeumorphicStyle(depth: 0, color: Colors.blue[800]),
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: (indexw == 1)
                            ? countryMap.length
                            : countryEurope.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 15,
                                crossAxisCount: 2,
                                mainAxisSpacing: 20,
                                mainAxisExtent: 200),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              // print(
                              //     "lenght${countryEurope.length}${countryMap.length}");
                              setState(() {
                                if (index == 0) continentSelect = true;
                                print("Continent ---------Change--- value" +
                                    continentSelect.toString());
                                index == 0
                                    ? Navigator.of(context).pop()
                                    : Utils.showSnackBar(
                                        context: context,
                                        text: "Will be update soon !!!");
                              });
                            },
                            child: Container(
                              height: 200,
                              width: 200,
                              //  color: Colors.black12,
                              decoration:
                                  BoxDecoration(color: Colors.blue[800]),
                              child: Stack(
                                children: [
                                  Align(
                                      alignment: Alignment.center,
                                      child: indexw == 1
                                          ? Image.asset(countryMap[index])
                                          : Image.asset(countryEurope[index])),
                                  /* Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      countryNameMap[index],
                                      style: CommonStyles.blue13(),
                                    ),
                                  )*/
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ),
            ),
            backgroundColor: Colors.blue[800],
          );
        });
  }

  Widget buildNeumorphicButton(LanguageAPIProvider _languageAPIProvider,
      int index, BuildContext context) {
    // final translationAPIProvider = Provider.of<TranslationAPIProvider>(context);
    return Center(
      child: InkWell(
        onTap: () {
          setState(() async {
            lanKey = _languageAPIProvider.list2[index].languageKey!;
            APIService.lanKey = "${lanKey}";
            print("Language Key - From Change------" + lanKey);

            print("Api LanKey ----------" + APIService.lanKey);
            await context.read<TranslationAPIProvider>().getTranslationList();
          });
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: SizedBox(
            width: 150,
            height: 50,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child:
                    // (_languageAPIProvider.languageModel!
                    //           .languageList![index].country_name_id! ==
                    //       '1')
                    //   ?
                    Text(
                  // '',
                  _languageAPIProvider.list2[index].language!,
                  // _languageAPIProvider
                  //                 .languageModel!.languageList!
                  //                 .where(
                  //                     (element) => element.country_name_id == '1').,
                  //changed to 1 from index
                  style: CommonStyles.blue13(),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
