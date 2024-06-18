

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ConnectionShimmerLoader extends StatelessWidget {
  const ConnectionShimmerLoader({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SizedBox(
      // width: 200.0,
      // height: 100.0,
      child: ListView.builder(
          itemCount: 8,
          itemBuilder: (_, index) {
            return SizedBox(
              child: Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.grey,
                child: Card(
                  color: Colors.black12,
                  elevation: 0,
                  child: ListTile(
                    leading: SizedBox(
                      height: 45,
                      width: 45,
                      child: Card(
                          elevation: 5,
                          color: Colors.white70,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(50)),
                          child: Container(
                            alignment: Alignment.center,
                            child: Shimmer.fromColors(
                                baseColor: Colors.grey,
                                highlightColor: Colors.grey,
                                child: const Text(
                                  "",
                                )),
                          )),
                    ),
                    title: const Text("Loading"),
                    subtitle: const Text("loading"),
                    trailing: SizedBox(
                      height: 47,
                      width: 47,
                      child: Card(
                          color: Colors.white70,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(50)),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "",
                              textAlign: TextAlign.center,
                              style: textTheme.bodyMedium,
                            ),
                          )),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
