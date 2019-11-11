from flask import Flask, request, render_template
import requests
from decouple import config
from pprint import pprint
import random


app = Flask(__name__)

C_ID = config("C_ID")
C_SC = config("C_SC")
papago_url = "https://openapi.naver.com/v1/papago/n2mt"
header = {
    "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
    "X-Naver-Client-Id": C_ID,
    "X-Naver-Client-Secret": C_SC
}

token = config('TOKEN')
base_url = f"https://api.telegram.org/bot{token}"
rng = range(1,46)
lotto = sorted(random.sample(rng,6))

@app.route('/lotto_get')
def lotto_get():
    return render_template('chat.html')

@app.route('/send_msg')
def send_message():

    
    req = request.args.get('chat')
    res = requests.get(f'{base_url}/getUpdates').json()
    chat_id = res['result'][0]['message']['chat']['id']

    send_url = f'/sendMessage?chat_id={chat_id}&text={lotto}'

    response = requests.get(base_url+send_url)
    return '보내기 완료'

@app.route('/', methods=['POST'])
def tel_web():
    req = request.get_json().get('message')

    if req is not None :
        chat_id = req.get('chat').get('id')
        text = req.get('text')

    print(chat_id, text)

    if "로또" in text:
        msg = lotto
    else :
        data = {
            "source":"ko",
            "target":"en",
            "text": text
            }

        papago_req = requests.post(papago_url, headers=header, data=data).json()
        msg = papago_req['message']['result']['translatedText']

    send_url = f'/sendMessage?chat_id={chat_id}&text={msg}'
    response = requests.get(base_url+send_url)

    return '', 200

@app.route('/papago')
def papago():

    
    C_ID = config("C_ID")
    C_SC = config("C_SC")
    papago_url = "https://openapi.naver.com/v1/papago/n2mt"
    header = {
        "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
        "X-Naver-Client-Id": C_ID,
        "X-Naver-Client-Secret": C_SC
    }
    data = {
        "source":"ko",
        "target":"en",
        "text":"안녕하세요."
    }
    req = requests.post(papago_url, headers=header, data=data).json()
    print(req['message']['result']['translatedText'])
    return "Finish"




if __name__ == "__main__":
    app.run(debug=True, port=5000) 