enum Repeating{
  weekly,
  daily,
  montly,
  custom
}

class Data{
  String? habit;
  String? tag;
  Repeating? repeat;
  Data({this.habit,this.tag,this.repeat});

  removeData(){
    habit='';
    tag='';
    repeat=null;
  }
  Map<String,dynamic> toJson(){
    return{
      'habit':habit,
      'tag':tag,
      'repeat':repeat
    };
  }
  Data.fromJson(Map<String,dynamic> json){
    habit=json['habit'];
    tag=json['tag'];
    repeat=json['repeat'];
  }
  fromJson(Map<String,dynamic> json){
    habit=json['habit'];
    tag=json['tag'];
    repeat=json['repeat'];
  }
}