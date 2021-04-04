import 'package:flutter/material.dart';

import '../../style.dart';

const _cordCardRadius = 20.0;

class HomeCordCard extends StatelessWidget {
  const HomeCordCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(paddingDefault),
      child: SizedBox(
        height: 120,
        width: MediaQuery.of(context).size.width,
        //Beware: Incredible workaround for adding shadow around the card.
        //You need to put a container under your ClipRRect via stack that
        //receives the shadow, but you also need to wrap the content
        // of the ClipRRect with a container with white background, so that
        // the shadow of your underlying container doesn't shine through.
        child: Stack(children: [
          // Dummy container for shadow
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(_cordCardRadius),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(2, 2),
                    blurRadius: 10.0),
              ],
            ),
          ),
          // The actual card body
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(_cordCardRadius)),
            child: Container(
              color: Colors.white,
              child: Row(
                children: [
                  CordCardImage(),
                  Expanded(
                    flex: 2,
                    child: TextDataContainer(),
                  ),
                  buildRatingBox()
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  SizedBox buildRatingBox() {
    return SizedBox(
      width: 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.keyboard_arrow_up),
            onPressed: () {},
          ),
          Text(
            "32",
            textAlign: TextAlign.left,
          ),
          IconButton(
            icon: Icon(Icons.keyboard_arrow_down),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class CordCardImage extends StatelessWidget {
  const CordCardImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(_cordCardRadius),
                bottomRight: Radius.circular(_cordCardRadius)),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.lightBlueAccent,
                  Colors.blue,
                ])),
        child: Center(
            child: IconButton(
          icon: Icon(
            Icons.play_circle_outline,
            color: Colors.white,
          ),
          iconSize: 50,
          onPressed: () {},
        )),
      ),
    );
  }
}

class TextDataContainer extends StatelessWidget {
  const TextDataContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 6.0, right: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_buildTitleRow(context), _buildBottomRow(context)],
      ),
    );
  }

  Expanded _buildTitleRow(BuildContext context) {
    return Expanded(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text:
                    "Was war die größte Katastrophe, die je auf deiner Arbeit passiert ist?"),
            TextSpan(text: "\n"),
            TextSpan(
                text: "von patDog", style: Theme.of(context).textTheme.caption)
          ],
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }

  RichText _buildBottomRow(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(text: "84", style: Theme.of(context).textTheme.caption),
      WidgetSpan(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2),
      )),
      WidgetSpan(child: Image.asset('asset/images/button-16px.png'))
    ]));
  }
}
