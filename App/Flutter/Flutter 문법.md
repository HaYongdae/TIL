# Flutter

> ![image-20200712011008833](C:\Users\YongDae\AppData\Roaming\Typora\typora-user-images\image-20200712011008833.png)

> 모든 것이 위젯 단위로 구성된다.
>
> 위젯은 아래와 같이 구분된다.
>
> 1. Stateful(속성 변경 가능) widget
>    -  그 자체는 변경이 불가능하지만, 변경된 상태를 State 클래스가 유지하는 구조
> 2. Stateless(속성 변경 불가) widget
>    - 모든 속성이 final변수

## 0. 위젯 ([위젯 카탈로그](https://flutter-ko.dev/docs/development/ui/widgets))

> ```dart
> flutter:
>   uses-material-design: true
> ```
>
> pubspec.yaml  파일에 위의 구문이 기재되어야 MatirialApp 위젯들을 사용할 수 있다.

### 0-1. 위젯의 종류

- matirialApp

  - center
  - text
  - row/ column
  - stack
  - container
  - icon
  - image
  - 스크롤페이지 등등
  - 

- 위젯 (

  ​           body : 위젯 (보통 Contaienr) 

  ​           child : 위젯

  ​		   children: <Widget> [ 위젯 list ]

  ​           ) 

- matirialApp을 사용하면 App 전체의 타이틀, home 설정, Appbar 및 bar 제목 설정 가능 



### 0-1_. 특수 위젯

- **ListView**

  ```dart
  Widget _buildList() => ListView(
        children: [
          _tile('title', 'subtitle', Icons.theaters),
         ],
  )
      
  ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
        title: Text(title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            )),
        subtitle: Text(subtitle),
        leading: Icon(
          icon,
          color: Colors.blue[500],
        ),
      );
  ```



위젯에 키API를 사용하면 위젯의 순서를 변경, 정렬할 수 있다.

키 개념 설명 : [링크](https://api.flutter.dev/flutter/foundation/Key-class.html)



- SizedBox,



### 0-2. 위젯의 속성

> Ex_
>
> ​	위젯(
>
> ​	속성  : 값
>
> ​	color : _lights ? Colors.yellow.shade600 : Colors.black,
>
> ​	)
>
> 각 위젯별 속성들이 존재한다. (정렬, 컬러, 위치 등은 공통 속성이다. : 웹과 동일)







### 0-3. 위젯의 GestureDetector

[class 설명 링크](https://api.flutter.dev/flutter/widgets/GestureDetector-class.html)

> EX_
>
> GestureDetector(
>
> ​		onTap: () { 실행 내용 },
>
> ​        child : Container (내용)
>
> )
>
> 위의 내용처럼 onAction에 대한 Detector를 선언할 수 있다.



**Detector가 인식할 수 있는 Action의 종류**

---

<details>
<summary>Action종류 접기/펼치기 버튼</summary>
<div markdown="1">
1. OnTap(Cancel, Down, Up)<br>
2. OnDoubleTap<br>
3. OnForcePress(End, Peek, Start, Update)<br>
4. OnHorizontalDrag(Cancel, Down, End, Start, Update)<br>
4. OnVerticalDrag(Cancel, Down, End, Start, Update)<br>
5. OnLongPress(End, MoveUpdate, Start, Up)<br>
6. OnPan(Cancel, Down, End, Start, Update)<br>
7. OnScale(End, Start, Update)<br>
8. OnSecondaryTap(Cancel, Down, Up)<br>
</div></details>

---



### 0-4. 위젯의 상태 변화

> 위젯의 형태는 변화하지 않는다.
>
> 상태에 변화를 주기위해서는 변화를 저장하는 Status Class를 따로 생성해준다.
>
> 그 방법은
>
> 1. StatefulWidget을 상속받는 Class를 생성
>
>    createState() 를 override한다.
>
> 2. State<1번에서 생성된 Class>를 상속받는 SubClass 를 만든다. 여기에 저장될 상태들에 대한 정의가 기재된다.
>
> 3. 특정 위젯의 Box하위에 1번에서 만든 Class의 createState method의 override된 이름을 통해 실행한다.

![image-20200719060212889](Flutter 문법.assets/image-20200719060212889.png)

- [링크](https://flutter-ko.dev/docs/development/ui/interactive) 최 하단





## 1. flutter 프로젝트의 기본 구성

### 1-1. 프로젝트

- lib 
  - **main.dart**  : 실행 파일 
  - 모델 폴더     : 데이터의 형태 정의
  - 페이지 폴더  : view 정의

- pubspec.yaml : 환경설정 파일 (Assets 경로, dependancy)
- 다른 폴더나 파일은 디버깅 시 컴파일되어 자동생성



## 2. main.dart

### 2-1. import

- import 'package:경로'

  - 예시 1. import 'package:flutter/material.dart';
  - 예시 2. import 'package:googleapis/storage/v1.dart';

- App 실행

  - ```dart
    void main() => runApp(App());
    ```

- App 선언부

  - ```dart
    class App extends StatelessWidget {
    
      @override
      Widget build(BuildContext context) {
    
        return MaterialApp(
          home: 실행하고자 하는 import된 메소드,
        );
      }
    }
    ```

    *위의 build 위젯의 return 문이 화면 구성에 해당된다.*



### 3. Assets 관리







## 4. 비동기 통신

### 4-1. future

### 4-2. Stream

### 4-3. async & await







