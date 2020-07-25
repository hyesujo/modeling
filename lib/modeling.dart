void main() {
  
  

  List<Map<String, dynamic>> data = [
    { "title": " 댄스", "src" : "","data" : [
      {"title" : "댄스노래1","name" : "가수1", "src" : "", "des" : ""},
      {"title" : "댄스노래2", "name" : "가수2","src" : "", "des" : ""},
      { "title" : "댄스노래3", "name" : "가수3","src" : "", "des" : ""}
      ]
    },
   
    {"title": " 발라드","src" : "","data" : [
        { "title" : "발라드노래1", "name" : "가수1", "src" : "", "des" : "" },
        { "title" : "발라드노래2","name" : "가수2","src" : "", "des" : ""},
        { "title" : "발라드노래3", "name" : "가수3",  "src" : "",  "des" : "" }
      ]
    },
  ];
  
  
  List<Models> result;
  
  result = data.map((e) =>Models.toItem(item: e)).toList();
  
  print(result[1].title);
  print(result[0].data[1].name);
  print(result[1].data[0].title);

  
//   List<Models> result = data.map<Models>((Map<String,dynamic>e){
//     return new Models(
//     title: e["title"],
//     src : e["src"],
//      data: e["data"].map<DeepModels>((c) {
//        return new DeepModels(
//        title: c["title"],
//        name: c["name"],
//        des : c["des"],
//         src : c["src"]   
//        );
//      }).toList()
//     );
//   }).toList();
  
//   print(result);
//   print(result[1].title);
//   print(result[0].data[2].title);
  
  
//   List<int> data = [1,2,3];
  
//   for(int i=0; i<data.length; i++){
//     print(data[i]);
//   }

//            //인스턴스     
//   List<int> newData = data.map((int e) {
//       print(e);
//    return e;
//   }).toList();
  
//   print(newData);

//            //= [];를 안붙이면 선언만 한상태 
//            //(리스트의 인트형을 담은 것이 fordata라고 선언만 한상태)
// //  List<int> forData =[];
// // for(int i =0; i<data.length; i++) {
// //   forData.add(data[i]++);
// // }
// //   print(forData);

  
//  data.forEach((int e) {
//    print(e);
//  });
}

class Models {
  String title;
  String src;
  List<DeepModels> data;
  
 Models({ this.data,this.src,this.title}) 
   :assert(data != null), assert(title !=null), assert(src !=null);
  
  factory Models.toItem(
    { Map<String, dynamic> item}) {
    return new Models(
    title: item["title"],
    src: item["src"],
    data : item["data"].map<DeepModels>((e)=> DeepModels.toItem(e : e )).toList());
    
  }
}

//   {"title" : "댄스노래1","name" : "가수1", "src" : "", "des" : ""},
class DeepModels{
  String title;
  String name;
  String src;
  String des;
  
  DeepModels({
    this.des,this.name,this.src,this.title}) 
    :assert(title != null);
  
  
  factory DeepModels.toItem({Map<String, dynamic> e}) {
    return new DeepModels(
      title: e["title"],
      des : e["des"],
      src : e["src"],
      name : e["name"]
    );
  }
  
}