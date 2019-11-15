# 191115 Django ORM

## 1. ORM (MTV)

----

> SQL 을 사용하지 않고 DB를 활용 가능케 만든 Django의 기능



### 1-1. model의 작성 (app 하위의 model.py)

- class 명 = table 명 (java spring framework의 model과 동일)
- 클레스 변수명 = column명
- 클레스 메소드로 __str__()재정의 - 데이터가 잘 저장되었는지 확인



### 1-2. makemigrations 

### (터미널에 python manage.py makemigrations .)

> manage.py makemigrations 로 실행

- 장고에서 변경된 부분을 migrations 폴더 내부에 작성함
  - 0001_XXX 같이 변경된 부분에 대해 명세서를 자동 작성
  - 수정을 원할 경우 migrations 파일이 아닌 model.py를 수정
  - 변경점을 자동으로 찾지 못하는 경우, migrations를 삭제한 후 다시 생성



### 1-3. migrate 

### (python manage.py migrate)

> migration 파일을 바탕으로 db에 테이블을 적용



### 1-4. admin.py

- db 관리용 페이지

- 일반 사용자에게 보여지는 페이지는 아님.

- **fields** - 데이터를 수정할때 나타나는 수정박스를 나타나게
- admin.py에서 클릭해서 들어가 내용을 변경할 수 있는데 그 부분
  - fields list, tuple 형식으로 수정할 항목이나 순서를 설정을 해주자.
  - auto_now=True , editable = False로 바뀌면서 옵션이 바뀐다. 그러면 fields안에 들어갈 수 없다. 이 옵션이 있는 컬럼은 제외 해야 한다.  (editable =True 인 컬럼만 올 수 있다.)
  
- **list_filter **
- bool, char, date, datetime, integer 속성 만 들어갈 수 있다.



## 2. CRUD (create, read, update, delete)

> views에 함수를 만들어 ORM을 활용한다.

select : 모델.objects.get([col=값]) / .order_by('col') / fileter(col=값)

insert 및 update : [모델.변수 = 값]으로 수정 후, 모델.save()

delete : 모델.delete (따로 save()하지 않음)



