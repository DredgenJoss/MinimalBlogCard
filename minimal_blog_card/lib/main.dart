import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minimal Blog Card',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: 'Minimal Blog Card',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAF9),
        title: Text(widget.title),
      ),
      body: const CardWidget(),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);
  final Color textColor = const Color(0xFF6C727F);

  @override
  Widget build(BuildContext context) {
    double screenRatio = 2;

    if (MediaQuery.of(context).size.width <= 410) {
      screenRatio = ((MediaQuery.of(context).size.width /
              MediaQuery.of(context).size.height)) *
          3.8;
    }

    return Center(
      child: Expanded(
        flex: 1,
        child: ResponsiveContainerWidget(
          height: 187.5 * screenRatio,
          width: 184 * screenRatio,
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.all(
              Radius.circular(5 * screenRatio),
            ),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(17, 23, 41, 0.05),
                offset: Offset(0, 30),
                blurRadius: 100,
              ),
            ],
          ),
          widget: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              ResponsiveContainerWidget(
                height: 75 * screenRatio,
                margin: EdgeInsets.symmetric(
                  vertical: 8 * screenRatio,
                  horizontal: 8 * screenRatio,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5 * screenRatio),
                  ),
                  image: const DecorationImage(
                    image: AssetImage('assets/cactus_img.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Tag
              ResponsiveContainerWidget(
                width: 30 * screenRatio,
                height: 12.5 * screenRatio,
                margin: EdgeInsets.symmetric(
                  horizontal: 8 * screenRatio,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF883AE1).withOpacity(0.20),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8 * screenRatio),
                  ),
                ),
                widget: Center(
                  child: Text(
                    'Design',
                    style: TextStyle(
                      color: const Color(0xFF883AE1),
                      fontSize: 5.5 * screenRatio,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // Title
              ResponsiveContainerWidget(
                width: 150 * screenRatio,
                height: 12.5 * screenRatio,
                margin: EdgeInsets.only(
                  top: 5 * screenRatio,
                  bottom: 3.5 * screenRatio,
                  left: 10 * screenRatio,
                  right: 10 * screenRatio,
                ),
                widget: Text(
                  'Embracing Minimalism',
                  style: TextStyle(
                    fontSize: 9 * screenRatio,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Sora',
                  ),
                ),
              ),
              // Text
              ResponsiveContainerWidget(
                margin: EdgeInsets.only(
                  top: 0,
                  bottom: 10 * screenRatio,
                  left: 10 * screenRatio,
                  right: 10 * screenRatio,
                ),
                width: 150 * screenRatio,
                height: 30 * screenRatio,
                widget: Text(
                  'From minimalist sculptures to minimalist paintings, this blog will inspire you to appreciate the beauty that lies in simplicity.',
                  style: TextStyle(
                    fontSize: 6 * screenRatio,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                    fontFamily: 'Sora',
                  ),
                ),
              ),
              // Line
              Container(
                color: textColor.withOpacity(0.2),
                height: 1 * screenRatio,
                width: double.infinity,
              ),
              // Autor
              ResponsiveContainerWidget(
                height: 7.5 * screenRatio,
                margin: EdgeInsets.only(
                  top: 5.5 * screenRatio,
                  bottom: 7.5 * screenRatio,
                  left: 10 * screenRatio,
                  right: 10 * screenRatio,
                ),
                widget: Text(
                  'Annie Spratt',
                  style: TextStyle(
                    fontSize: 7 * screenRatio,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                    fontFamily: 'Sora',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResponsiveContainerWidget extends StatelessWidget {
  const ResponsiveContainerWidget({
    Key? key,
    this.widget = const Text(''),
    this.margin = const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    this.decoration = const BoxDecoration(),
    this.width = double.infinity,
    this.height = double.infinity,
  }) : super(key: key);

  final Widget widget;
  final EdgeInsetsGeometry margin;
  final Decoration decoration;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: decoration,
      width: width,
      height: height,
      child: widget,
    );
  }
}
