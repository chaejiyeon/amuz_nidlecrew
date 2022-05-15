class UseGuideShoppingItem{
  final List listitem;
  final bool isstapInfo; // true : liststepInfo widget , false : liststep widget

  UseGuideShoppingItem(this.listitem, this.isstapInfo);
}

List<UseGuideShoppingItem> shoppingitems = [
  UseGuideShoppingItem([" 쇼핑몰에서 배송지 란에 수선소의 주소를\n입력해주세요."], false),
  UseGuideShoppingItem([" 쇼핑몰에서 결제를 완료한 뒤, 옷의 품목명이\n나오도록 주문완료 페이지를 캡쳐해 주세요.","쇼핑몰 사이트에서 정확한 옷의 이미지와\n품목명이 나오도록 사진을 찍어 업로드해\n주세요."], true),
  UseGuideShoppingItem([" 니들크루로 접속해 의류 출발지 선택에서\n'쇼핑몰에서 보내요'를 선택해주세요."], false),
  UseGuideShoppingItem([" 쇼핑몰에서 캡처한 주문완료 페이지를 업로드해\n주세요."], false),
  UseGuideShoppingItem([" 수선할 옷 종류와 수선 항목을 선택해주세요.","쇼핑몰에서 수선소로 보내는 수선은 바지 기장\n줄임 수선만 지원합니다."], true),
  UseGuideShoppingItem(["치수를 입력해주세요."], false),
  UseGuideShoppingItem(["추가로 요청할 사항을 기입해주세요."], false),
  UseGuideShoppingItem(["예상 비용을 확인한 후, 결제 정보를 입력하면\n수선 접수가 완료됩니다."], false),
];

