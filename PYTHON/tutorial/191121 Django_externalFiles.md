# 191121 Django_externalFile

> static files



## 1. static 파일 저장 경로 설정

- app_name/static/app_name/소스 종류/파일 이름
  - ex) boards/staitc/boards/img/a.jpeg

---



## 2. 선언 방법

- settings.py

```bash
# 실제 파일이 위치한 dir은 아니다.

STATIC_URL = '/static/'

# STATICFILES_DIRS 를 추가해 튜플이나 리스트로 지정해준다.

STATICFILES_DIRS= [ 
	"/assets/image/*"
	os.path.join(BASE_DIR, 'assets', 'image'),
]

# STATIC_ROOT 설정
# -- 배포용으로 STATIC FILE들을 하나의 경로에 모은다.

STATIC_ROOT = [
	os.path.join(BASE_URL, 'assets'),
]

# 위의 STATIC_ROOT 지정 후
# 터미널에서 python manage.py collectstatic 실행
# 모든 Static 파일들이 경로로 모임 (배포용)
```



- html 파일

```django
{% load static %}
<img src="{% static 'boards/images/a.jpeg' %}">
```



## 3. MIDEA 파일 경로 설정

enctype = multipart로 요청해야함



- static_url 비슷, 파일의 주소를 만들어줌
- 실제 파일 dir가 아님
- /가 필수이고 문자열로 설정
- /media/



url 을 만들어주는 곳이 없어 에러



config/urls.py



urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

\# 첫번째 인자 : 어떤 URL을 정적으로 추가할 것인지

\# 두번째 인자 : 실제 미디어파일은 어디에 있는지

\#       document_root에 미디어 파일 경로를 전달해주면됨.





## 4. image 재설정



1. pillow 페키지 다운로드
   - 이미지 파일형식 지원
   - 다양한 이미지를 처리
   - imageField 생성시 필수
2. pilkit - pillow를 쉽게 쓸 수 있게 도움
   - Thumbnail, resize, crop
3. django-imagekit - 이미지 썸네일
   - 이미지 썸네일 헬퍼 장고엡
   - settings.py에 등록해서 사용(INSTALLED_APP)



- PNG와 JPEG의 차이
  - PNG : 스크린샷, 단순한 그림, 아이콘 8bit
  - JPEG : 자연이미지나 색상이 많이 사용된 이미지



- processor
  - ResizeToFill : 지정한 사이즈를 맞추고 남는 부분 잘라냄
  - ResizeToFit : 남는 부분 빈공간으로 둠

  

  [실습 github 주소](github.com/matthewwithanm/django-imagekit)



- upload_to="boards/%Y/%m/%d" 방식으로 년/월/일 경로로 폴더가 생성

- 매일 폴더 경로가 달라짐.



- upload_to = 함수명

- def 함수명(instance, filename)

  ​			return f'boards/{instance.pk}/images/{filename}'

- favicon

- favorite + icon

- favicon 은 link tag로 설정
  - link 
    - type : 연결 문서의 MIME 유형
    - rel : 현재 문서와 연결되는 문서의 관계 표시
      - stylesheet
      - alternate : 문서의 대안 버전으로 연결
      - author : 문서의 저작자로 연결
      - help : 문서의 도움말로 연결
      - search : 문서의 검색 도구로 연결



favicon-generator.org

파일을 받아서 static 경로 저장



# 191121 Django_null&blank 



- Null : DB에서 유효성을 검사
- Blank : '' : 폼에서 유효성을 검사



models.py 내부에서 체크



* null = True, blank = False
  * charfield, textfield : blank = True
* booleanfield
  * Nullbooleanfield



### (null=_)

- null = True 컬럼을 비워둘 수가 있음 (default = false)
- db에서 휴요성을 검사
- None 가능

### (blank=_)

- blank=True 빈 값으로 저장을 허용( defalt = blank)
- form 에서 유효성 검사를 함.
- ''의 빈값이 들어갈 수 있음

![K-009](C:\Users\student\Downloads\K-009.png)

- blank=True 처럼 default값이 설정되어 있다.

- ![K-010](C:\Users\student\Downloads\K-010.png)

  

- 만약 default 값이 없으면 python manege.py makemigrations를 입력하였을 때, default 값의 설정 여부를 묻는다.

  - 1번: 기존 default값을 이용한다
  - 2번: 새로운 default 값을 models.py에 설정 후 재실행

- ![K-011](C:\Users\student\Downloads\K-011.png)



### (default=_)

- 초기값 설정 옵션



# 191121 Django_form 태그



- form 의 enctype 종류
  - application/x-www-form-urlencoded
  - multipart/form-data
  - text/plain





