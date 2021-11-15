class Data{
  String? habit='wakeup';
  String? tag='morning';
  DateTime? date=DateTime.now();
  Data();

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