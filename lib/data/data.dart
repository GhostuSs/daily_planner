enum Repeating{
  weekly,
  daily,
  monthly,
  custom
}

class Data{
  String? name;
  String? habit;
  String? tag;
  List<DateTime>? dates=List.empty(growable: true);
  Repeating? repeat;
  Data({this.name,this.habit,this.tag,this.repeat,this.dates});

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
    dates=json['dates'];
  }
  fromJson(Map<String,dynamic> json){
    habit=json['habit'];
    tag=json['tag'];
    repeat=json['repeat'];
    dates=json['dates'];
  }
}