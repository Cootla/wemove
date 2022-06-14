class SamplemovesStartpage {
  int? _totalSize;
  int? _typeId;
  int? _offset;
 late List<MovesamplesModel> _movesamples;
 List<MovesamplesModel> get movesamples=>_movesamples;

  SamplemovesStartpage(
      {required totalSize, required typeId, required offset, required movesamples}){
    this._totalSize=totalSize;
    this._typeId=typeId;
    this._offset=offset;
    this._movesamples=_movesamples;
  }


  SamplemovesStartpage.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    _typeId = json['type_id'];
    _offset = json['offset'];
    if (json['movesamples'] != null) {
      _movesamples = <MovesamplesModel>[];
      json['movesamples'].forEach((v) {
        _movesamples!.add(MovesamplesModel.fromJson(v));
      });
    }
  }

}

class MovesamplesModel {
  int? id;
  String? name;
  String? img;
  String? description;

  MovesamplesModel({this.id, this.name, this.img, this.description});

  MovesamplesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    description = json['description'];
  }

}
