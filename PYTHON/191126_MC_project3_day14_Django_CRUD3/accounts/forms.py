# 유저 정보를 변경하기 위한 폼
from django.contrib.auth.forms import UserChangeForm, UserCreationForm
# 유저 정보를 가져오는 모델
from django.contrib.auth import get_user_model

class UserCustomChangeForm(UserChangeForm):
    class Meta:
        model = get_user_model()
        fields = ['first_name', 'last_name', 'email']
class UserCustomCreationForm(UserCreationForm):
    class Meta(UserCreationForm.Meta):
        model = get_user_model()
        fields = UserCreationForm.Meta.fields






