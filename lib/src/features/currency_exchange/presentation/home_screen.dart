import 'package:currnverter/src/common/modal_sheet.dart';
import 'package:currnverter/src/constants/colors.dart';
import 'package:currnverter/src/constants/sizing/gaps.dart';
import 'package:currnverter/src/features/currency_exchange/data/datasources/currency_codes.dart';
import 'package:currnverter/src/features/currency_exchange/data/repositories/conversion_repo.dart';
import 'package:currnverter/src/features/currency_exchange/domain/currency_model.dart';
import 'package:currnverter/src/features/currency_exchange/presentation/currency_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:onscreen_keyboard/onscreen_keyboard.dart';
import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../themes/theme_provider.dart';
import '../data/datasources/currency_rates.dart';
import '../data/repositories/currency_value_repo.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _virtualKeyboardController =
      TextEditingController();
  late Future<CurrencyConversionModel> _currencyDataFuture;
  Map<String, dynamic> conversion_rates = {};

  @override
  void initState() {
    super.initState();
    _updateCurrencyDataFuture();
  }

  void _updateCurrencyDataFuture() {
    final baseCurrency_ = ref.read(baseCurrency);
    setState(() {
      _currencyDataFuture = CurrencyConversionDataSource.fetchCurrencyData(
          baseCurrency: baseCurrency_["currency"]);
    });
  }

  void _updateConversionValue() {
    final targetCurrency_ = ref.read(targetCurrency);
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        ref.read(targetValue.notifier).state =
            conversion_rates[targetCurrency_["currency"]];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    final baseCurrency_ = ref.watch(baseCurrency);
    final targetCurrency_ = ref.watch(targetCurrency);
    var targetValue_ = ref.watch(targetValue);
    final enteredCurrency_ = ref.watch(enteredCurrency);
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 0.0, left: 10, right: 10, bottom: 10),
            child: SizedBox(
              width: double.maxFinite,
              height:
                  size.height < 601 ? size.height * 0.26 : size.height * 0.29,
              child: Stack(alignment: Alignment.center, children: [
                Positioned(
                    left: 0,
                    child: FutureBuilder<CurrencyConversionModel>(
                      future: _currencyDataFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return SizedBox(
                            height: size.height * 0.28,
                            width: size.width * 0.45,
                            child: Card(
                              color: Colors.white70,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        color: AppColors.primaryColors,
                                      )),
                                  verticalGaps(15.0),
                                  const Text("Fetching Currencies")
                                ],
                              ),
                            ),
                          );
                        } else if (!snapshot.hasData) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {});
                            },
                            child: SizedBox(
                              height: size.height * 0.28,
                              width: size.width * 0.45,
                              child: Card(
                                color: Colors.white70,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: Icon(Icons.currency_exchange)),
                                    verticalGaps(10.0),
                                    const Text("Please try again")
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          conversion_rates = snapshot.data!.conversionRates;
                          print(conversion_rates);
                          return CurrencySelector(
                            state: "From",
                            currency: baseCurrency_["currency"]!,
                            country: baseCurrency_["flag"]!,
                            selectCountry: () async {
                              _textController.clear();
                              _virtualKeyboardController.clear();
                              Map<String, String> currency = {};
                              currency = await CountryCodePicker.selectCountry(
                                  context);
                              ref.read(baseCurrency.notifier).state = {
                                "currency": currency["currency"]!,
                                "flag": currency["flag"]!
                              };
                              _updateCurrencyDataFuture();
                              _updateConversionValue();
                            },
                          );
                        }
                      },
                    )),
                Positioned(
                    right: 0,
                    child: CurrencySelector(
                      state: "To",
                      currency: targetCurrency_["currency"]!,
                      country: targetCurrency_["flag"]!,
                      selectCountry: () async {
                        Map<String, String> currency = {};
                        currency =
                            await CountryCodePicker.selectCountry(context);
                        ref.read(targetCurrency.notifier).state = {
                          "currency": currency["currency"]!,
                          "flag": currency["flag"]!
                        };
                        ref.read(targetValue.notifier).state =
                            conversion_rates["${currency["currency"]}"];
                      },
                    )),
                Container(
                  width: size.width * 0.17,
                  height: size.width * 0.17,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: isDarkMode ? Colors.black : Colors.white),
                  child: const Icon(
                    Icons.currency_exchange,
                    size: 30,
                  ),
                ),
              ]),
            ),
          ),
          SizedBox(
            width: size.width * 0.87,
            child: TextField(
              controller: _textController,
              readOnly: true,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              showCursor: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.all(10),
                filled: true,
                hintText: "Please enter amount",
                prefix: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Text(
                    baseCurrency_["flag"]!,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                suffix: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Text(
                    baseCurrency_["currency"]!,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
          size.height < 601 ? verticalGaps(2.0) : verticalGaps(7.0),
          SizedBox(
            width: size.width * 0.9,
            height: size.height * 0.14,
            child: Card(
                color: Colors.white70,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "1 ${baseCurrency_["currency"]}",
                          style: const TextStyle(
                            color: Colors.black87,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.currency_exchange,
                            size: 22,
                          ),
                        ),
                        Text(
                          "${targetValue_.toDouble().toStringAsFixed(2)} ${targetCurrency_["currency"]}",
                          style: const TextStyle(
                            color: Colors.black87,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          targetCurrency_["flag"]!,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        horizontalGaps(5.0),
                        Text(
                          enteredCurrency_,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                )),
          ),
          const Spacer(),
          Container(
            color: Colors.black12,
            child: VirtualKeyboard(
                height: size.height * 0.255,
                textColor: isDarkMode ? Colors.white : Colors.black87,
                textController: _virtualKeyboardController,
                defaultLayouts: const [
                  VirtualKeyboardDefaultLayouts.Arabic,
                  VirtualKeyboardDefaultLayouts.English
                ],
                type: VirtualKeyboardType.Numeric,
                onKeyPress: (VirtualKeyboardKey val) {
                  if (val.action == VirtualKeyboardKeyAction.Backspace) {
                    if (_textController.text.isNotEmpty) {
                      _textController.text = _textController.text
                          .substring(0, _textController.text.length - 1);
                    }
                  } else if (val.text != null) {
                    _textController.text += val.text!;
                  }

                  // Update the state with the current text
                  ref.read(enteredCurrency.notifier).state =
                      _textController.text;

                  // Parse the text to double, perform multiplication, and convert back to string
                  double enteredValue =
                      double.tryParse(_textController.text) ?? 0.0;
                  double convertedValue = enteredValue * targetValue_;
                  ref.read(enteredCurrency.notifier).state =
                      convertedValue.toStringAsFixed(2).toString();
                }),
          )
        ],
      ),
    );
  }
}
