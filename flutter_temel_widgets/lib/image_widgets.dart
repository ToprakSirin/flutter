import 'package:flutter/material.dart';

class ImageOrnekleri extends StatelessWidget {
  const ImageOrnekleri({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _logo =
        'https://yt3.ggpht.com/a/AATXAJzrMeEB8YSHw_d31Fv7u6xc1Sgx9ta_mYchUKgXuw=s176-c-k-c0x00ffffff-no-rj-mo';
    String _imgURL = 'http://www.yenislayt.com/upload/cf028b2da7.png';
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                      color: Colors.red.shade300,
                      child: Image.asset(
                        'assets/image/car.jpg',
                        fit: BoxFit.cover,
                      )),
                ),
                Expanded(
                  child: Container(
                      color: Colors.red.shade300,
                      child: Image.network(
                        _imgURL,
                        fit: BoxFit.contain,
                      )),
                ),
                Expanded(
                  child: Container(
                      color: Colors.red.shade300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          /* child: Text(
                        'E',
                        style: Theme.of(context).textTheme.headline1,
                    ), */
                          backgroundImage: NetworkImage(_logo),
                          backgroundColor: Colors.amber,
                          foregroundColor: Colors.red,
                        ),
                      )),
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            child: FadeInImage.assetNetwork(
                fit: BoxFit.cover,
                placeholder: 'assets/image/loading.png',
                image: _imgURL),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Placeholder(
              color: Colors.green,
            ),
          )),
        ],
      ),
    );
  }
}
