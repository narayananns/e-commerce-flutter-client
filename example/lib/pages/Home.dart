import 'package:flutter/material.dart';
import 'package:example/pages/signin.dart'; // Import your SignIn page

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add Drawer here
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.red),
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Sign In"),
              onTap: () {
                // Navigate to SignIn page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Signin()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text("Sign Up"),
              onTap: () {
                Navigator.pop(context);
                // Navigate to SignUp page (replace with actual page)
                print("Navigate to Sign Up page");
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context); // Just close the drawer
              },
            ),
          ],
        ),
      ),

      // AppBar with PreferredSize and SafeArea
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: SafeArea(
          child: AppBar(
            title: Text("Summa", style: TextStyle(fontWeight: FontWeight.bold)),
            backgroundColor: Colors.red,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red, Colors.pink],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            actions: [
              // Search Box
              SizedBox(
                width: 200,
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIconColor: Colors.amber,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search your product",
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                  ),
                ),
              ),
              SizedBox(width: 30),

              // Cart Icon
              GestureDetector(
                onTap: () {
                  print("Cart clicked");
                },
                child: Container(
                  height: 60,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: Icon(Icons.shopping_cart_checkout, color: Colors.red),
                ),
              ),
              SizedBox(width: 15),

              // Person Dropdown (optional, you can remove if using drawer)
              DropdownButton<String>(
                underline: SizedBox(), // Remove default underline
                icon: Icon(Icons.person, color: Colors.red), // Icon in AppBar
                items: <String>['Sign In', 'Sign Up'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: TextStyle(fontSize: 16)),
                  );
                }).toList(),
                onChanged: (String? value) {
                  if (value == 'Sign In') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signin()),
                    );
                  } else if (value == 'Sign Up') {
                    print("Navigate to Sign Up page");
                  }
                },
              ),
              SizedBox(width: 15),
            ],
          ),
        ),
      ),

      // Body placeholder
      body: const Center(
        child: Text("Welcome to Summa!", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
