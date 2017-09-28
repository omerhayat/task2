// Copyright (c) 2017, omerhayat. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:io';
bool isNumeric(String s) { //can be used to validate numeric input
  if(s == null) {
    return false;
  }
  return double.parse(s, (e) => null) != null;
}

abstract class Shape {
double area() {
  throw new Exception("not implemented here");
}
double circumference(){
  throw new Exception("not implemented here");
}
}

class Rectangle extends Shape{
  double length, width;
  Rectangle(this.length,this.width);
  double area(){
    return (2*this.length)+(2*this.width);
  }
}
class Square extends Shape{
  double side;
  Square(this.side);
  double area(){
    return (4*this.side);
  }
}
class Circle extends Shape{
  double radius;
  Circle(this.radius);
  double area(){
    return (22/7)*this.radius*this.radius;
  }
  double circumference(){
    return 2*(22/7)*this.radius;
  }
}

main(List<String> arguments) {
  new File('/Users/omerhayat/Downloads/input.txt').readAsString().then((String contents) { //this path should be changed according to the environment
    List<String> lines = contents.split("\n");
    for (var line in lines){
      List<String> lineRow = line.split(" ");
      if(lineRow.contains("rectangle")){
        rectangleLogic(lineRow, line);
      }
      if(lineRow.contains("square")){
        squareLogic(lineRow, line);
      }
      if(lineRow.contains("circle")){
        circleLogic(lineRow, line);
      }
    }
  });

  // this code is for unit testing purpose

  /*List<String> test = ("circle 2").split(" ");
  circleLogic(test, "circle 2");
  */
  
}

void circleLogic(List<String> lineContent, String linePredicate) {

  if (lineContent.length!=2)
  {
    throw new Exception("This is not a valid input");
  }
  else{
    new File('/Users/omerhayat/Downloads/predicates.txt').readAsString().then((String contents) { //this path should be changed according to the environment
      List<String> lines = contents.split("\n");
      for (var line in lines) {
        List<String> contentPredicates = line.split(" ");
        Shape circle = new Circle(double.parse(lineContent.elementAt(1)));
        if(contentPredicates.elementAt(0)=="area" && contentPredicates.elementAt(2)=="circumference"){
          if(contentPredicates.elementAt(1)==">"){
            if(circle.area()>circle.circumference()){
              print("Predicate " +line+ " is true for "+linePredicate);
            }
            if(circle.area()<=circle.circumference()){
              print("Predicate " +line+ " is false for "+linePredicate);
            }
          }
          if(contentPredicates.elementAt(1)=="<"){
            if(circle.area()>=circle.circumference()){
              print("Predicate " +line+ " is false for "+linePredicate);
            }
            if(circle.area()<circle.circumference()){
              print("Predicate " +line+ " is true for "+linePredicate);
            }
          }
        }
        if(contentPredicates.elementAt(0)=="circumference" && contentPredicates.elementAt(2)=="area"){
          if(contentPredicates.elementAt(1)==">"){
            if(circle.area()>=circle.circumference()){
              print("Predicate " +line+ " is false for "+linePredicate);
            }
            if(circle.area()<circle.circumference()){
              print("Predicate " +line+ " is true for "+linePredicate);
            }
          }
          if(contentPredicates.elementAt(1)=="<"){
            if(circle.area()>circle.circumference()){
              print("Predicate " +line+ " is true for "+linePredicate);
            }
            if(circle.area()<=circle.circumference()){
              print("Predicate " +line+ " is false for "+linePredicate);
            }
          }
        }
        else if(contentPredicates.elementAt(0)=="area"){
          if(contentPredicates.elementAt(1)==">"){
            if(circle.area()>double.parse(contentPredicates.elementAt(2))){
              print("Predicate " +line+ " is true for "+linePredicate);
            }
            if(circle.area()<=double.parse(contentPredicates.elementAt(2))){
              print("Predicate " +line+ " is false for "+linePredicate);
            }
          }
        }
        else if(contentPredicates.elementAt(0)=="circumference"){
          if(contentPredicates.elementAt(1)==">"){
            if(circle.circumference()>double.parse(contentPredicates.elementAt(2))){
              print("Predicate " +line+ " is true for "+linePredicate);
            }
            if(circle.circumference()<=double.parse(contentPredicates.elementAt(2))){
              print("Predicate " +line+ " is false for "+linePredicate);
            }
          }
          if(contentPredicates.elementAt(1)=="<"){
            if(circle.circumference()>=double.parse(contentPredicates.elementAt(2))){
              print("Predicate " +line+ " is false for "+linePredicate);
            }
            if(circle.circumference()<double.parse(contentPredicates.elementAt(2))){
              print("Predicate " +line+ " is true for "+linePredicate);
            }
          }
        }
      }
    });
  }

}

void squareLogic(List<String> lineContent, String linePredicate) {

  if (lineContent.length!=2)
  {
    throw new Exception("This is not a valid input");
  }
  else{
    new File('/Users/omerhayat/Downloads/predicates.txt').readAsString().then((String contents) { //this path should be changed according to the environment
      List<String> lines = contents.split("\n");
      for (var line in lines) {
        List<String> contentPredicates = line.split(" ");
        if (contentPredicates.contains("circumference")) {
          print("Predicate " +line+ " is inappropriate for "+linePredicate+" because circumference is a property of circular objects");
        }
        else {
          Shape square = new Square(double.parse(lineContent.elementAt(1)));
          if(contentPredicates.elementAt(0)=="area"){
            if(contentPredicates.elementAt(1)==">"){
              if(square.area()>double.parse(contentPredicates.elementAt(2))){
                print("Predicate " +line+ " is true for "+linePredicate);
              }
              if(square.area()<double.parse(contentPredicates.elementAt(2))){
                print("Predicate " +line+ " is false for "+linePredicate);
              }
            }
          }
        }
      }
    });
  }
}

void rectangleLogic(List<String> lineContent, String linePredicate) {

  if (lineContent.length!=3)
  {
    throw new Exception("This is not a valid input");
  }
  else{
    new File('/Users/omerhayat/Downloads/predicates.txt').readAsString().then((String contents) { //this path should be changed according to the environment
      List<String> lines = contents.split("\n");
      for (var line in lines) {
        List<String> contentPredicates = line.split(" ");
        if (contentPredicates.contains("circumference")) {
          print("Predicate " +line+ " is inappropriate for "+linePredicate+" because circumference is a property of circular objects");
        }
        else {
          Shape rectangle = new Rectangle(double.parse(lineContent.elementAt(1)),
              double.parse(lineContent.elementAt(2)));
          if(contentPredicates.elementAt(0)=="area"){
            if(contentPredicates.elementAt(1)==">"){
              if(rectangle.area()>double.parse(contentPredicates.elementAt(2))){
                print("Predicate " +line+ " is true for "+linePredicate);
              }
              if(rectangle.area()<double.parse(contentPredicates.elementAt(2))){
                print("Predicate " +line+ " is false "+linePredicate);
              }
            }
          }
        }
      }
    });
  }
}
