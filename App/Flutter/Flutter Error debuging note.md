# Flutter Error debuging note



## 1. 배포 resource 경로 지정 방법

assets/image/name.png 를 로드할 수 없습니다.

- flutter 배포에 관한 resource 경로는 프로젝트 최상위 파일 중 **pubspec.yaml**에 저장된다.
- pubspec을 열면 다음과 같은 코드들이 설명되어 있다.
- 여기에 assets 경로를 지정한다. (assets은 보통 프로젝트 파일 최상위에 위치한다.)
- ![image-20200711200048916](C:\Users\YongDae\Documents\GitHub\TIL\App\Flutter\img_source\image-20200711200048916.png)





## 2. A RenderFlex overflowed by (n) pixels on the bottom.

- 컨테이너를 스크롤 객체로 감싸두지 않으면 bottom overflow error가 발생한다.

- 오류가 발생하는 객체를 마우스로 클릭한 후, Alt + Enter를 클릭하면  아래와 같은 창이 나온다.

- 아래 창에서 Wrap with widget을 클릭하면 기존의 개체들이 한 번에 wraping된다.

  ![image-20200711200831171](C:\Users\YongDae\AppData\Roaming\Typora\typora-user-images\image-20200711200831171.png)

  

- 이 때, SingleChildScrollView 객체로 전체를 감싸준다.

![image-20200711201000646](C:\Users\YongDae\AppData\Roaming\Typora\typora-user-images\image-20200711201000646.png)



- 디버깅 화면을 보면 error 메시지가 사라지고 마우스로 드래그 했을 때, 화면이 위아래로 움직인다.





