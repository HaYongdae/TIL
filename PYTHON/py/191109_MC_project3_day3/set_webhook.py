from decouple import config
import requests

token = config('TOKEN')
base_url = f'https://api.telegram.org/bot{token}'
url = 'mh2010mh.pythonanywhere.com'
setweb_url = f'/setWebhook?url={url}'

req = requests.get(base_url + setweb_url).json()

print(req)

