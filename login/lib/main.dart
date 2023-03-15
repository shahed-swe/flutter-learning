import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Demo',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? _validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your email address';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      String email = emailController.text;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                  border: OutlineInputBorder(),
                ),
                validator: _validateEmail,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Map<String, String>> _cardDetails = [
    {
      'image': 'https://picsum.photos/200',
      'title': 'Card Title 1',
      'subtitle': 'Card Subtitle 1',
      'details': 'Card Details 1',
    },
    {
      'image': 'https://picsum.photos/201',
      'title': 'Card Title 2',
      'subtitle': 'Card Subtitle 2',
      'details': 'Card Details 2',
    },
    {
      'image': 'https://picsum.photos/202',
      'title': 'Card Title 3',
      'subtitle': 'Card Subtitle 3',
      'details': 'Card Details 3',
    },
    {
      'image': 'https://picsum.photos/203',
      'title': 'Card Title 4',
      'subtitle': 'Card Subtitle 4',
      'details': 'Card Details 4',
    },
    {
      'image': 'https://picsum.photos/204',
      'title': 'Card Title 5',
      'subtitle': 'Card Subtitle 5',
      'details': 'Card Details 5',
    },
    {
      'image': 'https://picsum.photos/205',
      'title': 'Card Title 6',
      'subtitle': 'Card Subtitle 6',
      'details': 'Card Details 6',
    },
    {
      'image': 'https://picsum.photos/206',
      'title': 'Card Title 6',
      'subtitle': 'Card Subtitle 6',
      'details': 'Card Details 6',
    },
    {
      'image': 'https://picsum.photos/207',
      'title': 'Card Title 7',
      'subtitle': 'Card Subtitle 7',
      'details': 'Card Details 7',
    },
  ];

  Future<void> _refreshData() async {
    // Add your logic to update the page data here
    // For example, you could make an API call or fetch new data from a database
    // Wait for some time to simulate the data fetching process
    await Future.delayed(Duration(seconds: 2));
    // Update the UI by calling setState()
    setState(() {});
  }

  void _onCardTap({
    required BuildContext context,
    required Map<String, String> cardData,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CardDetailsPage(
          imageUrl: cardData['image']!,
          title: cardData['title']!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: _cardDetails.length,
                  itemBuilder: (context, index) {
                    final cardData = _cardDetails[index];
                    return GestureDetector(
                      onTap: () =>
                          _onCardTap(context: context, cardData: cardData),
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Image.network(
                                cardData['image']!,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cardData['title']!,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    cardData['subtitle']!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pop(context); // Navigate back to the login page
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.pushAndRemoveUntil(
          //   context,
          //   MaterialPageRoute(builder: (context) => HomePage()),
          //   (Route<dynamic> route) => false,
          // );
        },
        child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 1) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
              (Route<dynamic> route) => false,
            );
          }
          // navigation logic
        },
      ),
    );
  }
}

class CardDetailsPage extends StatefulWidget {
  final String imageUrl;
  final String title;

  const CardDetailsPage({
    required this.imageUrl,
    required this.title,
  });

  @override
  _CardDetailsPageState createState() => _CardDetailsPageState();
}

class _CardDetailsPageState extends State<CardDetailsPage> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              widget.imageUrl,
              height: MediaQuery.of(context).size.height / 2,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eu felis vitae quam consectetur commodo. In semper felis vel orci molestie, sit amet cursus nisl scelerisque. Vestibulum eget tortor orci. Morbi sit amet lacus ante. Praesent aliquet eros id dolor imperdiet, at hendrerit mi suscipit. Sed a nulla vel leo rutrum pellentesque ut nec massa. Vestibulum euismod eget justo sit amet iaculis.',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
              (Route<dynamic> route) => false,
            );
          },
          child: Icon(Icons.home),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout),
              label: 'Logout',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
            if (index == 1) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (Route<dynamic> route) => false,
              );
            }
            // navigation logic
          },
        ));
  }
}
