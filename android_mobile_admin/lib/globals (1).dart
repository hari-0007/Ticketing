// TODO Implement this library.
library organization;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

bool isLoggedIn = true;
final Group1_item = [];
///variable for textformfield activation
///variable for 'edit'
// bool   filewarning = false;
// bool textfieldactive = false;
bool enableEditing = false;
bool dropdown_activation = false;
int g_user =0;
final List<Map<String, dynamic>> allUsers =
[
  {"id": 1, "name": "Andy", "age": 29},
  {"id": 2, "name": "Aragon", "age": 40},
  {"id": 3, "name": "Bob", "age": 5},
  {"id": 4, "name": "Barbara", "age": 35},
  {"id": 5, "name": "Candy", "age": 21},
  {"id": 6, "name": "Colin", "age": 55},
  {"id": 7, "name": "Audra", "age": 30},
  {"id": 8, "name": "Banana", "age": 14},
  {"id": 9, "name": "Caversky", "age": 100},
  {"id": 10, "name": "Becky", "age": 32},
  {"id": 11, "name": "karthi", "age": 29},
  {"id": 12, "name": "shikin", "age": 40},
  {"id": 13, "name": "hari", "age": 5},
  {"id": 14, "name": "ramkumar", "age": 35},
  {"id": 15, "name": "gipson", "age": 21},
  {"id": 16, "name": "ajin", "age": 55},
  {"id": 17, "name": "akshaya", "age": 30},
  {"id": 18, "name": "keerthi", "age": 14},
  {"id": 19, "name": "tharini", "age": 100},
  {"id": 20, "name": "ft", "age": 32},
];
List glbuserlist = [];