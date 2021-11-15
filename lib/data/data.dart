class Data{
  String? habit;
  String? tag;
  DateTime? date;
  Data({this.habit,this.tag,this.date});

  removeData(){
    habit='';
    tag='';
    date=null;
  }
  Map<String,dynamic> toJson(){
    return{
      'habit':habit,
      'tag':tag,
      'date':date
    };
  }
  Data.fromJson(Map<String,dynamic> json){
    habit=json['habit'];
    tag=json['tag'];
    date=json['date'];
  }
  fromJson(Map<String,dynamic> json){
    habit=json['habit'];
    tag=json['tag'];
    date=json['date'];
  }
}