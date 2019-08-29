# Git

> Git은 분산버전관리시스템(DVCS) 이다.
>
> 소스 코드의 이력을 관리한다.

- 참고 사이트
  - [Git.scm](https://git-scm.com/book/ko/v2)
  - [Git 입문](https://backlog.com/git-tutorial/kr/)
  - [Git Cheatsheet](https://ndpsoftware.com/git-cheatsheet.html)

## 1. git 설정

git 커밋을 위해서는 초기에 작성자(author)의 이름과 메일을 설정해야 한다.

```bash
$ git config --global user.name {"사용자 이름"}
$ git config --global user.mail {"사용자 이메일"}
```

현재 global로 설정된 환경설정을 확인하기 위해서는 아래의 명령어를 작성한다.

```bash
$ git config --global --list
user.email={"사용자 이메일"}
user.name ={"사용자 이름"}
```



## 2. git 활용 기초

1. 로컬 git 저장소 설정

```bash
$ git init
Initialized empty Git repository in
C:/Users/students/Desktop/~/.git/ (master) $
```

- - 해당 디렉토리에 .git/ 폴더가 생성 된다

  - 항상 git init 하기 전에는 해당 폴더가 이미 로컬 저장소인지(master)여부)를 확인하여야 한다

    

2. add

```bash
$ git add .					-- 현재 저장소의 모든 것
$ git add README.md a.txt	-- {output 파일} {input 파일}
$ git add folder/			-- {디렉토리 단위}
$ git status
```

- - add 명령어를 통해서 working directory에서 Index(staging area)로 특정 파일들을 이동시킨다.

  - commit 할 내역을 쌓는 것이다.

  - **취소**

    ```bash
    $ git reset HEAD <"file or directory">
    ```

    

3. commit

```bash
$ git commit -m '커밋 메시지'
$ git commit
[master (헤쉬코드)] 제목 작성
1. file changed, 1 insertion(+)
$ git log
```

- - **수정**

    ```bash
    $ git commit --amend
    ```

    - 커밋 메시지를 수정하게 되면 해시값이 변경되어 이력이 변화하게 된다.

    - 따라서 원격 저장소에 push된 이력이라면 절대 변경하면 안된다.

    - 커밋을 하는 과정에서 파일을 빠뜨렸다면, 위의 명령어를 통해서 수정할 수 있다.

      ```bash
      $ git add omit_file.txt
      $ git commit --amend
      ```

      

  - **commit 목록에서 rm 가능**

    ```bash
    $ git rm --cached
    ```

    

4. 커밋 히스토리 확인

```bash
$ git log			-- 전체 로그
$ git log -2		-- 최근 2개
$ git log --oneline	-- 한줄로 요약하여 전체 확인
```



5. git 상태 확인

```bash
git status
```



6. commit history 사용하기

   1. working directory의 코드 되돌리기

   ```bash
   $ git checkout -- (파일 이름)
   ```

   - ***변경 사항이 모두 삭제되고 되돌릴 수 없어 주의가 필요하다.***



​	7. git reflog



## 3. 원격저장소(remote) 활용하기

1. 기초

   1. remote 저장소 등록

      ```bash
      $ git remote add origin {github URL}
      ```

      - 원격 저장소를 origin 이라는 이름으로 URL 등록한다.

   2. remote 저장소 확인

      ```bash
      $ git remote -v
      ```

   3. remote 저장소 삭제

      ```bash
      $ git remote rm {저장소 이름}
      ```

      

2. Push-Pull

   1. 원격 저장소로 보내기 (push)

      ```bash
      $ git push origin master
      ```

   2. 원격 저장소로부터 가져오기(pull)

      ```bash
      $ git pull origin master
      ```

      

   3. auto-merge

   - 동일한 파일을 수정하지 않은 경우, 자동으로 merge commit이 발생 한다.

```
    1. Local A에서 작업 후 push
    2. Local B에서 작업 시 pull을 받지 않음.
    3. Local B에서 작업 후 commit -> push
    4. 오류 발생 (~~ git pull~~)
    5. Local B에서 git pull
    6. 자동으로 vim commit할 수 있음
    7. 저장하면, merge commit 발생
    8. Local B에서 git push!
```

​			4. merge conflict

- 다른 이력(커밋)으로 동일한 파일이 수정되는 경우 merge conflict 발생
- 직접 충돌 파일을 해결해야 한다.

```
1. Local A에서 작업 후 push
2. Local B에서 작업 시 pull을 받지 않음.
3. Local B에서 동일 파일 작업 후 commit -> push
4. 오류 발생 (~~ git pull~~)
5. Local B에서 git pull
6. 충돌 발생(merge conflict)
7. 직접 오류 찾기/수정
8. Local B에서 git push!
```

- git status 명령어를 통해 어느 파일에서 충돌이 발생하였는지 확인 가능!

- 실제 파일 예시

  ```
  // 일부 IDE 에서는 클릭으로도 수정 가능 (작업A만 남기기, 작업B만 남기기, 모두 쌓기)
  // 모두 쌓으면 원격저장소 코드가 베이스가 된다. - 기존 작업자와의 충돌 방지
  
  <<<<<<<<<<< HEAD
  Local B작업
  ==========
  원격 저장소에 저장된 B의 내용
  >>>>>>>>>>> commit 의 hash값
  ```

  

** 나가는 문에 push 들어오는 문에 pull 을 붙일 정도로 생활화되어야 한다.