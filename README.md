# HSYHarryPotterBookSeries 

Ch 3. 앱 개발 입문 주차 과제

---

## 주요 기능

- **책 정보 표시**


- **summary "더보기/접기" 기능**
  - 요약 텍스트가 일정 길이(450자) 이상인 경우, 말줄임표와 "더보기" 버튼 표시
  - "더보기" 버튼을 누르면 전체 요약이 표시되고, "접기" 버튼으로 변경됨

- **시리즈 버튼을 통한 책 선택**
  - 가로로 1부터 7까지의 시리즈 버튼을 표시하여, 버튼을 눌렀을 때 해당 번호의 책 데이터를 불러옴
  - Delegate 패턴을 사용해 버튼 클릭 이벤트를 ViewController에서 처리

- **에러 처리**
  - 데이터 로드 실패 시, UIAlertController를 통해 오류 메시지를 표시하고 앱 종료 기능 제공

---

## 실행 영상

![ezgif-5b22e50bdac7fb](https://github.com/user-attachments/assets/a353468b-5acf-42f5-b249-c057ff799be5)


---

## 아키텍처

### MVC 패턴

- **Model**
  - `DataService`: 책 데이터를 로드하는 역할
  - `SummaryStateModel`: 요약 텍스트의 더보기/접기 상태를 UserDefaults에 저장 및 관리

- **View**
  - `BookView`: 전체 레이아웃을 구성하는 뷰. 스택뷰(`BookInfoStackView`, `BookDedicationStackView`, `BookSummaryStackView`, `BookChapterStackView`, `seriesStackView`)를 포함

- **Controller**
  - `ViewController`: 데이터 로드, 뷰 업데이트, 버튼 클릭 이벤트 처리 및 에러 핸들링을 담당

---

## 설치 및 실행

**iOS 16이상 기기에서 실행 가능**

---

## 트러블 슈팅

- **info.plist 이동 오류**
  - [링크](https://johello.tistory.com/28)
- **버튼 관련 트러블 슈팅**
  - [링크](https://johello.tistory.com/29)



