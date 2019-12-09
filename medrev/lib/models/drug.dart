class Drug{
    int id;
    String name; 
    String obtained;  
    String refill;

    Drug({this.id, this.name, this.obtained, this.refill});

    factory Drug.fromJson(Map<String, dynamic> json){
      return Drug(id: json["id"], name: json["name"], obtained: json["obtained"], refill: json["refill"]);
    }
}