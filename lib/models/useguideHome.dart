class UseGuideHome{
  final int step;
  final String title;
  final String subtitle;
  final List stepInfo;
  final bool isstapInfo; // true : liststepInfo widget , false : liststep widget


  UseGuideHome(this.step, this.title, this.subtitle, this.stepInfo, this.isstapInfo);
}

List<UseGuideHome> homesteps = [
  UseGuideHome(1, "수선의뢰", "아래의 가이드를 참고하여 의뢰를 진행해주세요!", [" 쇼핑몰에서 배송지 란에 수선소의 주소를\n입력해주세요."], false),
  UseGuideHome(1, "수선의뢰", "아래의 가이드를 참고하여 의뢰를 진행해주세요!", [" 쇼핑몰에서 결제를 완료한 뒤, 옷의 품목명이\n나오도록 주문완료 페이지를 캡쳐해 주세요.","쇼핑몰 사이트에서 정확한 옷의 이미지와\n품목명이 나오도록 사진을 찍어 업로드해\n주세요."], true),
  UseGuideHome(1, "수선의뢰", "아래의 가이드를 참고하여 의뢰를 진행해주세요!", [" 니들크루로 접속해 의류 출발지 선택에서\n'쇼핑몰에서 보내요'를 선택해주세요."], false),
  UseGuideHome(1, "수선의뢰", "아래의 가이드를 참고하여 의뢰를 진행해주세요!", [" 쇼핑몰에서 캡처한 주문완료 페이지를 업로드해\n주세요."], false),
  UseGuideHome(1, "수선의뢰", "아래의 가이드를 참고하여 의뢰를 진행해주세요!", [" 수선할 옷 종류와 수선 항목을 선택해주세요.","쇼핑몰에서 수선소로 보내는 수선은 바지 기장\n줄임 수선만 지원합니다."], true),
  UseGuideHome(1, "수선의뢰", "아래의 가이드를 참고하여 의뢰를 진행해주세요!", ["치수를 입력해주세요."], false),
  UseGuideHome(1, "수선의뢰", "아래의 가이드를 참고하여 의뢰를 진행해주세요!", ["추가로 요청할 사항을 기입해주세요."], false),
  UseGuideHome(1, "수선의뢰", "아래의 가이드를 참고하여 의뢰를 진행해주세요!", ["예상 비용을 확인한 후, 결제 정보를 입력하면\n수선 접수가 완료됩니다."], false),
  UseGuideHome(2, "주문내역 업로더", "쇼핑몰에서 캡처한 주문완료 페이지를 업로드해주세요.", [], false),
  UseGuideHome(3, "최종 가격 안내", "의류가 수선소에 돡하면 수선 전문가가 확인 후\n최종 수선 가격이 안내됩니다.", [], false),
  UseGuideHome(4, "수선 진행", "수선 확정 버튼을 누르면 결제가 진행되고 수선이\n시작됩니다.", [], false),
  UseGuideHome(5, "수령지 배송", "수선이 완료되면 고객님의 문 앞으로 수선된 의류가\n배송됩니다.", [], false),
];

