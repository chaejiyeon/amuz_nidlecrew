class FixReady {
  final String fixState;  // ready : 수선대기. progress : 수선 진행중, complete : 수선 완료
  final String fixDate;
  final String fixType;

  // 수선 대기 진행 상황 표기
  final int readyInfo;

  FixReady(this.fixState, this.fixDate, this.fixType, this.readyInfo);

}

List<FixReady> useLists = [
  FixReady("complete", "2021.12.15 수", "일반바지(A1123)", 0),
  FixReady("complete", "2021.12.15 수", "일반바지(A1123)", 0),
  FixReady("complete", "2021.12.15 수", "일반바지(A1123)", 0),
];