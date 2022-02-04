import 'package:flutter/material.dart';
import 'package:intropage/utils/Strings.dart';

import 'home_page.dart';
class IntroPage extends StatefulWidget {
static final String id = 'intro_page';
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late PageController _pageController;
int _currentIndex = 0;

@override
  void initState() {
    // TODO: implement initState
  _pageController = PageController(
    initialPage: 0,
  );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
            PageView(
              controller: _pageController,
              onPageChanged: (int page){
                setState(() {
                    _currentIndex = page;
                });
              },
              children: [
                makePage(
                  image: 'assets/images/image_1.png',
                  title: Strings.stepOneTitle,
                  content: Strings.stepOneContent,
                ),

                makePage(
                  image: 'assets/images/image_2.png',
                  title: Strings.stepTwoTitle,
                  content: Strings.stepTwoContent,
                ),

                makePage(
                  image: 'assets/images/image_3.png',
                  title: Strings.stepThreeTitle,
                  content: Strings.stepThreeContent,
                ),
              ],
            ),
          Container(
            margin: EdgeInsets.only(bottom: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  child: _currentIndex == 2 ? GestureDetector(
                    onTap: (){Navigator.pushReplacementNamed(context, HomePage.id);
                    },
                    child:  Padding(
                      padding: EdgeInsets.only(right: 20, left: 20),
                      child: Text('Skip', style: TextStyle(color: Colors.deepOrange, fontSize: 18),),
                    ),

                  ) : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget makePage( {image, title, content}){
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(color: Colors.deepOrange, fontSize: 30)),
          SizedBox(height: 20),
          Text(content,style: TextStyle(color: Colors.grey, fontSize: 20), textAlign: TextAlign.center,),
          SizedBox(height: 20),
          Padding(padding: EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(image),
          ),
        ],
      ),
    );
  }
  Widget _indicator(bool isActive){
        return AnimatedContainer(duration: Duration(milliseconds: 300),
        height: 6,
          width: isActive ? 30 : 6,
          margin: EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
          color: Colors.deepOrange,
            borderRadius: BorderRadius.circular(5),
         ),
        );
      }
  List<Widget> _buildIndicator(){
    List<Widget> _indicators = [];
    for(int i = 0; i <3; i++){
      if(_currentIndex == i){
        _indicators.add(_indicator(true));
      }else{
        _indicators.add(_indicator(false));
      }
    }
    return _indicators;
  }

}
