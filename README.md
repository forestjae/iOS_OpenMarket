## iOS 커리어 스타터 캠프

## 오픈마켓

## 학습 키워드
- `Subclassing`
- `ModernCollection View`
- `URLCache`

## 구현 내용
![Simulator Screen Recording - iPhone 13 Pro - 2022-01-26 at 20 19 35-min](https://user-images.githubusercontent.com/76479760/151154961-cc823479-2e2c-4186-9555-3e0b02c05b75.gif)

![Simulator Screen Recording - iPhone 13 Pro - 2022-01-26 at 20 38 09](https://user-images.githubusercontent.com/76479760/151156952-7eb8b118-f73e-4298-bcc1-0aec27f40094.gif)

- `URLCache` 를 사용한 이미지 캐싱을 구현하였습니다.
- 상품 수정/등록화면의 상위 클래스인 ManageProductVC를 만들고 수정/등록 화면은 상속을 통하여 구현했습니다.
- 300KB 가 넘는 이미지는 이미지 등록시점에 압축합니다.
- 상품등록 화면에서 등록할 이미지를 보여주는 콜렉션 뷰는 Horizontal ModernCollectionView를 사용하여 구현하였습니다.
- 상품등록 화면에서 입력한 요소들이 적절한지를 검증하는 별도의 메서드를 만들었습니다.
    - 해당 검증을 통과하지 못하면 Alert으로 어느부분이 통과하지 못했는지 알려줍니다.
    - 검증을 통과하면 상품 등록 네트워킹을 진행합니다.
- 상품등록이 성공하면 Alert으로 알려주고, Alert의 확인버튼을 누르면 상품카탈로그 화면으로 돌아가면서 자동 업데이트 됩니다.
- 텍스트 뷰에서 현재 커서위치에 따라 내용이 가리지 않게 화면을 조정하는 기능을 구현했습니다.
- 상속을 활용하여 공통기능을 갖는 ProductUpadateViewController를 두고 각각의 뷰컨들을 서브클래싱하였습니다.

# 고민한 내용
### 캐싱

캐싱의 경우 용량이 큰 이미지에 대해서만 진행하였습니다. Caching 정책과 디스크 Chacing을 쉽게 설정해 줄 수 있는 `URLCache` 를 사용하여 구현하였습니다. 

### 컬렉션 뷰

오픈마켓1 프로젝트와 마찬가지로 모던 컬렉션 뷰를 사용하여 상품등록화면에서의 이미지 컬렉션 뷰를 구현하였습니다. 다만 Horizontal 컬렉션 뷰이기 때문에 CompositionalLayout에서의 Scroll Direction Configuration을 Horizontal로 지정해야 된다는것을 간과해서 엄청 헤맸네요 😂

### 입력내용 검증

상품등록 화면에서 입력내용을 검증하는것을 별도의 타입에서 진행하도록 하였습니다. 일부 항목에 대해서 검증을하는것이 아닌 전체 항목에 대해서 한꺼번에 검사를 하고 부족한 부분을 Alert으로 띄워주었습니다.

# 해결이 되지 않은 점

### 텍스트 뷰 키보드 대응

 TextViewDelegate와 CaretRect메서드를 사용하여 현재 커서의 위치를 추적하여 키보드에 내용이 가리지 않게 구현했습니다. 다만, 아래와 같이 다른곳을 터치하여 textview의 편집이 끝난 후 다시 textView로 focus를 가져가게 되면 기존에 입력된 offset값이 저장되어 있는건지 원하는대로 동작하지 않는 현상이 발생합니다. textView.caretRect(for: start)부분에서 textview의 foucs를 해제하기 이전의 offset값을 한번 반환 주어서 발생하는 문제로 보여 임시방편으로 DispatchQueue를 활용하 딜레이를 주어 임시방편으로 해결하였습니다.

![Simulator Screen Recording - iPhone 13 Pro - 2022-01-26 at 20 46 01](https://user-images.githubusercontent.com/76479760/151157933-0cd21e49-19a1-446a-be54-fe3f7b81807f.gif)


