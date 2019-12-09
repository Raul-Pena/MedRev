import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';  
import 'package:MedRev/models/user.dart';
import 'package:MedRev/models/drug.dart';
import 'package:MedRev/blocs/drugtrackerbloc.dart';

class DrugTrackerBloc extends ChangeNotifier {
  bool isReady = false;
  bool isLoggedIn = false;
  bool didLoginFail = false;
  bool didRegisterFail = false;
  bool didLoadFail = false;
  bool wasRedirected = false;
  List<Drug> mydruglist = []; 
  User myAccount;
  String redirectedFrom;
  String token;
  String currentpage;
  String web = "https://nameless-escarpment-45560.herokuapp.com";

  DrugTrackerBloc() {
    setup();
  }

  Future<void> setup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = (prefs.getString('token') ?? null);
    if (token != null) {
      isLoggedIn = false;
      isReady = true;
      notifyListeners();
      // loadData();
    } 
  }

  Future<void> changePage(String page) async {
    if (page != '') { 
      print(page);
      currentpage = page;
    } 
    notifyListeners();
  }

  Future<void> redirectToLogin(String page) async {
    wasRedirected = true;
    redirectedFrom = page;

    notifyListeners();
  }

  Future<void> attemptLogin(String username, String password) async {
    // var website = "${web}/api/login?username=${username}&password=${password}";
    // print( "attempting login ${website}" );
    // var response = await http.get( website );
    // if (response.statusCode == 200) {
    //   print("succeeded login");
    //   didLoginFail = false;
    //   Map<String, dynamic> jsonData = json.decode(response.body);
    //   token = jsonData["token"];
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   await prefs.setString('token', token);
    //   if (token != null) {
        isLoggedIn = true;
    //   }
    //   notifyListeners();
    // } else {
    //   print(response.body);
    //   print("login failed");
    //   didLoginFail = true;
    //   notifyListeners();
    // }
    notifyListeners();
  }
  Future<void> attemptRegistration(String username, String password) async {
    // var website = "${web}/api/register?username=${username}&password=${password}";
    // print( "attempting registration ${website}" );
    // var response = await http.post( website );
    // if (response.statusCode == 200) {
    //   print("succeeded registration");
    //   didRegisterFail = false;
    //   Map<String, dynamic> jsonData = json.decode(response.body);
    //   token = jsonData["token"];
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   await prefs.setString('token', token);
    //   if (token != null) {
    //     // Login Funciton
        attemptLogin(username, password); 
    //   }
    //   notifyListeners();
    // } else {
    //   print(response.body);
    //   print("registration failed");
    //   didRegisterFail = true;
      notifyListeners();
    //}
  }

}

  /*Future<void> attemptLogin() async { 

    String url = 'https://sleepy-hamlet-97922.herokuapp.com/api/login';
  url = url + "?username=$username&password=$password";
  var response = await http.get(url);
    
  //if successful, that is, status is 200
  if(response.statusCode == 200){
    //parse the response
    Map<String, dynamic> data = json.decode(response.body);
    String token = data["token"];
    //return the token
    return token;
  }
  //if not successful return null
  return response.body;

    changePage("home");
    notifyListeners();
  }
*/
  /*Future<bool> attemptRegistration(/*String username, String password, String pVerify*/) async {

//verify the passwords were the same
    if (password == pVerify) {
      //try register at https://sleepy-hamlet-97922.herokuapp.com/api/register
      String url = 'https://sleepy-hamlet-97922.herokuapp.com/api/register';
      url = url + "?username=${username}&password=${password}";
      var response = await http.post(url);

      //if successful, that is, status is 200
      if (response.statusCode == 200) {
        //parse the response
        Map<String, dynamic> data = json.decode(response.body);
        String token = data["token"];
        //return the token
        return token;
      }
      //if not successful return null
      token = response.body;
      if(token != null){
        didRegisterFail = true;
      }
    }
    return null;

    //changePage("home");
    notifyListeners();
    return didRegisterFail;
  }

}
*/





/*// Future<void> loadData() async {
  //   if (isLoggedIn) {
  //     bool fetchedTimeline = await fetchTimeline();
  //     bool fetchedAccount = await fetchAccount();
  //     if (fetchedTimeline && fetchedAccount) {
  //       print("is ready");
  //       isReady = true;
  //       notifyListeners();
  //     } else {
  //       print("is not ready");
  //       didLoadFail = true;
  //       notifyListeners();
  //     }
  //   }else{
  //     print("not logged in");
  //   }
  // }

  
  

  // Future<void> logout() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.remove("token");
  //   isLoggedIn = false;
  //   notifyListeners();
  // }

  // Future<bool> fetchTimeline() async {
  //   var response = await http.get(
  //       "https://nameless-escarpment-45560.herokuapp.com/api/v1/posts",
  //       headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
  //   if(response.statusCode == 200){
  //     List<dynamic> serverPosts = json.decode(response.body);
  //     for(int i = 0; i < serverPosts.length; i++){
  //       timeline.add(Post.fromJson(serverPosts[i]));

  //     }
  //     return true;
  //   }
  //   return false;
  // }

  // Future<bool> fetchAccount() async {
  //   print("getting account data");
  //   var response = await http.get(
  //       "https://nameless-escarpment-45560.herokuapp.com/api/v1/my_account",
  //       headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
  //   if (response.statusCode == 200) {
  //     myAccount = User.fromJson(json.decode(response.body));

  //     print("getting account posts");
  //     var my_posts_response = await http.get(
  //         "https://nameless-escarpment-45560.herokuapp.com/api/v1/my_posts",
  //         headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
  //     if (my_posts_response.statusCode == 200) {
  //       print("successfully got account posts");
  //       List<dynamic> server_posts = json.decode(my_posts_response.body);
  //       my_posts = server_posts.map((p) => Post.fromJson(p)).toList();
  //       return true;
  //     }
  //   } else {
  //     print(response.body);
  //     print("account load failed");
  //   }
  //   return false;
  // }
  */