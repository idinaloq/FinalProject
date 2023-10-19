# 📓 서울시 시영주차장 주차정보 앱
## 서울시 시영주차장 정보를 지도를 통해 확인할 수 있습니다.

**핵심 개념 및 경험**
 
- **네이버 지도API**
  - 네이버 지도를 이용해서 주차장 표시하기
- **subscript**
    - subscript 문법을 사용해서 안전하게 배열 조회하기
- **git-lfs**
    - 100mb 넘어가는 파일을 git에 pull, push가 가능
- **Cocoa Pods, homebrew**
    - 패키지 관리자를 사용해서 패키지 추가,관리하기

**프로젝트 기간 : 23.10.10 ~ 23.10.20**

</br>

## 📖 목차
1. [팀원 소개](#1.)
2. [타임 라인](#2.)
3. [시각화 구조](#3.)
4. [실행 화면](#4. )
5. [트러블 슈팅](#5.)
6. [참고 자료](#6.)
7. [팀 회고](#7.)

<a id="1."></a></br>
## 👨‍💻 팀원 소개
<Img src = "https://user-images.githubusercontent.com/109963294/235301015-b81055d2-8618-433c-b680-58b6a38047d9.png" width ="200" height="200"/>|
|:-:|
[**idinaloq**](https://github.com/idinaloq)|

<a id="2."></a></br>
## ⏰ 타임 라인
|날짜|내용|
|:--:|--|
|2023.10.10|서울시 시영주차장 API DTO 추가|
|2023.10.11|API모델 프로퍼티 이름 수정<br> JsonDecoder모델 생성<br> HTTP허용하도록 ATS설정 변경<br> HTTPRequest 구현|
|2023.10.13|카카오API추가 및 아키텍처 arm64로 변경<br> 카카오맵 테스트|
|2023.10.14|로딩뷰 생성<br>주차장 목록, 맵 분리|
|2023.10.15|NavigationController로 목록으로 넘어가도록 수정<br>맵에 핀 추가 테스트|
|2023.10.16|모든 주차장 데이터 받아오는 로직 작성<br>데이터를 받아올 때 로딩 화면을 보여주도록 수정|
|2023.10.17|모든 주차장 데이터 받아오는 로직 구현<br>맵에 핀 추가 테스트|
|2023.10.19~20|카카오맵 -> 네이버 맵으로 변경하기위해 프로젝트 다시 생성<br> 기존 파일 옮김 및 프로젝트 설정 변경<br> 네이버 맵 pod으로 추가<br> 마커 추가부분 구현<br> 중복된 데이터 제거 및 현재 화면의 마커 데이터를 저장하는 로직 추가<br>리스트로 받아온 데이터 구현 및 리팩토링|

<a id="3."></a></br>
## 👀 시각화 구조
### 1. File Tree
    FinalProject
    ├── API
    │   └── SeoulOpenAPI
    │       ├── GetParkingInformation.swift
    │       ├── ResultCode.swift
    │       ├── Row.swift
    │       └── SeoulParkingInformationModel.swift
    ├── Application
    │   ├── AppDelegate.swift
    │   └── SceneDelegate.swift
    ├── Base.lproj
    ├── Controller
    │   ├── HomeViewController.swift
    │   └── ListViewController.swift
    ├── Extension
    │   └── Array+.swift
    ├── Info.plist
    ├── Model
    │   ├── JsonDecoder.swift
    │   ├── NetworkService.swift
    │   └── SeoulOpenAPI
    │       └── SeoulOpenAPI.swift
    ├── Resource
    │   ├── Assets.xcassets
    │   │   ├── AccentColor.colorset
    │   │   │   └── Contents.json
    │   │   ├── AppIcon.appiconset
    │   │   │   └── Contents.json
    │   │   └── Contents.json
    │   └── Info.plist
    └── View
        ├── Base.lproj
        │   └── LaunchScreen.storyboard
        ├── LoadingView.swift
        └── ParkingListCell.swift


### 2. 클래스 다이어그램
(추가예정)

<a id="4."></a></br>
## 💻 실행화면

|앱 초기 실행|지도화면|주차장 목록보기|
|:-----:|:-----------:|:--------:|
|<Img src = "https://github.com/idinaloq/testRep/assets/124647187/ffba0923-1823-4328-a5c8-1d7c09e24fdc" width = "300">|<Img src = "https://github.com/idinaloq/testRep/assets/124647187/be52a169-6db5-486c-98b6-c786327440cd" width = "300">|<Img src = "https://github.com/idinaloq/testRep/assets/124647187/3eb0c30a-0b11-4f1d-97e5-82942999263b" width = "300">|

<a id="5."></a></br>
## 🧨 트러블 슈팅

### 1️⃣ 받아올 수 있는 데이터 갯수 제한
⚠️ **문제점** <br>
- 한 번에 받아올 수 있는 데이터의 갯수가 1000개로 제한이 되어 있는 상태에서, 받아야되는 데이터의 갯수가 1.7만개가 넘어서 총 18번으로 나눠서 데이터를 받아와야 했습니다.

✅ **해결방법** <br>
- 데이터를 받아올 때 마다 데이터 총 갯수를 받아올 수 있었기 때문에, 반복문을 사용하여 1000개씩 데이터의 총 갯수만큼 반복하도록 작성하였고, 이렇게 받아온 데이터를 기존 배열에 추가해서 사용하도록 했습니다.
***변경된 코드***
```swift
final class HomeViewController: UIViewController {
    ...
    while max < listCount {
          networkService.fetchData(request: urlRequest) { [weak self] data in
                ...
                if let _ = self?.parkingData {
                        self?.parkingData?.appendData(newRow: decodedData)
                    } else {
                        self?.parkingData = decodedData
                        listCount = decodedData.getParkingInformation.listTotalCount
                    }
                min += 1000
                max += 1000
                ...
        }
    }
}

struct SeoulParkingInformationModel: Decodable {
    var getParkingInformation: GetParkingInformation
    ...
    mutating func appendData(newRow: SeoulParkingInformationModel) {
        self.getParkingInformation.row.append(contentsOf: newRow.getParkingInformation.row)
    }
}

```

### 2️⃣ objective-c로 작성된 카카오맵(1)
⚠️ **문제점** <br>
- 카카오맵이 objective-c로 작성이 되어있기 때문에 아키텍처 설정을 arm64로 변경해야 됐습니다. 하지만 변경을 하니 `using an empty LLDB target which can cause slow memory reads from remote devices.`라는 오류가 발생했고, 초기 앱 구동시 시간이 오래 걸리게 되었습니다.

### 3️⃣ objective-c로 작성된 카카오맵(2)
⚠️ **문제점** <br>
- API가 objective-c로 작성되었기 때문에 모든 관련 문서가 swift가 아닌 objective-c 코드로 되어있었고, 관련 자료 역시 업데이트가 오랫동안 이루어지지 않아 보였습니다.
- 또한 받아온 데이터를 기반으로 맵에 마커(핀)을 설정했는데, 대략 200개가 넘어가는 순간 앱이 크래시가 나는 현상이 있었습니다.

✅ **해결방법** <br>
- 네이버맵이 swift를 지원하고, 관련된 자료들도 잘 정리되어있었기 때문에 네이버맵으로 변경하였습니다.

### 4️⃣ 이외의 문제점

**해결하지 못한 문제점**
1. 마커의 infoWindow 닫기
    - 마커 누르는 동작 취소하기
2. 무분별한 마커 간략화하기
    - 마커 하나를 누르면 겹쳐져있는 다른 마커들도 표시

**구현하지 못한 부분**
1. 주차장 상세정보
    - 주차장 리스트에서 셀을 눌렀을 때 주차장 상세정보
2. 새로고침
    - 실시간 주차가능대수 업데이트기능
3. 현재 위치를 기반으로 지도 사용
    - 시뮬레이터에서 구현은 어렵기 때문에 실제 디바이스로 테스트
4. 초기 구동 시 로딩화면에 시각적인 부분
    - 초기 로딩 시에 받아온 데이터 갯수를 시각적으로 표현
    - 또는 앱 사용 설명 등으로 사용자가 오랜 시간동안 기다리지 않도록

**개선점**
1. 주차장 정보 받아오는 로직
    - 데이터가 많을 때 효율적으로 받아서 소요시간 개선
2. 기존 MVC패턴 변경
    - 코드 분할로 인한 가독성, 재사용성 향상 및 무분별한 프로퍼티 선언 개선


<a id="6."></a></br>
## 📚 참고자료
- [𝗡 Naver Maps: `네이버 지도 SDK 사용하기`](https://navermaps.github.io/ios-map-sdk/guide-ko/1.html)
- [🌐 Blog: `네이버지도  API 사용하기`](https://velog.io/@mandos1995/Xcode-네이버-지도-API-사용하기)
- [🌐 Blog: `네이버지도  API 사용하기(2)`](https://blog.naver.com/PostView.naver?blogId=soojin_2604&logNo=222402500216&parentCategoryNo=&categoryNo=39&viewDate=&isShowPopularPosts=true&from=search)

