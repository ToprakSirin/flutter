import 'package:flutter/material.dart';

class GridViewOrnek extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    border: Border(
                      top: new BorderSide(
                          color: Colors.green,
                          width: 5,
                          style: BorderStyle.solid),
                    ),
                    boxShadow: [
                      new BoxShadow(
                          color: Colors.red,
                          offset: new Offset(10, 10),
                          blurRadius: 20),
                    ],
                    shape: BoxShape.circle,
                    // borderRadius: new BorderRadius.all(new Radius.circular(20)),
                    /*  border: Border.all(
                      color: Colors.blue, width: 5, style: BorderStyle.solid), */
                    color: Colors.blue[100 * ((index + 1) % 8)],
                    gradient: LinearGradient(
                        colors: [Colors.purple, Colors.teal],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                    image: DecorationImage(
                        image: AssetImage("assets/image/logo1.png"),
                        fit: BoxFit.contain,
                        alignment: Alignment.topCenter)),
                margin: EdgeInsets.all(20),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Merhaba flutter $index ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                )),
            onTap: () => debugPrint("Merhaba flutter $index tıklanıldı"),
            onDoubleTap: () =>
                debugPrint("Merhaba flutter $index çift tıklanıldı"),
            onLongPress: () =>
                debugPrint("Merhaba flutter $index uzun basıldı"),
            onHorizontalDragStart: (e) =>
                debugPrint("Merhaba flutter $index tıklanıldı $e"),
          );
        });
  }
}

/*

   return GridView.count(
      crossAxisCount: 2,
      scrollDirection: Axis.vertical,
      primary: false,
      reverse: true,
      padding: EdgeInsets.all(10),
      crossAxisSpacing: 20,
      mainAxisSpacing: 40,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba flutter 1",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba flutter 2",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba flutter 3",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba flutter 4",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba flutter 5",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba flutter 6",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ); 
 
 */

/*
 return GridView.extent(
      maxCrossAxisExtent: 400,
      scrollDirection: Axis.vertical,
      primary: false,
      padding: EdgeInsets.all(10),
      crossAxisSpacing: 20,
      mainAxisSpacing: 40,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba flutter 1",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba flutter 2",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba flutter 3",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba flutter 4",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba flutter 5",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba flutter 6",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

*/
