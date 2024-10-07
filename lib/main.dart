import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2, // Two pages
        child: Scaffold(
          appBar: AppBar(
            title: Text('Multi-Page App'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Buttons Page'),
                Tab(text: 'Widgets Page'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ButtonExample(),
              BackgroundWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonExample extends StatelessWidget {
  void showInfoDialog(BuildContext context, String buttonType, String description, String sourceCode) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(buttonType),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(description, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text('Source Code:'),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(sourceCode, style: TextStyle(fontFamily: 'monospace')),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    BoxDecoration backgroundImage = BoxDecoration(
      image: DecorationImage(
        image: AssetImage('images/ai-generated-8620359_1280.png'), // Add your image in assets
        fit: BoxFit.cover,
      ),
    );

    return Container(
      decoration: backgroundImage, // Apply background image
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.7),
                padding: EdgeInsets.all(16),
              ),
              onPressed: () {
                showInfoDialog(
                    context,
                    'TextButton',
                    'This is a basic TextButton with a background color.',
                    '''
TextButton(
  style: TextButton.styleFrom(
    backgroundColor: Colors.black.withOpacity(0.7),
    padding: EdgeInsets.all(16),
  ),
  onPressed: () { },
  child: Text('TextButton', style: TextStyle(color: Colors.white)),
);
                  '''
                );
              },
              child: Text(
                'TextButton',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.7),
                padding: EdgeInsets.all(16),
              ),
              onPressed: () {
                showInfoDialog(
                    context,
                    'ElevatedButton',
                    'This is an ElevatedButton with elevation and background color.',
                    '''
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.black.withOpacity(0.7),
    padding: EdgeInsets.all(16),
  ),
  onPressed: () { },
  child: Text('ElevatedButton', style: TextStyle(color: Colors.white)),
);
                  '''
                );
              },
              child: Text(
                'ElevatedButton',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.7),
                padding: EdgeInsets.all(16),
                side: BorderSide(color: Colors.white, width: 2),
              ),
              onPressed: () {
                showInfoDialog(
                    context,
                    'OutlinedButton',
                    'This is an OutlinedButton with custom border and background color.',
                    '''
OutlinedButton(
  style: OutlinedButton.styleFrom(
    backgroundColor: Colors.black.withOpacity(0.7),
    padding: EdgeInsets.all(16),
    side: BorderSide(color: Colors.white, width: 2),
  ),
  onPressed: () { },
  child: Text('OutlinedButton', style: TextStyle(color: Colors.white)),
);
                  '''
                );
              },
              child: Text(
                'OutlinedButton',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              icon: Icon(Icons.star, color: Colors.white),
              iconSize: 40,
              onPressed: () {
                showInfoDialog(
                    context,
                    'IconButton',
                    'This is a customizable IconButton with a background color.',
                    '''
IconButton(
  icon: Icon(Icons.star, color: Colors.white),
  iconSize: 40,
  onPressed: () { },
);
                  '''
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/girl-9038822_1280.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              _buildNormalWidget(),
              _buildModerateComplexWidget(),
              _buildComplexWidget(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNormalWidget() {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.all(8.0),
      color: Colors.white.withOpacity(0.8),
      child: Text(
        'Normal Widget',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildModerateComplexWidget() {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.all(8.0),
      color: Colors.blue.withOpacity(0.8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ListView',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 10),
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildListItem('Item 1'),
                _buildListItem('Item 2'),
                _buildListItem('Item 3'),
                _buildListItem('Item 4'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(String title) {
    return Container(
      width: 100,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      color: Colors.white.withOpacity(0.9),
      child: Center(child: Text(title)),
    );
  }

  Widget _buildComplexWidget() {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.all(8.0),
      color: Colors.green.withOpacity(0.8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'GridView',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 10),
          Container(
            height: 200,
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              children: List.generate(6, (index) {
                return Container(
                  color: Colors.white.withOpacity(0.9),
                  child: Center(child: Text('Grid Item ${index + 1}')),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
