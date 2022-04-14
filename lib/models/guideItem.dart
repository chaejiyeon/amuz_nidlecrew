class GuideItem {
  final String img;
  final String title;
  final String subTitle;

  GuideItem(this.img, this.title, this.subTitle);
}

List<GuideItem> guides = [
  GuideItem("assets/images/sample.jpeg", "니들크루가 처음이신가요?", "차근차근 알려드릴께요!"),
  GuideItem("assets/images/sample.jpeg", "수선가격이 궁금하신가요?", "합리적인 가격,완벽한 디테일"),
  GuideItem("assets/images/sample.jpeg", "의류 측정은 이렇게!", "측정 가이드를 참고해 의뢰해주세요!"),
];