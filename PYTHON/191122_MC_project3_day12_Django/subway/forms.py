from django import forms
from .models import Subway

# class BookForm(forms.ModelForm):
#     class Meta:
#         model = Book
#         fields = ['name', 'preface']
        
# modelForm 을 받는 경우와 model을 받는 경우가 존재한다.

MENU = [
('치킨 데리야키','치킨 데리야키'),
('이탈리안 BMT','이탈리안 BMT'),
('로스트 치킨','로스트 치킨'),
('서브웨이 클럽','서브웨이 클럽'),
('참치','참치')
]

BREAD = [
("위트","위트"),
("허니오트","허니오트"),
("파마산 오레가노","파마산 오레가노"),
("플랫 브레드","플랫 브레드")
]

SAUCE = [
("스윗 언년","스위트 언년"),
("허니 머스탇","허니 머스탇"),
("스윗 칄리","스윗 칄리"),
("사우전 아일랜","사우전 아일랜"),
("핫 칄리","핫 칄리")
]

VEGETABLE = [
("양배추","양배추"),
("토마토","토마토"),
("오이","오이"),
("피망","피망"),
("양파","양파"),
("올리브","올리브")
]

DRINK = [
("사이다","사이다"),
("콜라","콜라"),
("환타","환타")
]

class SubwayForm(forms.ModelForm):
    class Meta:
        model = Subway
        fields = ['name','address','phone','menu','bread','sauce','vegetable','drink']
        widget = { 
            'menu': forms.Select(choices="치킨 데리야끼"),
        }
    def save(self,commit=True):
        self.instance = Subway(**self.cleaned_data)
        if commit:
            self.instance.save()
        return self.instance