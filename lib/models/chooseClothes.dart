class ChooseClothes {
  final int optionNum;
  final String chooseItem;

  ChooseClothes(this.optionNum, this.chooseItem);

  factory ChooseClothes.fromJson(Map<String, dynamic> json){
    return ChooseClothes(json['id'], json['title']['rendered']);
  }
}

