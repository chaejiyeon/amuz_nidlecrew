import 'package:needlecrew/screens/main/mainHome.dart';
import 'package:needlecrew/widgets/fixClothes/listLine.dart';
import 'package:needlecrew/widgets/fontStyle.dart';
import 'package:needlecrew/widgets/myPage/mypageAppbar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ServicePolicyItem extends StatelessWidget {
  final String policyName;

  const ServicePolicyItem({Key? key, required this.policyName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MypageAppBar(
          title: "서비스 정책", icon: "", widget: MainHome(), appbar: AppBar()),
      body: Container(
        padding: EdgeInsets.only(top: 40, left: 24, right: 24),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FontStyle(
                text: policyName,
                fontsize: "",
                fontbold: "bold",
                fontcolor: Colors.black,
                textdirectionright: false),
            Container(
                padding: EdgeInsets.only(top: 14, bottom: 14),
                child: ListLine(
                    height: 1,
                    width: double.infinity,
                    lineColor: HexColor("#ededed"),
                    opacity: 1)),
            Expanded(child: SingleChildScrollView(child: policyInfo())),
          ],
        ),
      ),
    );
  }

  Widget policyInfo() {
    return policyName == "서비스 이용 약관"
        ? Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textStyle("제1조(목적)"),
                textStyle(
                    "이 약관은 김현영(대표)가 운영하는 사이버 몰(이하 “니들크루”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리.의무 및 책임사항을 규정 함을 목적으로 합니다."),
                textStyle(
                    "※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질 에 반하지 않는 한 이 약관을 준용합니다.」 "),
                textStyle("제2조(정의)"),
                textStyle(
                    " ① “니들크루”이란 김현영(대표)가 재화 또는 용역(이하 “재화 등” 이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하 며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다. "),
                textStyle(
                    " ② “이용자”란 “니들크루”에 접속하여 이 약관에 따라 “니들크루” 가 제공하는 서비스를 받는 회원을 말합니다."),
                textStyle(
                    " ③ ‘회원’이라 함은 “니들크루”에 회원등록을 한 자로서, 계속적으 로 “니들크루”가 제공하는 서비스를 이용할 수 있는 자를 말합니다."),
                textStyle("제3조 (약관 등의 명시와 설명 및 개정)"),
                textStyle(
                    " ① “니들크루”는 이 약관의 내용과 상호 및 대표자 성명, 영업소 소 재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화 번호․모사전송번호․전자우편주소, 사업자등록번호, 통신판매업 신 고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 니들 크루 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관 의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다."),
                textStyle(
                    " ② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회․배송책임․환불조건 등과 같은 중요한 내용을 이용 자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하 여 이용자의 확인을 구하여야 합니다."),
                textStyle(
                    " ③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비 자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다."),
                textStyle(
                    " ④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하 여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적 용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용 을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공 지합니다. 이 경우 “몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다."),
                textStyle(
                    " ⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이 후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대 해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항 에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다."),
                textStyle(
                    " ⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관 한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보 호지침 및 관계법령 또는 상관례에 따릅니다."),
                textStyle("제4조(서비스의 제공 및 변경)"),
                textStyle(
                    " ① “몰”은 다음과 같은 업무를 수행합니다. \n\n   1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결 \n   2. 구매계약이 체결된 재화 또는 용역의 배송\n   3. 기타 “몰”이 정하는 업무"),
                textStyle(
                    " ② “몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경 우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다."),
                textStyle(
                    " ③ “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재 화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다."),
                textStyle(
                    " ④ 전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합 니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그 러하지 아니합니다."),
                textStyle("제5조(서비스의 중단)"),
                textStyle(
                    " ① “몰”은 컴퓨터 등 정보통신설비의 보수점검․교체 및 고장, 통신 의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다."),
                textStyle(
                    " ② “몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으 로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니 합니다."),
                textStyle(
                    " ③ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비 스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에 게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에 는 이용자들의 마일리지 또는 적립금 등을 “몰”에서 통용되는 통화 가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다."),
                textStyle("제6조(회원가입)"),
                textStyle(
                    " ① 이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다."),
                textStyle(
                    " ② “몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다. \n\n   1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격 을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다. \n   2. 등록 내용에 허위, 기재누락, 오기가 있는 경우 \n   3. 기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있 다고 판단되는 경우"),
                textStyle(" ③ 회원가입계약의 성립 시기는 “몰”의 승낙이 회원에게 도달한 시 점으로 합니다."),
                textStyle(
                    " ④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기 간 이내에 “몰”에 대하여 회원정보 수정 등의 방법으로 그 변경사항 을 알려야 합니다."),
                textStyle("제7조(회원 탈퇴 및 자격 상실 등)"),
                textStyle(
                    " ① 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다."),
                textStyle(
                    " ② 회원이 다음 각 호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다. \n\n   1. 가입 신청 시에 허위 내용을 등록한 경우 \n   2. “몰”을 이용하여 구입한 재화 등의 대금, 기타 “몰”이용에 관련 하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우 \n   3. 다른 사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등 전 자상거래 질서를 위협하는 경우 4. “몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우"),
                textStyle(
                    " ③ “몰”이 회원 자격을 제한․정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “몰”은 회원자격을 상실시킬 수 있습니다."),
                textStyle(
                    " ④ “몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니 다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30 일 이상의 기간을 정하여 소명할 기회를 부여합니다."),
                textStyle("제8조(회원에 대한 통지)"),
                textStyle(
                    " ① “몰”이 회원에 대한 통지를 하는 경우, 회원이 “몰”과 미리 약정 하여 지정한 전자우편 주소로 할 수 있습니다."),
                textStyle(
                    " ② “몰”은 불특정다수 회원에 대한 통지의 경우 1주일이상 “몰” 게 시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개 별통지를 합니다."),
                textStyle("제9조(구매신청 및 개인정보 제공 동의 등)"),
                textStyle(
                    " ① “몰”이용자는 “몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “몰”은 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다. \n\n   1. 재화 등의 검색 및 선택 \n   2. 받는 사람의 성명, 주소, 전화번호, 전자우편주소(또는 이동전 화번호) 등의 입력 \n   3. 약관내용, 청약철회권이 제한되는 서비스, 배송료․설치비 등 의 비용부담과 관련한 내용에 대한 확인 \n   4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표 시 (예, 마우스 클릭) \n   5. 재화등의 구매신청 및 이에 관한 확인 또는 “몰”의 확인에 대 한 동의 \n   6. 결제방법의 선택"),
                textStyle(
                    " ② “몰”이 제3자에게 구매자 개인정보를 제공할 필요가 있는 경우 1) 개인정보를 제공받는 자, 2)개인정보를 제공받는 자의 개인정보 이용목적, 3) 제공하는 개인정보의 항목, 4) 개인정보를 제공받는 자 의 개인정보 보유 및 이용기간을 구매자에게 알리고 동의를 받아야 합니다. (동의를 받은 사항이 변경되는 경우에도 같습니다.)"),
                textStyle(
                    " ③ “몰”이 제3자에게 구매자의 개인정보를 취급할 수 있도록 업무 를 위탁하는 경우에는 1) 개인정보 취급위탁을 받는 자, 2) 개인정보 취급위탁을 하는 업무의 내용을 구매자에게 알리고 동의를 받아야 합니다. (동의를 받은 사항이 변경되는 경우에도 같습니다.) 다만, 서 비스제공에 관한 계약이행을 위해 필요하고 구매자의 편의증진과 관련된 경우에는 「정보통신망 이용촉진 및 정보보호 등에 관한 법 률」에서 정하고 있는 방법으로 개인정보 취급방침을 통해 알림으 로써 고지절차와 동의절차를 거치지 않아도 됩니다."),
                textStyle("제10조 (계약의 성립)"),
                textStyle(
                    " ① “몰”은 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하 면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법 정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다. \n\n   1. 신청 내용에 허위, 기재누락, 오기가 있는 경우 \n   2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우 \n   3. 기타 구매신청에 승낙하는 것이 “몰” 기술상 현저히 지장이 있 다고 판단하는 경우"),
                textStyle(
                    " ② “몰”의 승낙이 제12조제1항의 수신확인통지형태로 이용자에 게 도달한 시점에 계약이 성립한 것으로 봅니다."),
                textStyle(
                    " ③ “몰”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함 하여야 합니다."),
                textStyle(
                    "제11조(지급방법) “몰”에서 구매한 재화 또는 용역에 대한 대금지 급방법은 다음 각 호의 방법중 가용한 방법으로 할 수 있습니다. 단, “몰”은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목 의 수수료도 추가하여 징수할 수 없습니다. \n\n   1. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체 \n   2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제 \n   3. 온라인무통장입금 \n   4. 전자화폐에 의한 결제 \n   5. 수령 시 대금지급 \n   6. 마일리지 등 “몰”이 지급한 포인트에 의한 결제 \n   7. “몰”과 계약을 맺었거나 “몰”이 인정한 상품권에 의한 결제 \n   8. 기타 전자적 지급 방법에 의한 대금 지급 등 제12조(수신확인통지․구매신청 변경 및 취소)"),
                textStyle(" ① “몰”은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통 지를 합니다."),
                textStyle(
                    " ② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경 우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청 할 수 있고 “몰”은 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다."),
                textStyle("제13조(재화 등의 공급)"),
                textStyle(
                    " ① “몰”은 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, “몰”이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금 의 전부 또는 일부를 받은 날부터 3영업일 이내에 조치를 취합니다. 이때 “몰”은 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다."),
                textStyle(
                    " ② “몰”은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비 용 부담자, 수단별 배송기간 등을 명시합니다. 만약 “몰”이 약정 배 송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 “몰”이 고의․과실이 없음을 입증한 경우에는 그러하지 아니합니다."),
                textStyle(
                    "제14조(환급) “몰”은 이용자가 구매신청한 재화 등이 품절 등의 사 유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용 자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받 은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다."),
                textStyle("제15조(청약철회 등)"),
                textStyle(
                    " ① “몰”과 재화등의 구매에 관한 계약을 체결한 이용자는 「전자 상거래 등에서의 소비자보호에 관한 법률」 제13조 제2항에 따른 계약내용에 관한 서면을 받은 날(그 서면을 받은 때보다 재화 등의 공급이 늦게 이루어진 경우에는 재화 등을 공급받거나 재화 등의 공 급이 시작된 날을 말합니다)부터 7일 이내에는 청약의 철회를 할 수 있습니다. 다만, 청약철회에 관하여 「전자상거래 등에서의 소비자 보호에 관한 법률」에 달리 정함이 있는 경우에는 동 법 규정에 따릅니다."),
                textStyle(
                    " ② 이용자는 재화 등을 배송 받은 경우 다음 각 호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다. \n\n   1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우 (다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다) \n   2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우 \n   3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치 가 현저히 감소한 경우 \n   4. 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재 화 등의 포장을 훼손한 경우"),
                textStyle(
                    " ③ 제2항제2호 내지 제4호의 경우에 “몰”이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상 품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다."),
                textStyle(
                    " ④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있 었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다."),
                textStyle("제16조(청약철회 등의 효과)"),
                textStyle(
                    " ① “몰”은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우 “몰”이 이용자 에게 재화등의 환급을 지연한때에는 그 지연기간에 대하여 「전자 상거래 등에서의 소비자보호에 관한 법률 시행령」제21조의2에서 정하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다."),
                textStyle(
                    " ② “몰”은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전 자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없 이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구 를 정지 또는 취소하도록 요청합니다."),
                textStyle(
                    " ③ 청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. “몰”은 이용자에게 청약철회 등을 이유로 위 약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표 시·광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등 을 하는 경우 재화 등의 반환에 필요한 비용은 “몰”이 부담합니다."),
                textStyle(
                    " ④ 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 “몰” 은 청약철회 시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다."),
                textStyle("제17조(개인정보보호)"),
                textStyle(
                    " ① “몰”은 이용자의 개인정보 수집시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다."),
                textStyle(
                    " ② “몰”은 회원가입시 구매계약이행에 필요한 정보를 미리 수집하 지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 개인정보를 수집하는 경우에는 그러하지 아니합니다."),
                textStyle(
                    " ③ “몰”은 이용자의 개인정보를 수집·이용하는 때에는 당해 이용 자에게 그 목적을 고지하고 동의를 받습니다."),
                textStyle(
                    " ④ “몰”은 수집된 개인정보를 목적외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용·제공단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받 습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다."),
                textStyle(
                    " ⑤ “몰”이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경 우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련 사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 「정보통신 망 이용촉진 및 정보보호 등에 관한 법률」 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의 를 철회할 수 있습니다."),
                textStyle(
                    " ⑥ 이용자는 언제든지 “몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “몰”은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 “몰”은 그 오류를 정정할 때까지 당해 개인정보를 이용하 지 않습니다."),
                textStyle(
                    " ⑦ “몰”은 개인정보 보호를 위하여 이용자의 개인정보를 취급하는 자를 최소한으로 제한하여야 하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다."),
                textStyle(
                    " ⑧ “몰” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지 체 없이 파기합니다."),
                textStyle(
                    " ⑨ “몰”은 개인정보의 수집·이용·제공에 관한 동의 란을 미리 선 택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집·이용·제 공에 관한 이용자의 동의거절시 제한되는 서비스를 구체적으로 명 시하고, 필수수집항목이 아닌 개인정보의 수집·이용·제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거 나 거절하지 않습니다."),
                textStyle("제18조(“몰“의 의무)"),
                textStyle(
                    " ① “몰”은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재 화․용역을 제공하는데 최선을 다하여야 합니다."),
                textStyle(
                    " ② “몰”은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추 어야 합니다."),
                textStyle(
                    " ③ “몰”이 상품이나 용역에 대하여 「표시․광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시․광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다."),
                textStyle(" ④ “몰”은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발 송하지 않습니다."),
                textStyle("제19조(회원의 ID 및 비밀번호에 대한 의무)"),
                textStyle(" ① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회 원에게 있습니다."),
                textStyle(" ② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안 됩니다."),
                textStyle(
                    " ③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하 고 있음을 인지한 경우에는 바로 “몰”에 통보하고 “몰”의 안내가 있 는 경우에는 그에 따라야 합니다."),
                textStyle(
                    "제20조(이용자의 의무) 이용자는 다음 행위를 하여서는 안 됩니다. \n\n   1. 신청 또는 변경시 허위 내용의 등록 \n   2. 타인의 정보 도용 \n   3. “몰”에 게시된 정보의 변경 \n   4. “몰”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시 \n   5. “몰” 기타 제3자의 저작권 등 지적재산권에 대한 침해 \n   6. “몰” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위 \n   7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하 는 정보를 몰에 공개 또는 게시하는 행위 제21조(연결“몰”과 피연결“몰” 간의 관계)"),
                textStyle(
                    " ① 상위 “몰”과 하위 “몰”이 하이퍼링크(예: 하이퍼링크의 대상에 는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자 를 연결 “몰”(웹 사이트)이라고 하고 후자를 피연결 “몰”(웹사이트) 이라고 합니다."),
                textStyle(
                    " ② 연결“몰”은 피연결“몰”이 독자적으로 제공하는 재화 등에 의하 여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결“몰”의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다."),
                textStyle("제22조(저작권의 귀속 및 이용제한)"),
                textStyle(" ① “몰“이 작성한 저작물에 대한 저작권 기타 지적재산권은 ”몰“에 귀속합니다."),
                textStyle(
                    " ② 이용자는 “몰”을 이용함으로써 얻은 정보 중 “몰”에게 지적재산 권이 귀속된 정보를 “몰”의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용 하게 하여서는 안됩니다."),
                textStyle(
                    " ③ “몰”은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다."),
                textStyle("제23조(분쟁해결)"),
                textStyle(
                    "① “몰”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치․운영합니다."),
                textStyle(
                    "② “몰”은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자 에게 그 사유와 처리일정을 즉시 통보해 드립니다."),
                textStyle(
                    "③ “몰”과 이용자 간에 발생한 전자상거래 분쟁과 관련하여 이용자 의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시·도지사 가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다."),
                textStyle("제24조(재판권 및 준거법)"),
                textStyle(
                    " ① “몰”과 이용자 간에 발생한 전자상거래 분쟁에 관한 소송은 제 소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관 할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주 소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송 법상의 관할법원에 제기합니다."),
                textStyle(" ② “몰”과 이용자 간에 제기된 전자상거래 소송에는 한국법을 적용 합니다."),
              ],
            ),
          )
        : policyName == "개인정보 처리 방침"
            ? Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textStyle(
                        "니들크루(이하 ‘니들크루’이라 함)는 정보주체의 개인정보를 중시하며,「정보통신망 이용촉진 및 정보보호에 관한 법률」및「개인정보보호법」을 준수합니다. 니들크루는 개인정보 처리방침을 통해 니들크루가 정보주체로부터 제공받은 개인정보를 어떠한 용도와 방식으로 이용하고 있으며, 개인정보를 위해 어떠한 조치를 취하고 있는지 알려드립니다. 개인정보 처리방침 개정 시에는 앱 공지사항을 통하여 공시하겠습니다."),
                    textStyle("1. 개인정보의 처리 목적"),
                    textStyle(
                        "니들크루는 수집한 개인정보를 다음의 목적을 위해 활용합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용하지 않으며 이용 목적이 변경될 경우에는 사전 동의를 받아 처리할 것입니다."),
                    textStyle(
                        "1) 회원 관리\n회원제 서비스 이용에 따른 본인확인, 개인식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 불만처리 등 민원처리, 고지사항 전달"),
                    textStyle(
                        "2) 마케팅 및 광고에 활용\n신규 서비스 개발과 이벤트 행사에 따른 정보 전달 및 맞춤 서비스 제공, 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계"),
                    textStyle(
                        " ③ ‘회원’이라 함은 “니들크루”에 회원등록을 한 자로서, 계속적으 로 “니들크루”가 제공하는 서비스를 이용할 수 있는 자를 말합니다."),
                    textStyle("3) 고객지원\n각종 문의에 대한 지원"),
                    textStyle("2. 개인정보의 처리 및 보유 기간"),
                    textStyle(
                        "니들크루에서 처리하는 개인정보는 수집·이용 목적으로 명시한 범위 내에서 처리·보유합니다. 니들크루는 개인정보보호법 및 관련 법령에서 정하는 보유기간을 준수하며 정보주체의 삭제요구와 가입탈퇴 신청이 있을 경우 지체 없이 파기합니다. 단, 상법 등 관련법령의 규정에 의하여 보존할 필요가 있는 경우 포럼은 아래와 같이 관계법령에서 정한 일정기간 동안 보유합니다."),
                    textStyle(
                        "− 계약 또는 청약 철회, 대금결제, 재화 등의 공금 기록 (전자상거래 등에서의 소비자보호에 관한 법률): 5년 는\n− 소비자의 불만 또는 분쟁처리에 관한 기록 (전자상거래 등에서의 소비자보호에 관한 법률): 3년 \n− 표시·광고에 관한 기록 (전자상거래 등에서의 소비자보호에 관한 법률): 6개월 \n− 정보주체의 인터넷 등 로그기록자료 (통신비밀보호법에 관한 법률): 3개월 \n− 컴퓨터 통신, 인터넷 로그기록자료, 접속지 추적자료(통신비밀보호법에 관한 법률): 3개월"),
                    textStyle(
                        "3. 개인정보의 제3자 제공에 관한 사항"),
                    textStyle(
                        "니들크루는 수집·보유하고 있는 개인정보를 원칙적으로 외부에 제공하지 않으며, 다음의 경우에는 개인정보를 제3자에게 제공할 수 있습니다."),
                    textStyle(
                        "1) 정보주체로부터 별도의 동의를 받은 경우\n2) 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우\n 3) 정보주체 또는 그 법정대리인이 의사표시를 할 수 없는 상태에 있거나 주소불명 등으로 사전 동의를 받을 수 없는 경우로서 명백히 정보 주체 또는 제3자의 급박한 생명, 신체, 재산의 이익을 위하여 필요하다고 인정되는 경우"),
                    textStyle("4. 개인정보의 권리·의무 및 그 행사방법에 관한 사항"),
                    textStyle(
                        "이용자는 정보주체로서 개인정보 관련하여, 언제든지 개인정보 열람, 정정, 삭제, 처리정지 등의 권리를 행사할 수 있습니다."),
                    textStyle(
                        "단, 다음에 해당하는 경우 니들크루는 개인정보의 열람, 정정, 삭제, 처리정지를 거절할 수 있습니다."),
                    textStyle(
                        "− 법률에 따라 열람이 금지되거나 제한되는 경우\n− 다른 사람의 생명·신체를 해할 우려가 있거나 다른 사람의 재산과 그 밖의 이익을 부당하게 침해할 우려가 있는 경우"),
                    textStyle(
                        "이용자의 개인정보 열람·정정을 위해서는 '개인정보변경'(또는 '회원정보수정' 등)을 가입해지(동의철회)를 위해서는 '"'회원탈퇴'"'를 통하여 본인 확인 절차를 거치신 후 탈퇴할 수 있습니다. 혹은 개인정보보호담당자에게 서면, 전화 또는 이메일로 연락하시면 지체 없이 조치하겠습니다. 회원 탈퇴 시, 직접 작성하신 게시물은 자동적으로 삭제되지 않으니, 게시물 등의 삭제를 원하시는 경우 반드시 직접 삭제를 하신 후 회원탈퇴를 해주시기 바랍니다. 이용자가 개인정보 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제 3자에게 제공하지 않겠습니다. 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체없이 통지하겠습니다."),
                    textStyle("5. 처리하는 개인정보의 항목"),
                    textStyle(
                        "1) 수집하는 개인정보의 항목\n니들크루는 이용자의 동의에 의해 다음의 개인정보 항목을 처리하고 있습니다."),
                    textStyle(
                        "(1) 앱 회원가입 및 관리\n− 필수항목: 이름, 로그인 e-mail, 비밀번호, 성별, 휴대폰 번호"),
                    textStyle(
                        "※ 니들크루는 인종, 종교, 사상, 신조, 정치적 성향 및 범죄기록 등 이용자의 인권을 침해할 우려가 있는 개인정보는 수집하지 않습니다."),
                    textStyle("2) 개인정보 수집 방법\n니들크루는 아래의 방법으로 개인정보를 수집하며 ‘동의’ 또는 ‘거부’ 버튼을 클릭하는 절차를 통하여 개인정보 수집에 대한 동의를 받고 있습니다."),
                    textStyle(
                        "− 앱 내 회원가입"),
                    textStyle(
                        "6. 개인정보의 파기에 관한 사항"),
                    textStyle("니들크루는 원칙적으로 개인정보의 보유기간이 경과했거나 처리목적이 달성된 경우에는 지체 없이 해당 개인정보를 파기합니다 파기의 절차, 기한 및 방법은 다음과 같습니다."),
                    textStyle(
                        "1) 파기절차\n이용자가 입력한 정보는 보유기간이 경과했거나 처리목적이 달성된 후 내부 방침 및 관련 법령에 따라 파기합니다.\n2) 파기방법\n− 전자적 파일 형태인 경우 : 복원이 불가능한 방법으로 영구 삭제\n− 전자적 파일의 형태 외의 기록물, 인쇄물, 서면, 그 밖의 기록매체인 경우 : 파쇄 또는 소각"),
                    textStyle("7. 만14세 미만 아동의 개인정보 보호"),
                    textStyle("니들크루는 14세 이상 내국인을 대상으로 하기 때문에 원칙적으로 만14세 미만 아동의 회원가입을 통한 개인정보 수집 및 이용을 하지 않습니다."),
                    textStyle(
                        "8. 개인정보 보호책임자에 관한 사항"),textStyle(
                        "니들크루 이용자의 개인정보를 보호하고 개인정보와 관련된 불만을 처리하기 위해 아래와 같이 관련 부서 및 개인정보관리 책임자를 지정하고 있습니다."),
                    textStyle(
                        "개인정보보호 담당 및 책임자\n성명: 김현영 대표\n전화번호 : 010-2770-1796\n이메일: 000000"),
                    textStyle(
                        "이용자는 니들크루의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보보호 책임자 혹은 담당부서로 신고하실 수 있습니다. 포럼은 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다."),
                    textStyle(
                        "기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다."),
                    textStyle("− 개인정보침해신고센터 (www.118.or.kr / 118)\n− 정보보호마크인증위원회 (www.eprivacy.or.kr / 02-580-0533~4)\n− 대검찰청 첨단범죄수사과 (www.spo.go.kr / 02-3480-2000)\n− 경찰청 사이버테러대응센터 (www.ctrc.go.kr / 02-392-0330)"),
                    textStyle(
                        "9. 개인정보 처리방침의 변경에 관한 사항"),
                    textStyle(
                        "이 개인정보 처리방침은 2022년 3월 2일부터 적용됩니다."),
                  ],
                ),
              )
            : Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textStyle("제1조(목적)"),
                    textStyle(
                        "이 약관은 김현영(대표)가 운영하는 사이버 몰(이하 “니들크루”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리.의무 및 책임사항을 규정 함을 목적으로 합니다."),
                    textStyle(
                        "※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질 에 반하지 않는 한 이 약관을 준용합니다.」 "),
                    textStyle("제2조(정의)"),
                    textStyle(
                        " ① “니들크루”이란 김현영(대표)가 재화 또는 용역(이하 “재화 등” 이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하 며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다. "),
                    textStyle(
                        " ② “이용자”란 “니들크루”에 접속하여 이 약관에 따라 “니들크루” 가 제공하는 서비스를 받는 회원을 말합니다."),
                    textStyle(
                        " ③ ‘회원’이라 함은 “니들크루”에 회원등록을 한 자로서, 계속적으 로 “니들크루”가 제공하는 서비스를 이용할 수 있는 자를 말합니다."),
                    textStyle("제3조 (약관 등의 명시와 설명 및 개정)"),
                    textStyle(
                        " ① “니들크루”는 이 약관의 내용과 상호 및 대표자 성명, 영업소 소 재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화 번호․모사전송번호․전자우편주소, 사업자등록번호, 통신판매업 신 고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 니들 크루 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관 의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다."),
                    textStyle(
                        " ② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회․배송책임․환불조건 등과 같은 중요한 내용을 이용 자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하 여 이용자의 확인을 구하여야 합니다."),
                    textStyle(
                        " ③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비 자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다."),
                    textStyle(
                        " ④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하 여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적 용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용 을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공 지합니다. 이 경우 “몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다."),
                    textStyle(
                        " ⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이 후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대 해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항 에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다."),
                    textStyle(
                        " ⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관 한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보 호지침 및 관계법령 또는 상관례에 따릅니다."),
                    textStyle("제4조(서비스의 제공 및 변경)"),
                    textStyle(
                        " ① “몰”은 다음과 같은 업무를 수행합니다. \n\n   1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결 \n   2. 구매계약이 체결된 재화 또는 용역의 배송\n   3. 기타 “몰”이 정하는 업무"),
                    textStyle(
                        " ② “몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경 우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다."),
                    textStyle(
                        " ③ “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재 화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다."),
                    textStyle(
                        " ④ 전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합 니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그 러하지 아니합니다."),
                    textStyle("제5조(서비스의 중단)"),
                    textStyle(
                        " ① “몰”은 컴퓨터 등 정보통신설비의 보수점검․교체 및 고장, 통신 의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다."),
                    textStyle(
                        " ② “몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으 로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니 합니다."),
                    textStyle(
                        " ③ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비 스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에 게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에 는 이용자들의 마일리지 또는 적립금 등을 “몰”에서 통용되는 통화 가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다."),
                    textStyle("제6조(회원가입)"),
                    textStyle(
                        " ① 이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다."),
                    textStyle(
                        " ② “몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다. \n\n   1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격 을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다. \n   2. 등록 내용에 허위, 기재누락, 오기가 있는 경우 \n   3. 기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있 다고 판단되는 경우"),
                    textStyle(" ③ 회원가입계약의 성립 시기는 “몰”의 승낙이 회원에게 도달한 시 점으로 합니다."),
                    textStyle(
                        " ④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기 간 이내에 “몰”에 대하여 회원정보 수정 등의 방법으로 그 변경사항 을 알려야 합니다."),
                    textStyle("제7조(회원 탈퇴 및 자격 상실 등)"),
                    textStyle(
                        " ① 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다."),
                    textStyle(
                        " ② 회원이 다음 각 호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다. \n\n   1. 가입 신청 시에 허위 내용을 등록한 경우 \n   2. “몰”을 이용하여 구입한 재화 등의 대금, 기타 “몰”이용에 관련 하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우 \n   3. 다른 사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등 전 자상거래 질서를 위협하는 경우 4. “몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우"),
                    textStyle(
                        " ③ “몰”이 회원 자격을 제한․정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “몰”은 회원자격을 상실시킬 수 있습니다."),
                    textStyle(
                        " ④ “몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니 다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30 일 이상의 기간을 정하여 소명할 기회를 부여합니다."),
                    textStyle("제8조(회원에 대한 통지)"),
                    textStyle(
                        " ① “몰”이 회원에 대한 통지를 하는 경우, 회원이 “몰”과 미리 약정 하여 지정한 전자우편 주소로 할 수 있습니다."),
                    textStyle(
                        " ② “몰”은 불특정다수 회원에 대한 통지의 경우 1주일이상 “몰” 게 시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개 별통지를 합니다."),
                    textStyle("제9조(구매신청 및 개인정보 제공 동의 등)"),
                    textStyle(
                        " ① “몰”이용자는 “몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “몰”은 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다. \n\n   1. 재화 등의 검색 및 선택 \n   2. 받는 사람의 성명, 주소, 전화번호, 전자우편주소(또는 이동전 화번호) 등의 입력 \n   3. 약관내용, 청약철회권이 제한되는 서비스, 배송료․설치비 등 의 비용부담과 관련한 내용에 대한 확인 \n   4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표 시 (예, 마우스 클릭) \n   5. 재화등의 구매신청 및 이에 관한 확인 또는 “몰”의 확인에 대 한 동의 \n   6. 결제방법의 선택"),
                    textStyle(
                        " ② “몰”이 제3자에게 구매자 개인정보를 제공할 필요가 있는 경우 1) 개인정보를 제공받는 자, 2)개인정보를 제공받는 자의 개인정보 이용목적, 3) 제공하는 개인정보의 항목, 4) 개인정보를 제공받는 자 의 개인정보 보유 및 이용기간을 구매자에게 알리고 동의를 받아야 합니다. (동의를 받은 사항이 변경되는 경우에도 같습니다.)"),
                    textStyle(
                        " ③ “몰”이 제3자에게 구매자의 개인정보를 취급할 수 있도록 업무 를 위탁하는 경우에는 1) 개인정보 취급위탁을 받는 자, 2) 개인정보 취급위탁을 하는 업무의 내용을 구매자에게 알리고 동의를 받아야 합니다. (동의를 받은 사항이 변경되는 경우에도 같습니다.) 다만, 서 비스제공에 관한 계약이행을 위해 필요하고 구매자의 편의증진과 관련된 경우에는 「정보통신망 이용촉진 및 정보보호 등에 관한 법 률」에서 정하고 있는 방법으로 개인정보 취급방침을 통해 알림으 로써 고지절차와 동의절차를 거치지 않아도 됩니다."),
                    textStyle("제10조 (계약의 성립)"),
                    textStyle(
                        " ① “몰”은 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하 면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법 정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다. \n\n   1. 신청 내용에 허위, 기재누락, 오기가 있는 경우 \n   2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우 \n   3. 기타 구매신청에 승낙하는 것이 “몰” 기술상 현저히 지장이 있 다고 판단하는 경우"),
                    textStyle(
                        " ② “몰”의 승낙이 제12조제1항의 수신확인통지형태로 이용자에 게 도달한 시점에 계약이 성립한 것으로 봅니다."),
                    textStyle(
                        " ③ “몰”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함 하여야 합니다."),
                    textStyle(
                        "제11조(지급방법) “몰”에서 구매한 재화 또는 용역에 대한 대금지 급방법은 다음 각 호의 방법중 가용한 방법으로 할 수 있습니다. 단, “몰”은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목 의 수수료도 추가하여 징수할 수 없습니다. \n\n   1. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체 \n   2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제 \n   3. 온라인무통장입금 \n   4. 전자화폐에 의한 결제 \n   5. 수령 시 대금지급 \n   6. 마일리지 등 “몰”이 지급한 포인트에 의한 결제 \n   7. “몰”과 계약을 맺었거나 “몰”이 인정한 상품권에 의한 결제 \n   8. 기타 전자적 지급 방법에 의한 대금 지급 등 제12조(수신확인통지․구매신청 변경 및 취소)"),
                    textStyle(" ① “몰”은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통 지를 합니다."),
                    textStyle(
                        " ② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경 우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청 할 수 있고 “몰”은 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다."),
                    textStyle("제13조(재화 등의 공급)"),
                    textStyle(
                        " ① “몰”은 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, “몰”이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금 의 전부 또는 일부를 받은 날부터 3영업일 이내에 조치를 취합니다. 이때 “몰”은 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다."),
                    textStyle(
                        " ② “몰”은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비 용 부담자, 수단별 배송기간 등을 명시합니다. 만약 “몰”이 약정 배 송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 “몰”이 고의․과실이 없음을 입증한 경우에는 그러하지 아니합니다."),
                    textStyle(
                        "제14조(환급) “몰”은 이용자가 구매신청한 재화 등이 품절 등의 사 유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용 자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받 은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다."),
                    textStyle("제15조(청약철회 등)"),
                    textStyle(
                        " ① “몰”과 재화등의 구매에 관한 계약을 체결한 이용자는 「전자 상거래 등에서의 소비자보호에 관한 법률」 제13조 제2항에 따른 계약내용에 관한 서면을 받은 날(그 서면을 받은 때보다 재화 등의 공급이 늦게 이루어진 경우에는 재화 등을 공급받거나 재화 등의 공 급이 시작된 날을 말합니다)부터 7일 이내에는 청약의 철회를 할 수 있습니다. 다만, 청약철회에 관하여 「전자상거래 등에서의 소비자 보호에 관한 법률」에 달리 정함이 있는 경우에는 동 법 규정에 따릅니다."),
                    textStyle(
                        " ② 이용자는 재화 등을 배송 받은 경우 다음 각 호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다. \n\n   1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우 (다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다) \n   2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우 \n   3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치 가 현저히 감소한 경우 \n   4. 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재 화 등의 포장을 훼손한 경우"),
                    textStyle(
                        " ③ 제2항제2호 내지 제4호의 경우에 “몰”이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상 품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다."),
                    textStyle(
                        " ④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있 었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다."),
                    textStyle("제16조(청약철회 등의 효과)"),
                    textStyle(
                        " ① “몰”은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우 “몰”이 이용자 에게 재화등의 환급을 지연한때에는 그 지연기간에 대하여 「전자 상거래 등에서의 소비자보호에 관한 법률 시행령」제21조의2에서 정하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다."),
                    textStyle(
                        " ② “몰”은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전 자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없 이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구 를 정지 또는 취소하도록 요청합니다."),
                    textStyle(
                        " ③ 청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. “몰”은 이용자에게 청약철회 등을 이유로 위 약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표 시·광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등 을 하는 경우 재화 등의 반환에 필요한 비용은 “몰”이 부담합니다."),
                    textStyle(
                        " ④ 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 “몰” 은 청약철회 시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다."),
                    textStyle("제17조(개인정보보호)"),
                    textStyle(
                        " ① “몰”은 이용자의 개인정보 수집시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다."),
                    textStyle(
                        " ② “몰”은 회원가입시 구매계약이행에 필요한 정보를 미리 수집하 지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 개인정보를 수집하는 경우에는 그러하지 아니합니다."),
                    textStyle(
                        " ③ “몰”은 이용자의 개인정보를 수집·이용하는 때에는 당해 이용 자에게 그 목적을 고지하고 동의를 받습니다."),
                    textStyle(
                        " ④ “몰”은 수집된 개인정보를 목적외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용·제공단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받 습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다."),
                    textStyle(
                        " ⑤ “몰”이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경 우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련 사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 「정보통신 망 이용촉진 및 정보보호 등에 관한 법률」 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의 를 철회할 수 있습니다."),
                    textStyle(
                        " ⑥ 이용자는 언제든지 “몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “몰”은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 “몰”은 그 오류를 정정할 때까지 당해 개인정보를 이용하 지 않습니다."),
                    textStyle(
                        " ⑦ “몰”은 개인정보 보호를 위하여 이용자의 개인정보를 취급하는 자를 최소한으로 제한하여야 하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다."),
                    textStyle(
                        " ⑧ “몰” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지 체 없이 파기합니다."),
                    textStyle(
                        " ⑨ “몰”은 개인정보의 수집·이용·제공에 관한 동의 란을 미리 선 택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집·이용·제 공에 관한 이용자의 동의거절시 제한되는 서비스를 구체적으로 명 시하고, 필수수집항목이 아닌 개인정보의 수집·이용·제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거 나 거절하지 않습니다."),
                    textStyle("제18조(“몰“의 의무)"),
                    textStyle(
                        " ① “몰”은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재 화․용역을 제공하는데 최선을 다하여야 합니다."),
                    textStyle(
                        " ② “몰”은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추 어야 합니다."),
                    textStyle(
                        " ③ “몰”이 상품이나 용역에 대하여 「표시․광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시․광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다."),
                    textStyle(
                        " ④ “몰”은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발 송하지 않습니다."),
                    textStyle("제19조(회원의 ID 및 비밀번호에 대한 의무)"),
                    textStyle(
                        " ① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회 원에게 있습니다."),
                    textStyle(" ② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안 됩니다."),
                    textStyle(
                        " ③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하 고 있음을 인지한 경우에는 바로 “몰”에 통보하고 “몰”의 안내가 있 는 경우에는 그에 따라야 합니다."),
                    textStyle(
                        "제20조(이용자의 의무) 이용자는 다음 행위를 하여서는 안 됩니다. \n\n   1. 신청 또는 변경시 허위 내용의 등록 \n   2. 타인의 정보 도용 \n   3. “몰”에 게시된 정보의 변경 \n   4. “몰”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시 \n   5. “몰” 기타 제3자의 저작권 등 지적재산권에 대한 침해 \n   6. “몰” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위 \n   7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하 는 정보를 몰에 공개 또는 게시하는 행위 제21조(연결“몰”과 피연결“몰” 간의 관계)"),
                    textStyle(
                        " ① 상위 “몰”과 하위 “몰”이 하이퍼링크(예: 하이퍼링크의 대상에 는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자 를 연결 “몰”(웹 사이트)이라고 하고 후자를 피연결 “몰”(웹사이트) 이라고 합니다."),
                    textStyle(
                        " ② 연결“몰”은 피연결“몰”이 독자적으로 제공하는 재화 등에 의하 여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결“몰”의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다."),
                    textStyle("제22조(저작권의 귀속 및 이용제한)"),
                    textStyle(" ① “몰“이 작성한 저작물에 대한 저작권 기타 지적재산권은 ”몰“에 귀속합니다."),
                    textStyle(
                        " ② 이용자는 “몰”을 이용함으로써 얻은 정보 중 “몰”에게 지적재산 권이 귀속된 정보를 “몰”의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용 하게 하여서는 안됩니다."),
                    textStyle(
                        " ③ “몰”은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다."),
                    textStyle("제23조(분쟁해결)"),
                    textStyle(
                        "① “몰”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치․운영합니다."),
                    textStyle(
                        "② “몰”은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자 에게 그 사유와 처리일정을 즉시 통보해 드립니다."),
                    textStyle(
                        "③ “몰”과 이용자 간에 발생한 전자상거래 분쟁과 관련하여 이용자 의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시·도지사 가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다."),
                    textStyle("제24조(재판권 및 준거법)"),
                    textStyle(
                        " ① “몰”과 이용자 간에 발생한 전자상거래 분쟁에 관한 소송은 제 소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관 할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주 소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송 법상의 관할법원에 제기합니다."),
                    textStyle(" ② “몰”과 이용자 간에 제기된 전자상거래 소송에는 한국법을 적용 합니다."),
                  ],
                ),
              );
  }

  Widget textStyle(String text) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Text(
        text,
        style: TextStyle(
          color: HexColor("#707070"),
          fontSize: 12,
        ),
      ),
    );
  }
}
