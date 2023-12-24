import 'dart:convert';

import 'package:api_call/model/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<User> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Api Controller",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final email = user.email;
          final color = user.gender == 'male' ? Colors.white : Colors.grey;
          return ListTile(
            title: Text(user.name.first),
            subtitle: Text(user.phone),
            // tileColor: color,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchUser();
        },
      ),
    );
  }

  void fetchUser() async {
    print("user selected");
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final transformed = results.map(
      (e) {
        final name = UserName(
            title: e['name']['title'],
            first: e['name']['first'],
            last: e['name']['last']);
        return User(
            gender: e['gender'],
            email: e['email'],
            phone: e['phone'],
            cell: e['cell'],
            nut: e['nat'],
            name: name);
      },
    ).toList();
    setState(() {
      users = transformed;
    });
    print("fetch user completed");
  }
}
