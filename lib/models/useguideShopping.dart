import 'package:amuz_nidlecrew/models/useguideShoppingItem.dart';

class UseGuideShopping{
  final int step;
  final String title;
  final String subtitle;
  final String img;
  final List<UseGuideShoppingItem> stepInfo;



  UseGuideShopping(this.step, this.title, this.subtitle,  this.img, this.stepInfo);
}

List<UseGuideShopping> shoppingsteps = [
  UseGuideShopping(1, "수선의뢰", "아래의 가이드를 참고하여 의뢰를 진행해주세요!","useguideImage.svg", [for(int i=0; i<shoppingitems.length; i++)shoppingitems[i]]),
  UseGuideShopping(2, "주문내역 업로더", "쇼핑몰에서 캡처한 주문완료 페이지를 업로드해주세요.", "useguideImage2.svg",[]),
  UseGuideShopping(3, "최종 가격 안내", "의류가 수선소에 돡하면 수선 전문가가 확인 후\n최종 수선 가격이 안내됩니다.", "useguideImage3.svg",[]),
  UseGuideShopping(4, "수선 진행", "수선 확정 버튼을 누르면 결제가 진행되고 수선이\n시작됩니다.", "useguideImage4.svg",[]),
  UseGuideShopping(5, "수령지 배송", "수선이 완료되면 고객님의 문 앞으로 수선된 의류가\n배송됩니다.", "useguideImage5.svg",[]),
];

