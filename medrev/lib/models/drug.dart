class Drug{
    int id;
    String name; 
    String details; 
    String obtained;  
    String refill; 

    Drug({this.id, this.name, this.details, this.obtained, this.refill});

    factory Drug.fromJson(Map<String, dynamic> json){
      return Drug(
        id: json["id"], 
        name: json["name"], 
        details: json["details"], 
        obtained: json["obtained"], 
        refill: json["refill"]);
    }
}