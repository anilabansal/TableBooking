import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class GridShimmerCard extends StatelessWidget {
  const GridShimmerCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int offset = 0;
    int time = 1000;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        // crossAxisCount: 2,
        shrinkWrap: true,
        mainAxisSpacing: 17,
        crossAxisSpacing: 17,
        //  physics: const NeverScrollableScrollPhysics(),
        itemCount: 8,
        itemBuilder: (context, index) {
          offset += 5;
          time = 800 + offset;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Shimmer.fromColors(
              highlightColor: Colors.white,
              baseColor: Colors.grey.shade300,
              // child: const ShimmerLayout(),
              child: Container(
                width: 159,
                height: 159,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[300],
                ),
              ),
              period: Duration(milliseconds: time),
            ),
          );
        },
        staggeredTileBuilder: (int index) =>
            StaggeredTile.count(2, index.isEven ? 2 : 2.5),
      ),
    );
  }
}

class AboutShimmer extends StatelessWidget {
  const AboutShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int offset = 0;
    int time = 1000;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          offset += 5;
          time = 800 + offset;
          //print(time);
          return Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: Colors.grey.shade300,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 10,
                    width: MediaQuery.of(context).size.width * 0.8,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 10,
                    width: 200,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 10,
                    width: 100,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(height: 30,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 10,
                            width: 100,
                            color: Colors.grey[300],
                          ),
                          const SizedBox(height: 15,),
                          Container(
                            height: 10,
                            width: 100,
                            color: Colors.grey[300],
                          ),
                          const SizedBox(height: 15,),
                          Container(
                            height: 10,
                            width: 100,
                            color: Colors.grey[300],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 10,
                            width: 100,
                            color: Colors.grey[300],
                          ),
                          const SizedBox(height: 15,),
                          Container(
                            height: 10,
                            width: 100,
                            color: Colors.grey[300],
                          ),
                          const SizedBox(height: 15,),
                          Container(
                            height: 10,
                            width: 100,
                            color: Colors.grey[300],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30,),
                  Container(
                    height: 10,
                    width: MediaQuery.of(context).size.width * 0.8,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 10,
                    width: 200,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 10,
                    width: 100,
                    color: Colors.grey[300],
                  ),

                ],
              ),
            ),
            period: Duration(milliseconds: time),
          );
        },
      ),
    );
  }
}
