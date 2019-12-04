const nothing =_=> {}

console.log('시작')
setTimeout(nothing, 3000)
console.log('끝')
 
// 2. Axios
// 비동기 방식으로 Http 데이터 요청을 실행
// Promise 기반에 async / await 문법을 사용해서 XHR 요청을 쉽게 할 수 있다.
// 내부에서 직접적으로 XHR을 다루지 않고 AJAX 호출을 보낼 수 있다.
// NODE js 사용가능
// JSON data 자동으로 변환 - 자동으로 Json parsing 진행
// CSRF 보호기능 내장
// Promise : 비동기 요청을 보내고 응답을 받았을 때, 그 결과를 어떻게 처리할지 약속해놓는 개념
    // }).then : 응답이 정상적으로 왔을 때 수행할 약속부
    // }).catch : 응답에 오류가 있을 때, 수행할 약속부

    