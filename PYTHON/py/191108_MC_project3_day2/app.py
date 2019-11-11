from flask import Flask, render_template, request
from pprint import pprint
import random
import requests


app = Flask(__name__)

@app.route('/')
def hello():
    name = "World!!"
    return f'Hello {name}!'

@app.route('/mulcam')
def mulcam():
    return 'Hello mulcamp'

@app.route('/greeting/<string:name>') #String은 받은 것의 타입! name은 변수명!
def greeting(name):
    return f'{name}님 안녕하세요.'
#실행 방법은 http://127.0.0.1:8000/greeting/이희수

@app.route('/lunch/<int:num>')
def lunch(num):
    menu = ["짜장면" , "짬뽕", "라면" , "스파게티", "삼격살" , "수육"] 
    order = random.sample(menu, num) #menu를 기준으로 num만큼 뽑겠다는 메서드
    return str(order)

@app.route('/lotto')
def lotto():
    total = range(1,47)
    lottonum = random.sample(total, 6)
    return str(lottonum)

@app.route('/lotto_get')
def lotto_get():
    return render_template('lotto_get.html')

@app.route('/lotto_num')
def lotto_num():
    num = request.args.get("num")
    url = f"https://dhlottery.co.kr/common.do?method=getLottoNumber&drwNo={num}"
    res = requests.get(url).json()
    wnum = [ res[f'drwtNo{i}'] for i in range(1,7) ]
    lotto = sorted(random.sample(range(1,47),6))
    print(lotto)
    match = list(set(wnum) & set(lotto))
    msg = ""
    count = len(match)

    if count == 6 :
        msg = "1등입니다"
    elif (count == 5):
        msg = "2등입니다"
    elif (count == 4):
        msg = "3등입니다"
    elif (count == 3):
        msg ="4등입니다"
    elif (count == 2):
        msg ="5등입니다"
    else:
        msg ="꽝입니다"

    return render_template('lotto_result.html', num=num, wnum=wnum, lotto=lotto, msg=msg )

@app.route('/html')
def html():
    mutiline = '''
    <h1> This is H1 Tag</h1>
    <p> This is p Tag</p>
    '''
    return mutiline
    
@app.route('/hi/<string:name>')
def hi(name):
    return render_template('hi.html' , name=name) #앞의 name은 html의 name, 뒤의 name은 주소에 지정한 name


if __name__ == "__main__":
    app.run(debug=True, port=8000) 