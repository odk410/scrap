require 'httparty'
require 'nokogiri'

# HTTParty.get 로 원하는 정보가 있는 주소로 요청 보냄
# Nokogiri::HTML() 해당 문서를 검색하기 쉽게 바꾸고
# .css('selector 경로') 원하는 정보만 뽑아옴

# 가져오고 싶은 곳의 url을 복사해온다.
url = "http://comic.naver.com/webtoon/weekdayList.nhn"

# HTTParty.get을 사용해 HTML을 가져와 response에 담는다.
response = HTTParty.get(url)

# Nokogiri를 사용해 HTML문서를 보기 쉽게 변경해준다. .body를 사용해 html body부분만 변수에 저장한다.
html = Nokogiri::HTML(response.body)

# 웹 페이지에서 selector를 통해 복사해온 것을 설정해준다.
webtoon = html.css('#content > div.list_area.daily_img > ul > li:nth-child(2) > dl > dt > a')

# 원하는 것만 보고 싶다면 .text를 입력해주면 문장만 나온다.
puts webtoon.text
