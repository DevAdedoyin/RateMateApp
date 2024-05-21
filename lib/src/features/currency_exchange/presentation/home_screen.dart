import 'package:currnverter/src/constants/colors.dart';
import 'package:currnverter/src/constants/sizing/gaps.dart';
import 'package:currnverter/src/features/currency_exchange/presentation/currency_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onscreen_keyboard/onscreen_keyboard.dart';
import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 0.0, left: 10, right: 10, bottom: 10),
            child: SizedBox(
              width: double.maxFinite,
              height: size.height * 0.29,
              child: Stack(alignment: Alignment.center, children: [
                const Positioned(
                    left: 0,
                    child: CurrencySelector(
                      state: "From",
                      currency: "EUR",
                      country: "Euro",
                    )),
                const Positioned(
                    right: 0,
                    child: CurrencySelector(
                      state: "To",
                      currency: "USD",
                      country: "US Dollar",
                    )),
                Container(
                  width: size.width * 0.17,
                  height: size.width * 0.17,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white),
                  child: const Icon(
                    Icons.currency_exchange,
                    size: 30,
                  ),
                ),
              ]),
            ),
          ),
          SizedBox(
            width: size.width * 0.9,
            child: TextField(
              // enabled: false,
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.all(10),
                filled: true,
                hintText: "Please enter amount",
                // label: Text("Currency"),
              ),
            ),
          ),
          verticalGaps(10.0),
          SizedBox(
            width: size.width * 0.9,
            height: size.height * 0.14,
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
                // elevation: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "1 EUR",
                          style: TextStyle(
                            color: Colors.black45,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Text(
                          "100",
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                          ),
                        )
                      ],
                    ),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: const Icon(
                        Icons.currency_exchange,
                        size: 20,
                      ),
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "0.87657 USD",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "1000400",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                )),
          ),
          Spacer(),
          Container(
            color: Colors.black12,
            child: VirtualKeyboard(
                height: size.height * 0.255,
                //width: 500,
                textColor: Colors.black87,
                textController: _textController,
                //customLayoutKeys: _customLayoutKeys,
                defaultLayouts: const [
                  VirtualKeyboardDefaultLayouts.Arabic,
                  VirtualKeyboardDefaultLayouts.English
                ],
                //reverseLayout :true,
                type: VirtualKeyboardType.Numeric,
                onKeyPress: (val) {}),
          )
          // Expanded(
          //   child: OnscreenKeyboard(
          //     value: 'atha',
          //     backgroundColor: Colors.blue,
          //     buttonColor: Colors.amber,
          //     focusColor: Colors.red,
          //     onChanged: (txt) {},
          //     initialCase: InitialCase.NUMERIC,
          //   ),
          // ),
        ],
      ),
    );
  }
}
