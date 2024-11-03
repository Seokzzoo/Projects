library(multilinguer)
library(RSQLite)
library(KoNLP)
library(tm)
library(wordcloud)
library(httr)
library(XML)
library(stringr)
library(KoNLP)
library(dplyr)
library(wordcloud2)


#1--------------------------
url <- "https://www.donga.com/news/article/all/20071219/8524372/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre1 <- gsub("\\d+", " ", news_pre)
news_pre1
news_pre1 <- str_replace_all(news_pre1,"이종훈 기자   진실이 거짓 이기게 해달라淪킴창닫기기사를 추천 하셨습니다 대선주요 후보들 마지막 호소베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서감찰위  징계청구직무배제수사의뢰 모두 부적절에 타격송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다","")
news_pre1

#2--------------------------
url <- "https://www.donga.com/news/article/all/20071220/8524874/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre2 <- gsub("\\d+", " ", news_pre)
news_pre2
news_pre2 <- str_replace_all(news_pre2,"이기홍 워싱턴 특파원 창닫기기사를 추천 하셨습니다기자의 눈이기홍미국인 눈에 비친 이상한 한국 대선베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다감찰위  징계청구직무배제수사의뢰 모두 부적절에 타격","")
news_pre2

#3--------------------------
url <- "https://www.donga.com/news/article/all/20071219/8524338/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
  news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre3 <- gsub("\\d+", " ", news_pre)
news_pre3
news_pre3 <- str_replace_all(news_pre3,"전주김창원 기자 광주한상준 기자 ■강원 제주 경제 후보에 솔깃 李일찌감치  위강원 지역은 전국 표심과 크게 다르지 않다 이명박 후보 대세론이 강한 편이다 이회창 후보가 실향민 정서를 내세워 한때  위에 올랐지만 수사 결과 발표 이후 정동영 후보가  위를 지키고 있다 강원도민일보 김인호 정치부장은  동영상 공개 후에도 이명박 후보의 지지율은 거의 흔들림이 없다며 다른 후보들 중에는 마땅한 인물이 없다는 역 견제심리가 작용한 것이라고 말했다 강원일보 김창우 정치부장 역시 이번 대선에서 강원도의 힘을 보여 주자는 목소리가 많다며 강원 표심을 당락의 주요 변수로 만들자는 여론에 따라 보수세력이 집결했다고 말했다 제주 민심은 대선 풍향계라는 점에서 관심을 끌기도 했지만 각종 여론조사에서 이명박 후보가 일찌감치  위를 질주하자 다소 맥이 풀린 모습이다 한라일보 김인배 편집국장은 감귤가격 폭락 관광산업 위축 등으로 지역 유권자들은 경제에 관심이 많다며 이념 논쟁이 사라진 것도 이번 대선의 한 특징이라고 말했다 그는  년 대선 때는 제주지역 공약을 놓고 후보별 차별화가 가능했으나 이번 대선은 정책 대결이 실종됐다고 지적했다춘천황규인 기자 제주임재영 기자  창닫기기사를 추천 하셨습니다대선지역주의 청산 조짐 고무적 네거티브엔 넌더리베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다감찰위  징계청구직무배제수사의뢰 모두 부적절에 타격                                             ","")
news_pre3

#4--------------------------
url <- "https://www.donga.com/news/article/all/20071219/8524353/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre4 <- gsub("\\d+", " ", news_pre)
news_pre4
news_pre4 <- str_replace_all(news_pre4,"창닫기기사를 추천 하셨습니다 대선빅  캠프 최전선 전사들베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다감찰위  징계청구직무배제수사의뢰 모두 부적절에 타격                                             ","")
news_pre4

#5--------------------------
url <- "https://www.donga.com/news/article/all/20071219/8524377/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre5 <- gsub("\\d+", " ", news_pre)
news_pre5
news_pre5 <- str_replace_all(news_pre5," 김현수 기자 창닫기기사를 추천 하셨습니다 대선대선의 해 달군 말말말베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다감찰위  징계청구직무배제수사의뢰 모두 부적절에 타격                                             ","")
news_pre5

#6--------------------------
url <- "https://www.donga.com/news/article/all/20071219/8524345/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre6 <- gsub("\\d+", " ", news_pre)
news_pre6
news_pre6 <- str_replace_all(news_pre6," 창닫기기사를 추천 하셨습니다사설대선 전날까지 극성부린 반칙 캠페인베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다감찰위  징계청구직무배제수사의뢰 모두 부적절에 타격                                             ","")
news_pre6

#7--------------------------
url <- "https://www.donga.com/news/article/all/20071217/8523549/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre7 <- gsub("\\d+", " ", news_pre)
news_pre7
news_pre7 <- str_replace_all(news_pre7,"전지성 기자 창닫기기사를 추천 하셨습니다재수사 카드로 특검 압박 대선 한복판 盧베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다감찰위  징계청구직무배제수사의뢰 모두 부적절에 타격                                             ","")
news_pre7

#8--------------------------
url <- "https://www.donga.com/news/article/all/20071216/8523385/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre8 <- gsub("\\d+", " ", news_pre)
news_pre8
news_pre8 <- str_replace_all(news_pre8,"이 진 녕 논설위원창닫기기사를 추천 하셨습니다광화문에서이진녕희한한 대선베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다감찰위  징계청구직무배제수사의뢰 모두 부적절에 타격                                             ","")
news_pre8

#9--------------------------
url <- "https://www.donga.com/news/article/all/20071217/8523848/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre9 <- gsub("\\d+", " ", news_pre)
news_pre9
news_pre9 <- str_replace_all(news_pre9,"창닫기기사를 추천 하셨습니다사설대선 연장전 노리는 이명박 특검베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다감찰위  징계청구직무배제수사의뢰 모두 부적절에 타격                                             ","")
news_pre9

#10--------------------------
url <- "https://www.donga.com/news/article/all/20071218/8524025/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre10 <- gsub("\\d+", " ", news_pre)
news_pre10
news_pre10 <- str_replace_all(news_pre10,"최우열 기자 창닫기기사를 추천 하셨습니다검찰 대선 고소고발 몸살   총선때의  배베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다감찰위  징계청구직무배제수사의뢰 모두 부적절에 타격                                             ","")
news_pre10

#11--------------------------
url <- "https://www.donga.com/news/article/all/20071215/8523121/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre11 <- gsub("\\d+", " ", news_pre)
news_pre11
news_pre11 <- str_replace_all(news_pre11,"▲ 영상 취재  신원건 기자▲ 영상 취재  이종승 기자▲ 영상 취재  신원건 기자▲ 영상 취재  이종승 기자▲ 영상 취재  신원건 기자▲ 영상 취재  이종승 기자▲ 영상 취재  신원건 기자박성원 기자 민동용 기자 김현수 기자 창닫기기사를 추천 하셨습니다대선 코앞에 두고 의사당 난장판베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서감찰위  징계청구직무배제수사의뢰 모두 부적절에 타격                                             ","")
news_pre11

#12--------------------------
url <- "https://www.donga.com/news/article/all/20071217/8523426/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre12 <- gsub("\\d+", " ", news_pre)
news_pre12
news_pre12 <- str_replace_all(news_pre12,"신치영 기자 창닫기기사를 추천 하셨습니다이코노 카페대선 바람 타는 경제부처들베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서감찰위  징계청구직무배제수사의뢰 모두 부적절에 타격                                             ","")
news_pre12

#13--------------------------
url <- "https://www.donga.com/news/article/all/20071217/8523510/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre13 <- gsub("\\d+", " ", news_pre)
news_pre13
news_pre13 <- str_replace_all(news_pre13,"동정민 기자 창닫기기사를 추천 하셨습니다선택   대선  차 토론경제 살리기 설전베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서감찰위  징계청구직무배제수사의뢰 모두 부적절에 타격                                             ","")
news_pre13

#14--------------------------
url <- "https://www.donga.com/news/article/all/20071215/8523108/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre14 <- gsub("\\d+", " ", news_pre)
news_pre14
news_pre14 <- str_replace_all(news_pre14,"이명건 기자  주요 후보에 대한 패널조사 결과조사기관이명박정동영이회창 중앙일보 동아시아연구원   조사는    일 실시  일 발표패널조사 는 동일한 유권자를 대상으로 동일한 질문을 시차를 두고 반복 조사하는 방법 창닫기기사를 추천 하셨습니다선택   대선  막판 표심잡기 후보들 강행군베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서감찰위  징계청구직무배제수사의뢰 모두 부적절에 타격                                             ","")
news_pre14

#15--------------------------
url <- "https://www.donga.com/news/article/all/20071215/8523125/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre15 <- gsub("\\d+", " ", news_pre)
news_pre15
news_pre15 <- str_replace_all(news_pre15,"이승헌 기자 민동용 기자 동정민 기자 창닫기기사를 추천 하셨습니다선택   대선  대선전을 달구는 후보연설 키워드베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서감찰위  징계청구직무배제수사의뢰 모두 부적절에 타격                                             ","")
news_pre15

#16--------------------------
url <- "https://www.donga.com/news/article/all/20071211/8521278/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre16 <- gsub("\\d+", " ", news_pre)
news_pre16
news_pre16 <- str_replace_all(news_pre16,"신치영 기자 이종훈 기자  창닫기기사를 추천 하셨습니다 경제장관  인 대선 후보들 경제대책 놓고 토론하라베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서감찰위  징계청구직무배제수사의뢰 모두 부적절에 타격                                             ","")
news_pre16

#17--------------------------
url <- "https://www.donga.com/news/article/all/20071211/8521296/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre17 <- gsub("\\d+", " ", news_pre)
news_pre17
news_pre17 <- str_replace_all(news_pre17,"박민혁 기자 이명건 기자  민동용 기자 창닫기기사를 추천 하셨습니다선택    대선 드라마 관객 끌어올 묘수 찾아라베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서감찰위  징계청구직무배제수사의뢰 모두 부적절에 타격                                             ","")
news_pre17

#18--------------------------
url <- "https://www.donga.com/news/article/all/20071214/8522695/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre18 <- gsub("\\d+", " ", news_pre)
news_pre18
news_pre18 <- str_replace_all(news_pre18,"임소형 동아사이언스 기자 ▼과학자문단  명 ▼김동욱 연세대 의대 교수 김선영 서울대 생명과학부 교수 김승환 포스텍 물리학과 교수 배순훈 한국과학기술원 서울부총장 윤문섭 한국부품소재산업진흥원 전략기획본부장 이광형 한국과학기술원 바이오시스템학과 교수 이병기 서울대 전기공학부 교수 이장재 한국과학기술기획평가원 정책기획단장 이혜숙 이화여대 수학과 교수 장영근 한국항공대 항공우주기계공학부 교수창닫기기사를 추천 하셨습니다과학기술 분야  대 현안 대선 후보들에게 물었습니다베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서감찰위  징계청구직무배제수사의뢰 모두 부적절에 타격                                             ","")
news_pre18

#19--------------------------
url <- "https://www.donga.com/news/article/all/20071210/8520992/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre19 <- gsub("\\d+", " ", news_pre)
news_pre19
news_pre19 <- str_replace_all(news_pre19,"이명건 기자  장강명 기자 ▼ 관련기사고려대정시대비 논술교육창닫기기사를 추천 하셨습니다대선후보들도 수능 등급제 문제있다베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서감찰위  징계청구직무배제수사의뢰 모두 부적절에 타격                                             ","")
news_pre19

#20--------------------------
url <- "https://www.donga.com/news/article/all/20071210/8520931/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre20 <- gsub("\\d+", " ", news_pre)
news_pre20
news_pre20 <- str_replace_all(news_pre20,"정원수 사회부 창닫기기사를 추천 하셨습니다기자의 눈정원수협박 압박 선 넘는 대선후보들베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서감찰위  징계청구직무배제수사의뢰 모두 부적절에 타격                                             ","")
news_pre20

#21--------------------------
url <- "https://www.donga.com/news/article/all/20071220/8524870/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre21 <- gsub("\\d+", " ", news_pre)
news_pre21
news_pre21 <- str_replace_all(news_pre21,"박제균 기자 ▼ 이명박 대통령 당선자 관련 화보 ▼ 이명박 고향 대통령 나왔다 마을 잔치 귀화 외국인에서  세 할머니까지 한표 행사 출구조사 발표 한나라 지지자 이겼다 만세환호 촬영  김재명 기자촬영  전영한 기자창닫기기사를 추천 하셨습니다이명박 시대압승의 의미와 과제베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서감찰위  징계청구직무배제수사의뢰 모두 부적절에 타격                                             ","")
news_pre21

#22--------------------------
url <- "https://www.donga.com/news/article/all/20071218/8523968/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre22 <- gsub("\\d+", " ", news_pre)
news_pre22
news_pre22 <- str_replace_all(news_pre22,"길진균 기자 창닫기기사를 추천 하셨습니다이명박 특검법 삼성 특검법과 비교해 보니베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서감찰위  징계청구직무배제수사의뢰 모두 부적절에 타격                                             ","")
news_pre22

#23--------------------------
url <- "https://www.donga.com/news/article/all/20071215/8523081/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre23 <- gsub("\\d+", " ", news_pre)
news_pre23
news_pre23 <- str_replace_all(news_pre23," 이헌재 기자 창닫기기사를 추천 하셨습니다정부조직 군살빼기 어려워질수도베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서감찰위  징계청구직무배제수사의뢰 모두 부적절에 타격                                             ","")
news_pre23

#24--------------------------
url <- "https://www.donga.com/news/article/all/20071218/8524033/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre24 <- gsub("\\d+", " ", news_pre)
news_pre24
news_pre24 <- str_replace_all(news_pre24,"윤완준 기자 창닫기기사를 추천 하셨습니다이념은 진보 지지는 보수당 유권자  년새  배로베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서감찰위  징계청구직무배제수사의뢰 모두 부적절에 타격                                             ","")
news_pre24

#25--------------------------
url <- "https://www.donga.com/news/article/all/20071212/8521815/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre25 <- gsub("\\d+", " ", news_pre)
news_pre25
news_pre25 <- str_replace_all(news_pre25,"길진균 기자 창닫기기사를 추천 하셨습니다 차 토론베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서감찰위  징계청구직무배제수사의뢰 모두 부적절에 타격                                             ","")
news_pre25

#26--------------------------
url <- "https://www.donga.com/news/article/all/20071218/8523973/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre26 <- gsub("\\d+", " ", news_pre)
news_pre26
news_pre26 <- str_replace_all(news_pre26,"김윤종 기자 창닫기기사를 추천 하셨습니다막판 인사잡음 빅  이슈는 차기정부로베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서감찰위  징계청구직무배제수사의뢰 모두 부적절에 타격                                             ","")
news_pre26

#27--------------------------
url <- "https://www.donga.com/news/article/all/20071212/8521827/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre27 <- gsub("\\d+", " ", news_pre)
news_pre27
news_pre27 <- str_replace_all(news_pre27," 이진구 기자  창닫기기사를 추천 하셨습니다신당민주 후보단일화 무산베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서감찰위  징계청구직무배제수사의뢰 모두 부적절에 타격                                             ","")
news_pre27

#28--------------------------
url <- "https://www.donga.com/news/article/all/20071211/8521297/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre28 <- gsub("\\d+", " ", news_pre)
news_pre28
news_pre28 <- str_replace_all(news_pre28,"이진구 기자  이종훈 기자  창닫기기사를 추천 하셨습니다정동영이인제 단일화 불씨 되살릴까베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서감찰위  징계청구직무배제수사의뢰 모두 부적절에 타격                                             ","")
news_pre28

#29--------------------------
url <- "https://www.donga.com/news/article/all/20071216/8523393/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre29 <- gsub("\\d+", " ", news_pre)
news_pre29
news_pre29 <- str_replace_all(news_pre29,"창닫기기사를 추천 하셨습니다사설후보들의 경제 공약 현실성이 문제다베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서감찰위  징계청구직무배제수사의뢰 모두 부적절에 타격                                             ","")
news_pre29

#30--------------------------
url <- "https://www.donga.com/news/article/all/20071216/8523395/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre30 <- gsub("\\d+", " ", news_pre)
news_pre30
news_pre30 <- str_replace_all(news_pre30,"창닫기기사를 추천 하셨습니다사설盧의 재수사 지시 李의 특검 수용베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서감찰위  징계청구직무배제수사의뢰 모두 부적절에 타격                                             ","")
news_pre30

#31--------------------------
url <- "https://www.donga.com/news/article/all/20071214/8522742/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre31 <- gsub("\\d+", " ", news_pre)
news_pre31
news_pre31 <- str_replace_all(news_pre31,"이종훈 기자   촬영 이종승 기자 창닫기기사를 추천 하셨습니다정몽준 옆동네 출신 李 지지를베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서감찰위  징계청구직무배제수사의뢰 모두 부적절에 타격                                             ","")
news_pre31

#32--------------------------
url <- "https://www.donga.com/news/article/all/20071213/8522429/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre32 <- gsub("\\d+", " ", news_pre)
news_pre32
news_pre32 <- str_replace_all(news_pre32," ▲ 동영상 촬영  김동주 기자▲ 동영상 촬영  김동주 기자","")
news_pre32 <- str_replace_all(news_pre32," 이진구 기자  창닫기기사를 추천 하셨습니다 단일화 불씨 살리기 안간힘베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서감찰위  징계청구직무배제수사의뢰 모두 부적절에 타격                                             ","")
news_pre32

#33--------------------------
url <- "https://www.donga.com/news/article/all/20071217/8523538/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre33 <- gsub("\\d+", " ", news_pre)
news_pre33
news_pre33 <- str_replace_all(news_pre33,"이유종 기자 장강명 기자 김현수 기자 촬영  김동주 기자촬영  김동주 기자촬영  이종승 기자▼영상물 제작","")
news_pre33 <- str_replace_all(news_pre33,"이유종 기자 창닫기기사를 추천 하셨습니다 동영상 공갈 피의자들 정치권 잇단 접촉베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서단독조남관의 역수사 지시감찰부 압수수색 과정 위법여부 조사                                             ","")
news_pre33

#34--------------------------
url <- "https://www.donga.com/news/article/all/20071213/8522240/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre34 <- gsub("\\d+", " ", news_pre)
news_pre34
news_pre34 <- str_replace_all(news_pre34," 홍찬식 논설위원 창닫기기사를 추천 하셨습니다횡설수설홍찬식통 큰 교육 공약베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서단독조남관의 역수사 지시감찰부 압수수색 과정 위법여부 조사                                             ","")
news_pre34

#35--------------------------
url <- "https://www.donga.com/news/article/all/20071212/8521825/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre35 <- gsub("\\d+", " ", news_pre)
news_pre35
news_pre35 <- str_replace_all(news_pre35,"장강명 기자 창닫기기사를 추천 하셨습니다투표율 높이기 쇼를 하라베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서단독조남관의 역수사 지시감찰부 압수수색 과정 위법여부 조사                                             ","")
news_pre35

#36--------------------------
url <- "https://www.donga.com/news/article/all/20071212/8521768/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre36 <- gsub("\\d+", " ", news_pre)
news_pre36
news_pre36 <- str_replace_all(news_pre36,"민동용 기자 대통합민주신당 제공촬영  김동주 기자촬영  김동주 기자촬영  김동주 기자","")
news_pre36 <- str_replace_all(news_pre36,"동정민 기자 창닫기기사를 추천 하셨습니다 이명박  정동영  이회창 공약베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서단독조남관의 역수사 지시감찰부 압수수색 과정 위법여부 조사                                             ","")
news_pre36

#37--------------------------
url <- "https://www.donga.com/news/article/all/20071213/8522308/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre37 <- gsub("\\d+", " ", news_pre)
news_pre37
news_pre37 <- str_replace_all(news_pre37,"민동용 기자 창닫기기사를 추천 하셨습니다기자의 눈기사내용 확인도 않고 과거 보도 헐뜯기베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서단독조남관의 역수사 지시감찰부 압수수색 과정 위법여부 조사                                             ","")
news_pre37

#38--------------------------
url <- "https://www.donga.com/news/article/all/20071213/8522239/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre38 <- gsub("\\d+", " ", news_pre)
news_pre38
news_pre38 <- str_replace_all(news_pre38,"최정호 울산대 석좌교수본보 객원大記者창닫기기사를 추천 하셨습니다최정호 칼럼구더기 무서워 장 못 담글까베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서단독조남관의 역수사 지시감찰부 압수수색 과정 위법여부 조사                                             ","")
news_pre38

#39--------------------------
url <- "https://www.donga.com/news/article/all/20071217/8523545/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre39 <- gsub("\\d+", " ", news_pre)
news_pre39
news_pre39 <- str_replace_all(news_pre39,"이진구 기자  촬영  이종승 기자촬영  동아일보촬영  이종승 기자촬영  이종승 기자","")
news_pre39 <- str_replace_all(news_pre39,"이유종 기자 촬영  이종승 기자창닫기기사를 추천 하셨습니다盧 사상 첫 재수사지휘권 지시 李 특검법 수용베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서단독조남관의 역수사 지시감찰부 압수수색 과정 위법여부 조사                                             ","")
news_pre39

#40--------------------------
url <- "https://www.donga.com/news/article/all/20071214/8523067/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre40 <- gsub("\\d+", " ", news_pre)
news_pre40
news_pre40 <- str_replace_all(news_pre40,"창닫기기사를 추천 하셨습니다사설세계가 비웃을 검사 탄핵특검 소동베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서단독조남관의 역수사 지시감찰부 압수수색 과정 위법여부 조사                                             ","")
news_pre40

#41--------------------------
url <- "https://www.donga.com/news/article/all/20071213/8522310/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre41 <- gsub("\\d+", " ", news_pre)
news_pre41
news_pre41 <- str_replace_all(news_pre41,"민동용 기자 ▶에 동영상촬영  이종승 기자촬영  이종승 기자촬영  이종승 기자창닫기기사를 추천 하셨습니다범여권 한나라이명박부패 연대 사실상 무산베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서단독조남관의 역수사 지시감찰부 압수수색 과정 위법여부 조사                                             ","")
news_pre41

#42--------------------------
url <- "https://www.donga.com/news/article/all/20071211/8521309/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre42 <- gsub("\\d+", " ", news_pre)
news_pre42
news_pre42 <- str_replace_all(news_pre42,"박성원 기자 조수진 기자  황장석 기자 창닫기기사를 추천 하셨습니다선택     허망한 매뉴얼 정부베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서단독조남관의 역수사 지시감찰부 압수수색 과정 위법여부 조사                                             ","")
news_pre42

#43--------------------------
url <- "https://www.donga.com/news/article/all/20071215/8523078/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre43 <- gsub("\\d+", " ", news_pre)
news_pre43
news_pre43 <- str_replace_all(news_pre43," 월  일  분  초  분  초   분  초   분  초  명함의 진실은 월  일  분  초  분  초   분  초   초  진실 공방  월  일  분  초  분  초   초   분  초  자료 편파방송저지시민연대 창닫기기사를 추천 하셨습니다 수첩김미화의 관련 보도 편파적베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서단독조남관의 역수사 지시감찰부 압수수색 과정 위법여부 조사                                             ","")
news_pre43

#44--------------------------
url <- "https://www.donga.com/news/article/all/20071214/8522674/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre44 <- gsub("\\d+", " ", news_pre)
news_pre44
news_pre44 <- str_replace_all(news_pre44,"김유영 기자 창닫기기사를 추천 하셨습니다이명박이회창 후보 공약 가장 시장경제적베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서단독조남관의 역수사 지시감찰부 압수수색 과정 위법여부 조사                                             ","")
news_pre44

#45--------------------------
url <- "https://www.donga.com/news/article/all/20071210/8520971/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre45 <- gsub("\\d+", " ", news_pre)
news_pre45
news_pre45 <- str_replace_all(news_pre45,"조인직 기자  창닫기기사를 추천 하셨습니다네거티브 방지법 만들어야  베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서단독조남관의 역수사 지시감찰부 압수수색 과정 위법여부 조사                                             ","")
news_pre45

#46--------------------------
url <- "https://www.donga.com/news/article/all/20071211/8521316/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre46 <- gsub("\\d+", " ", news_pre)
news_pre46
news_pre46 <- str_replace_all(news_pre46,"길진균 기자 정원수 기자 촬영  김동주 기자촬영  김동주 기자창닫기기사를 추천 하셨습니다신당 수사검사 탄핵안 제출 한나라 헌정 유린베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서단독조남관의 역수사 지시감찰부 압수수색 과정 위법여부 조사                                             ","")
news_pre46

#47--------------------------
url <- "https://www.donga.com/news/article/all/20071212/8521765/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre47 <- gsub("\\d+", " ", news_pre)
news_pre47
news_pre47 <- str_replace_all(news_pre47," 창닫기기사를 추천 하셨습니다사설정동영 신당  굿판 이젠 끝내야베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서단독조남관의 역수사 지시감찰부 압수수색 과정 위법여부 조사                                             ","")
news_pre47

#48--------------------------
url <- "https://www.donga.com/news/article/all/20071210/8520973/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre48 <- gsub("\\d+", " ", news_pre)
news_pre48
news_pre48 <- str_replace_all(news_pre48,"박정훈 기자 ▶동아일보 대선  차 여론조사통계표▶동아일보 대선  차 여론조사빈도표▶동아일보 대선  차 여론조사 자료실 바로가기 창닫기기사를 추천 하셨습니다수사발표 이후  지지율 오차범위내 첫 역전베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서단독조남관의 역수사 지시감찰부 압수수색 과정 위법여부 조사                                             ","")
news_pre48

#49--------------------------
url <- "https://www.donga.com/news/article/all/20071212/8521766/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre49 <- gsub("\\d+", " ", news_pre)
news_pre49
news_pre49 <- str_replace_all(news_pre49,"창닫기기사를 추천 하셨습니다사설 정부는 전교조식 교육 전면 개혁하라베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서단독조남관의 역수사 지시감찰부 압수수색 과정 위법여부 조사                                             ","")
news_pre49

#50--------------------------
url <- "https://www.donga.com/news/article/all/20071207/8520505/1"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article_txt']", xmlValue)
news
news_pre <- gsub("[\r\n\t]", "", news)
news_pre <- gsub("[a-z]", "", news_pre)
news_pre <- gsub("[A-Z]", "", news_pre)
news_pre <- gsub("\\s+", " ", news_pre) # space 두 칸 이상 지우기.
news_pre <- gsub("[[:cntrl:]]", "", news_pre)
news_pre <- gsub("[[:punct:]]", "", news_pre)
news_pre <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pre)
news_pre50 <- gsub("\\d+", " ", news_pre)
news_pre50
news_pre50 <- str_replace_all(news_pre50,"황호택 수석논설위원 창닫기기사를 추천 하셨습니다황호택 칼럼 등 죽이기 공화국베스트 추천 뉴스한변 추미애 장관한동수 감찰부장 고발구속수사 하라김순덕의 도발뺑덕어미 같은 빵장관 헛소리 말라송평인 칼럼문재인 정권 하는 짓 레닌 때와 닮았다대통령의  시간과 청와대의 한 줄 답변청와대 풍향계황형준침묵하던 추미애 장관측 총장대행 결국 검찰 편으로 돌아서단독조남관의 역수사 지시감찰부 압수수색 과정 위법여부 조사                                             ","")
news_pre50

# 중간 50개 기사 병합(동아일보)
news_preA <-      c(news_pre1,news_pre2,news_pre3,news_pre4,news_pre5,news_pre6,news_pre7,
                   news_pre8,news_pre9,news_pre10,news_pre11,news_pre12,news_pre13,
                   news_pre14,news_pre15,news_pre16,news_pre17,news_pre18,news_pre19,news_pre20,
                   news_pre21,news_pre22,news_pre23,news_pre24,news_pre25,news_pre26,news_pre27,
                   news_pre28,news_pre29,news_pre30,news_pre31,news_pre32,news_pre33,news_pre34,
                   news_pre35,news_pre36,news_pre37,news_pre38,news_pre39,news_pre40,news_pre41,
                   news_pre42,news_pre43,news_pre44,news_pre45,news_pre46,news_pre47,news_pre48,
                   news_pre49,news_pre50)
news_preA

#1--------------------------
url <- "http://www.hani.co.kr/arti/politics/politics_general/257657.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree1 <- gsub("\\d+", " ", news_pree)
news_pree1
news_pree1 <- str_replace_all(news_pree1," 강희철 기자  더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출관련기사이명박 당선땐 특검수사 어떻게 대통령 직무수행 영향 없어다스도곡동땅 실소유주 규명이 핵심거짓말당선 무효 투표로 지켜달라이명박 특검법   대   가결청와대  논란 순리대로 풀 계기 마련특검이 검찰 살린것 같다진실이 거짓 이겨 진실 달라지지 않아 이슈 대선이명박 당선자 강남 소망교회 인맥 급부상개혁 개혁 외쳤지만 서민아픔에 무관심했다남북협력 기존틀에 상호주의 결합러에 시베리아 공동개발 제안중국엔 한단계 높은 관계 희망이 당선자 참여정부는 권위주의돈정치 근절한 정부 ","")
news_pree1

#2--------------------------
url <- "http://www.hani.co.kr/arti/politics/politics_general/256421.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree2 <- gsub("\\d+", " ", news_pree)
news_pree2
news_pree2 <- str_replace_all(news_pree2," 한겨레 관련기사▶ 성한용의 대선읽기 꿈쩍 않는 지지율희한한 대선 ▶ 성한용의 대선읽기 정동영문국현 부총리면 어떤가▶ 객원논설위원칼럼 정동영문국현 샴쌍둥이의 말로  이태수 ▶ 검사 탄핵안 오늘 본회의 예고 폭풍전야 더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출이슈 대선이명박 당선자 강남 소망교회 인맥 급부상개혁 개혁 외쳤지만 서민아픔에 무관심했다남북협력 기존틀에 상호주의 결합러에 시베리아 공동개발 제안중국엔 한단계 높은 관계 희망이 당선자 참여정부는 권위주의돈정치 근절한 정부 연재성한용 선임기자의 대선읽기노무현 당선시킨  대들이  대가 됐다고 이렇게살벌한 강자성한용의 대선읽기 낙법이 중요하다꿈쩍 않는 지지율희한한 대선정동영문국현 부총리면 어떤가 ","")
news_pree2

#3--------------------------
url <- "http://www.hani.co.kr/arti/society/society_general/256327.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree3 <- gsub("\\d+", " ", news_pree)
news_pree3
news_pree3 <- str_replace_all(news_pree3," 글 김소연 기자 사진 김진수 기자  더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출","")
news_pree3

#4--------------------------
url <- "http://www.hani.co.kr/arti/politics/politics_general/256092.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree4 <- gsub("\\d+", " ", news_pree)
news_pree4
news_pree4 <- str_replace_all(news_pree4," 강희철 기자  더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출관련기사대선후보들 막바지 득표 전략추미애 장터 유세단 강금실 엄지 유세단박근혜 하루 곳 순회 충남권 집중공략 이슈 대선이명박 당선자 강남 소망교회 인맥 급부상개혁 개혁 외쳤지만 서민아픔에 무관심했다남북협력 기존틀에 상호주의 결합러에 시베리아 공동개발 제안중국엔 한단계 높은 관계 희망이 당선자 참여정부는 권위주의돈정치 근절한 정부 ","")
news_pree4

#5--------------------------
url <- "http://www.hani.co.kr/arti/politics/politics_general/256202.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree5 <- gsub("\\d+", " ", news_pree)
news_pree5
news_pree5 <- str_replace_all(news_pree5," 김연기 기자 더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출","")
news_pree5

#6--------------------------
url <- "http://www.hani.co.kr/arti/politics/assembly/256336.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree6 <- gsub("\\d+", " ", news_pree)
news_pree6
news_pree6 <- str_replace_all(news_pree6," 정리이재명 기자 더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출관련기사대선후보 공약평가 ① 복지정책대선후보 공약평가 ② 통일외교안보정책 이슈 대선이명박 당선자 강남 소망교회 인맥 급부상개혁 개혁 외쳤지만 서민아픔에 무관심했다남북협력 기존틀에 상호주의 결합러에 시베리아 공동개발 제안중국엔 한단계 높은 관계 희망이 당선자 참여정부는 권위주의돈정치 근절한 정부 ","")
news_pree6

#7--------------------------
url <- "http://www.hani.co.kr/arti/politics/assembly/256090.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree7 <- gsub("\\d+", " ", news_pree)
news_pree7
news_pree7 <- str_replace_all(news_pree7,"성연철 기자  더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출이슈 대선이명박 당선자 강남 소망교회 인맥 급부상개혁 개혁 외쳤지만 서민아픔에 무관심했다남북협력 기존틀에 상호주의 결합러에 시베리아 공동개발 제안중국엔 한단계 높은 관계 희망이 당선자 참여정부는 권위주의돈정치 근절한 정부 ","")
news_pree7

#8--------------------------
url <- "http://www.hani.co.kr/arti/politics/assembly/255852.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree8 <- gsub("\\d+", " ", news_pree)
news_pree8
news_pree8 <- str_replace_all(news_pree8," 더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출관련기사세금 적게 걷고 복지 국가책임 이슈 대선이명박 당선자 강남 소망교회 인맥 급부상개혁 개혁 외쳤지만 서민아픔에 무관심했다남북협력 기존틀에 상호주의 결합러에 시베리아 공동개발 제안중국엔 한단계 높은 관계 희망이 당선자 참여정부는 권위주의돈정치 근절한 정부 ","")
news_pree8

#9--------------------------
url <- "http://www.hani.co.kr/arti/politics/assembly/256117.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree9 <- gsub("\\d+", " ", news_pree)
news_pree9
news_pree9 <- str_replace_all(news_pree9,"이재명 기자  더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출관련기사이회창 후보 북한 핵폐기 등강경한 상호주의 이슈 대선이명박 당선자 강남 소망교회 인맥 급부상개혁 개혁 외쳤지만 서민아픔에 무관심했다남북협력 기존틀에 상호주의 결합러에 시베리아 공동개발 제안중국엔 한단계 높은 관계 희망이 당선자 참여정부는 권위주의돈정치 근절한 정부 ","")
news_pree9

#10--------------------------
url <- "http://www.hani.co.kr/arti/economy/finance/258354.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree10 <- gsub("\\d+", " ", news_pree)
news_pree10
news_pree10 <- str_replace_all(news_pree10," 윤은숙 기자  더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출","")
news_pree10

#11--------------------------
url <- "http://www.hani.co.kr/arti/politics/politics_general/258351.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree11 <- gsub("\\d+", " ", news_pree)
news_pree11
news_pree11 <- str_replace_all(news_pree11," 서둘러 더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출이슈 대선이명박 당선자 강남 소망교회 인맥 급부상개혁 개혁 외쳤지만 서민아픔에 무관심했다남북협력 기존틀에 상호주의 결합러에 시베리아 공동개발 제안중국엔 한단계 높은 관계 희망이 당선자 참여정부는 권위주의돈정치 근절한 정부 ","")
news_pree11

#12--------------------------
url <- "http://www.hani.co.kr/arti/opinion/column/258285.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree12 <- gsub("\\d+", " ", news_pree)
news_pree12
news_pree12 <- str_replace_all(news_pree12,"조국서울대 법대 교수 더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출연재시론시론 산업도 노동자도 죽이는 세계 유일 누더기법  박경신시론 한국계 연방하원의원  명이 탄생할 가능성  장태한시론 남의 나라의 그러나 인류사적 선거  김준형시론 영남대를 바로잡아야 시대를 바로잡는다  이원영시론 괜찮아 도와줄게 같이 해보자  이승욱 ","")
news_pree12

#13--------------------------
url <- "http://www.hani.co.kr/arti/politics/politics_general/258109.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree13 <- gsub("\\d+", " ", news_pree)
news_pree13
news_pree13 <- str_replace_all(news_pree13,"유주현 기자  한겨레 관련기사 ▶ 참여정부 냉엄한 심판고강도 성장정책 예고▶ 과제도덕성 논란 씻어내고 국민 통합 시급▶ 당선요인 강한 추진력과 경제대통령 이미지 통했다▶ 경제정책 감세규제완화로   성장 밀고 나간다▶ 한나라당 두번 패배 뒤 정권 되찾았다 잔칫집 ▶ 이당선자 가계 재벌정치인의사 주류사회 두루 진출 ▶ 통합신당 분열 땐 궤멸 단합쇄신 요구 거셀 듯▶ 택배청소경비원 내 한표 언제 행사하나 더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출","")
news_pree13

#14--------------------------
url <- "http://www.hani.co.kr/arti/politics/politics_general/258177.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree14 <- gsub("\\d+", " ", news_pree)
news_pree14
news_pree14 <- str_replace_all(news_pree14," 이본영 기자  더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출이슈 대선이명박 당선자 강남 소망교회 인맥 급부상개혁 개혁 외쳤지만 서민아픔에 무관심했다남북협력 기존틀에 상호주의 결합러에 시베리아 공동개발 제안중국엔 한단계 높은 관계 희망이 당선자 참여정부는 권위주의돈정치 근절한 정부 ","")
news_pree14

#15--------------------------
url <- "http://www.hani.co.kr/arti/politics/politics_general/257985.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree15 <- gsub("\\d+", " ", news_pree)
news_pree15
news_pree15 <- str_replace_all(news_pree15," 이유주현 기자 한겨레 관련기사 ▶ 여러분의 선택이 대한민국  년을 바꿉니다▶ 동영상이 움직인 표심의 향배는▶ 전화로 문자로 투표 참여 막판 호소▶ 정치열기 높은 수도권  대의 선택은▶ 특검은 고양이 목에 방울달기 ▶ 강남 재건축 시장 가보니 대선 뒤 들썩 글쎄요 잘해야▶ 권태선칼럼 닉슨 고어 그리고 이명박 더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출이슈 대선이명박 당선자 강남 소망교회 인맥 급부상개혁 개혁 외쳤지만 서민아픔에 무관심했다남북협력 기존틀에 상호주의 결합러에 시베리아 공동개발 제안중국엔 한단계 높은 관계 희망이 당선자 참여정부는 권위주의돈정치 근절한 정부 ","")
news_pree15

#16--------------------------
url <- "http://www.hani.co.kr/arti/politics/politics_general/257942.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree16 <- gsub("\\d+", " ", news_pree)
news_pree16
news_pree16 <- str_replace_all(news_pree16," 권태호 성연철 김태규 기자  한겨레 관련기사 ▶ 여러분의 선택이 대한민국  년을 바꿉니다▶ 동영상이 움직인 표심의 향배는▶ 전화로 문자로 투표 참여 막판 호소▶ 정치열기 높은 수도권  대의 선택은▶ 유권자 흥행 실패 그들만의 잔치▶ 특검은 고양이 목에 방울달기 ▶ 강남 재건축 시장 가보니 대선 뒤 들썩 글쎄요 잘해야▶ 권태선칼럼 닉슨 고어 그리고 이명박 더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출관련기사동영상이 움직인 표심의 향배는대선후보들 유세 첫 장소와 마지막 장소는 ","")
news_pree16

#17--------------------------
url <- "http://www.hani.co.kr/arti/politics/politics_general/257260.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree17 <- gsub("\\d+", " ", news_pree)
news_pree17
news_pree17 <- str_replace_all(news_pree17,"한겨레 관련기사 ▶ 단독 이명박 내가 설립 광운대 강연 동영상 파문 ▶ 이 후보 해명과 정반대 육성선거막판 도덕성 논란 재점화 ▶  말바꾸기 어디까지동영상 해명 동업자 홍보과정서 나온 말 ▶  동영상 빅  캠프에 억 달라 차례로 접촉 ▶ 추가 자필메모동영상까지검찰발표 반박자료에 휘청 ▶ 한나라당 새로운 내용 없고 실체적 진실과 달라 ▶ 신당이회창쪽 이 후보 즉각 사퇴법의 심판 받아야 ▶ 검찰 곤혹수사결과에 하등의 영향없다 ▶ 김경준가족 수사발표  일전 통화 검찰이 협상 더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출","")
news_pree17

#18--------------------------
url <- "http://www.hani.co.kr/arti/politics/politics_general/257644.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree18 <- gsub("\\d+", " ", news_pree)
news_pree18
news_pree18 <- str_replace_all(news_pree18," 조혜정 기자  연합뉴스 더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출이슈 대선이명박 당선자 강남 소망교회 인맥 급부상개혁 개혁 외쳤지만 서민아픔에 무관심했다남북협력 기존틀에 상호주의 결합러에 시베리아 공동개발 제안중국엔 한단계 높은 관계 희망이 당선자 참여정부는 권위주의돈정치 근절한 정부 ","")
news_pree18

#19--------------------------
url <- "http://www.hani.co.kr/arti/politics/politics_general/257570.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree19 <- gsub("\\d+", " ", news_pree)
news_pree19
news_pree19 <- str_replace_all(news_pree19," 온라인뉴스팀 김미영 기자  한겨레 관련기사 ▶ 단독 이명박 내가 설립 광운대 강연 동영상 파문 ▶ 이 후보 해명과 정반대 육성선거막판 도덕성 논란 재점화 ▶  말바꾸기 어디까지동영상 해명 동업자 홍보과정서 나온 말 ▶  동영상 빅  캠프에 억 달라 차례로 접촉 ▶ 추가 자필메모동영상까지검찰발표 반박자료에 휘청 ▶ 한나라당 새로운 내용 없고 실체적 진실과 달라 ▶ 신당이회창쪽 이 후보 즉각 사퇴법의 심판 받아야 ▶ 검찰 곤혹수사결과에 하등의 영향없다 ▶ 김경준가족 수사발표  일전 통화 검찰이 협상 더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출","")
news_pree19

#20--------------------------
url <- "http://www.hani.co.kr/arti/opinion/column/257703.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree20 <- gsub("\\d+", " ", news_pree)
news_pree20
news_pree20 <- str_replace_all(news_pree20," 정남기논설위원  더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출연재아침햇발아침 햇발 살아있는 권력 수사와 영생 권력 검찰  손원제아침햇발 시진핑 방한보다 중요한 것박민희아침 햇발 친문 세력화 민주주의   성공의 조건  신승근아침 햇발 국회의사당에 원전을 짓자  안영춘아침햇발 재계 리더십의 부활 ","")
news_pree20

#21--------------------------
url <- "http://www.hani.co.kr/arti/politics/politics_general/257903.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree21 <- gsub("\\d+", " ", news_pree)
news_pree21
news_pree21 <- str_replace_all(news_pree21," 황준범 김태규 기자  더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출이슈 대선이명박 당선자 강남 소망교회 인맥 급부상개혁 개혁 외쳤지만 서민아픔에 무관심했다남북협력 기존틀에 상호주의 결합러에 시베리아 공동개발 제안중국엔 한단계 높은 관계 희망이 당선자 참여정부는 권위주의돈정치 근절한 정부 ","")
news_pree21

#22--------------------------
url <- "http://www.hani.co.kr/arti/politics/assembly/257674.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree22 <- gsub("\\d+", " ", news_pree)
news_pree22
news_pree22 <- str_replace_all(news_pree22," 권태호 이지은 기자  한겨레 관련기사 ▶ 거리 달군  동영상이명박 사퇴흔들리지 말자   대결▶ 이명박 설립 자인 인터넷 폭발 표심 흔드나▶ 단독 이명박 내가 설립 광운대 강연 동영상 파문 ▶ 사용 안했다는 홍보책자에도 수익률  ▶ 판세 못바꿀것 역전발판 마련▶ 초유의 대선후보 특검 불씨 총선까지 활활▶ 이명박 개입 밝혀올초 직접 들어▶  동영상 파문에 막판 광고전 후끈 더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출이슈 대선이명박 당선자 강남 소망교회 인맥 급부상개혁 개혁 외쳤지만 서민아픔에 무관심했다남북협력 기존틀에 상호주의 결합러에 시베리아 공동개발 제안중국엔 한단계 높은 관계 희망이 당선자 참여정부는 권위주의돈정치 근절한 정부 ","")
news_pree22

#23--------------------------
url <- "http://www.hani.co.kr/arti/politics/politics_general/257354.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree23 <- gsub("\\d+", " ", news_pree)
news_pree23
news_pree23 <- str_replace_all(news_pree23," 권태호 기자  더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출이슈 대선이명박 당선자 강남 소망교회 인맥 급부상개혁 개혁 외쳤지만 서민아픔에 무관심했다남북협력 기존틀에 상호주의 결합러에 시베리아 공동개발 제안중국엔 한단계 높은 관계 희망이 당선자 참여정부는 권위주의돈정치 근절한 정부 ","")
news_pree23

#24--------------------------
url <- "http://www.hani.co.kr/arti/politics/politics_general/257352.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree24 <- gsub("\\d+", " ", news_pree)
news_pree24
news_pree24 <- str_replace_all(news_pree24,"성연철 이지은 기자  한겨레 관련기사 ▶ 단독 이명박 내가 설립 광운대 강연 동영상 파문 ▶ 이 후보 해명과 정반대 육성선거막판 도덕성 논란 재점화 ▶  말바꾸기 어디까지동영상 해명 동업자 홍보과정서 나온 말 ▶  동영상 빅  캠프에 억 달라 차례로 접촉 ▶ 추가 자필메모동영상까지검찰발표 반박자료에 휘청 ▶ 한나라당 새로운 내용 없고 실체적 진실과 달라 ▶ 신당이회창쪽 이 후보 즉각 사퇴법의 심판 받아야 ▶ 검찰 곤혹수사결과에 하등의 영향없다 ▶ 김경준가족 수사발표  일전 통화 검찰이 협상 더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출이슈 대선이명박 당선자 강남 소망교회 인맥 급부상개혁 개혁 외쳤지만 서민아픔에 무관심했다남북협력 기존틀에 상호주의 결합러에 시베리아 공동개발 제안중국엔 한단계 높은 관계 희망이 당선자 참여정부는 권위주의돈정치 근절한 정부 ","")
news_pree24

#25--------------------------
url <- "http://www.hani.co.kr/arti/opinion/column/257601.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree25 <- gsub("\\d+", " ", news_pree)
news_pree25
news_pree25 <- str_replace_all(news_pree25," 박원순 희망제작소 상임이사 더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출연재박원순 칼럼박원순칼럼 국화꽃 피우는 데도 천둥이 울거늘박원순칼럼 겸허해야 성공한다박원순칼럼 하인 행세 대신 사대부 행세를박원순칼럼 빌 게이츠와 로빈 후드박원순칼럼  년  월 현재 사회윤리 기상도 ","")
news_pree25

#26--------------------------
url <- "http://www.hani.co.kr/arti/opinion/column/257587.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree26 <- gsub("\\d+", " ", news_pree)
news_pree26
news_pree26 <- str_replace_all(news_pree26," 이종태한국청소년정책연구원장 더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출연재기고기고 윤석열 반정치의 정치  김종구기고 지리산 산악열차가 그린뉴딜인가  윤여창기고 임대차  법에 의한 전세난은 가짜입니다  구본기기고 돌봄교실은 교육이 아니라는 학교에  김현미기고 우리는 모두 아이를 돕는 같은 편  정선욱 ","")
news_pree26

#27--------------------------
url <- "http://www.hani.co.kr/arti/politics/politics_general/257353.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree27 <- gsub("\\d+", " ", news_pree)
news_pree27
news_pree27 <- str_replace_all(news_pree27,"임석규 신승근 조혜정 기자 한겨레 관련기사 ▶ 단독 이명박 내가 설립 광운대 강연 동영상 파문 ▶ 이 후보 해명과 정반대 육성선거막판 도덕성 논란 재점화 ▶  말바꾸기 어디까지동영상 해명 동업자 홍보과정서 나온 말 ▶  동영상 빅  캠프에 억 달라 차례로 접촉 ▶ 추가 자필메모동영상까지검찰발표 반박자료에 휘청 ▶ 한나라당 새로운 내용 없고 실체적 진실과 달라 ▶ 신당이회창쪽 이 후보 즉각 사퇴법의 심판 받아야 ▶ 검찰 곤혹수사결과에 하등의 영향없다 ▶ 김경준가족 수사발표  일전 통화 검찰이 협상 더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출","")
news_pree27

#28--------------------------
url <- "http://www.hani.co.kr/arti/politics/politics_general/256638.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree28 <- gsub("\\d+", " ", news_pree)
news_pree28
news_pree28 <- str_replace_all(news_pree28," 황준범 김남일 기자  더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출","")
news_pree28

#29--------------------------
url <- "http://www.hani.co.kr/arti/politics/politics_general/257659.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree29 <- gsub("\\d+", " ", news_pree)
news_pree29
news_pree29 <- str_replace_all(news_pree29," 김태규 황준범 기자  더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출이슈 대선이명박 당선자 강남 소망교회 인맥 급부상개혁 개혁 외쳤지만 서민아픔에 무관심했다남북협력 기존틀에 상호주의 결합러에 시베리아 공동개발 제안중국엔 한단계 높은 관계 희망이 당선자 참여정부는 권위주의돈정치 근절한 정부 ","")
news_pree29

#30--------------------------
url <- "http://www.hani.co.kr/arti/politics/politics_general/257361.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree30 <- gsub("\\d+", " ", news_pree)
news_pree30
news_pree30 <- str_replace_all(news_pree30,"임석규 기자 한겨레 관련기사 ▶ 단독 이명박 내가 설립 광운대 강연 동영상 파문 ▶ 이 후보 해명과 정반대 육성선거막판 도덕성 논란 재점화 ▶  말바꾸기 어디까지동영상 해명 동업자 홍보과정서 나온 말 ▶  동영상 빅  캠프에 억 달라 차례로 접촉 ▶ 추가 자필메모동영상까지검찰발표 반박자료에 휘청 ▶ 한나라당 새로운 내용 없고 실체적 진실과 달라 ▶ 신당이회창쪽 이 후보 즉각 사퇴법의 심판 받아야 ▶ 검찰 곤혹수사결과에 하등의 영향없다 ▶ 김경준가족 수사발표  일전 통화 검찰이 협상 더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출","")
news_pree30

#31--------------------------
url <- "http://www.hani.co.kr/arti/politics/politics_general/257636.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree31 <- gsub("\\d+", " ", news_pree)
news_pree31
news_pree31 <- str_replace_all(news_pree31," 글 영상 박수진 피디  더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출관련기사영상 르포 민심 택시 대선을 말하다 ②광주영상 르포 민심 택시 대선을 말하다 ①부산 ","")
news_pree31

#32--------------------------
url <- "http://www.hani.co.kr/arti/politics/politics_general/257647.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree32 <- gsub("\\d+", " ", news_pree)
news_pree32
news_pree32 <- str_replace_all(news_pree32," 신승근 기자  더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출이슈 대선이명박 당선자 강남 소망교회 인맥 급부상개혁 개혁 외쳤지만 서민아픔에 무관심했다남북협력 기존틀에 상호주의 결합러에 시베리아 공동개발 제안중국엔 한단계 높은 관계 희망이 당선자 참여정부는 권위주의돈정치 근절한 정부 ","")
news_pree32

#33--------------------------
url <- "http://www.hani.co.kr/arti/politics/politics_general/257064.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree33 <- gsub("\\d+", " ", news_pree)
news_pree33
news_pree33 <- str_replace_all(news_pree33," 이유주현 기자  한겨레 관련기사 ▶ 단독 이명박 광운대 특강서 에 투자하라 동영상 확보 ▶ 정혜신칼럼 다양한 성공시대 ▶  검찰발표와 배치되는 김경준씨 자필메모 발견 ▶ 임채정 국회의장 이명박 특검법  일 직권상정 시사 ▶ 심텍 회장 이명박 회장이 직접 투자 권유했다 ▶ 이명박 무혐의 섣부른 결론의혹만 더 키웠다▶ 박영선 동영상 본 사람까지 처벌해달라▶ 임채정 국회의장 이명박 특검법  일 직권상정 시사 더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출","")
news_pree33

#34--------------------------
url <- "http://www.hani.co.kr/arti/politics/assembly/257348.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree34 <- gsub("\\d+", " ", news_pree)
news_pree34
news_pree34 <- str_replace_all(news_pree34," 유신재 기자  더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출이슈 대선이명박 당선자 강남 소망교회 인맥 급부상개혁 개혁 외쳤지만 서민아픔에 무관심했다남북협력 기존틀에 상호주의 결합러에 시베리아 공동개발 제안중국엔 한단계 높은 관계 희망이 당선자 참여정부는 권위주의돈정치 근절한 정부 ","")
news_pree34

#35--------------------------
url <- "http://www.hani.co.kr/arti/society/labor/257137.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree35 <- gsub("\\d+", " ", news_pree)
news_pree35
news_pree35 <- str_replace_all(news_pree35," 황보연 기자  더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출","")
news_pree35

#36--------------------------
url <- "http://www.hani.co.kr/arti/politics/politics_general/256495.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree36 <- gsub("\\d+", " ", news_pree)
news_pree36
news_pree36 <- str_replace_all(news_pree36," 박종찬 이유주현 기자  한겨레 관련기사 ▶ 단독 이명박 내가 설립 광운대 강연 동영상 파문 ▶ 이 후보 해명과 정반대 육성선거막판 도덕성 논란 재점화 ▶  말바꾸기 어디까지동영상 해명 동업자 홍보과정서 나온 말 ▶  동영상 빅  캠프에 억 달라 차례로 접촉 ▶ 추가 자필메모동영상까지검찰발표 반박자료에 휘청 ▶ 한나라당 새로운 내용 없고 실체적 진실과 달라 ▶ 신당이회창쪽 이 후보 즉각 사퇴법의 심판 받아야 ▶ 검찰 곤혹수사결과에 하등의 영향없다 ▶ 김경준가족 수사발표  일전 통화 검찰이 협상 더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출관련기사박영선  사무실서 이명박 인터뷰 동영상 급속확산 이슈 대선이명박 당선자 강남 소망교회 인맥 급부상개혁 개혁 외쳤지만 서민아픔에 무관심했다남북협력 기존틀에 상호주의 결합러에 시베리아 공동개발 제안중국엔 한단계 높은 관계 희망이 당선자 참여정부는 권위주의돈정치 근절한 정부 ","")
news_pree36

#37--------------------------
url <- "http://www.hani.co.kr/arti/politics/politics_general/257132.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree37 <- gsub("\\d+", " ", news_pree)
news_pree37
news_pree37 <- str_replace_all(news_pree37," 조혜정 이본영 기자  더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출이슈 대선이명박 당선자 강남 소망교회 인맥 급부상개혁 개혁 외쳤지만 서민아픔에 무관심했다남북협력 기존틀에 상호주의 결합러에 시베리아 공동개발 제안중국엔 한단계 높은 관계 희망이 당선자 참여정부는 권위주의돈정치 근절한 정부 ","")
news_pree37

#38--------------------------
url <- "http://www.hani.co.kr/arti/politics/politics_general/256386.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree38 <- gsub("\\d+", " ", news_pree)
news_pree38
news_pree38 <- str_replace_all(news_pree38," 이유주현 기자  더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출관련기사이명박 공세적 방어 정동영 웃음띤 공격위장전입위장취업거짓말 이명박 후보 도덕성 협공 대  없는 맥빠진 토론 그대로 이슈 대선이명박 당선자 강남 소망교회 인맥 급부상개혁 개혁 외쳤지만 서민아픔에 무관심했다남북협력 기존틀에 상호주의 결합러에 시베리아 공동개발 제안중국엔 한단계 높은 관계 희망이 당선자 참여정부는 권위주의돈정치 근절한 정부 ","")
news_pree38

#39--------------------------
url <- "http://www.hani.co.kr/arti/politics/politics_general/257438.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree39 <- gsub("\\d+", " ", news_pree)
news_pree39
news_pree39 <- str_replace_all(news_pree39,"강희철 권태호 유신재 기자  더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출","")
news_pree39

#40--------------------------
url <- "http://www.hani.co.kr/arti/politics/politics_general/257447.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree40 <- gsub("\\d+", " ", news_pree)
news_pree40
news_pree40 <- str_replace_all(news_pree40," 황준범 기자  더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출","")
news_pree40

#41--------------------------
url <- "http://www.hani.co.kr/arti/society/society_general/256872.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree41 <- gsub("\\d+", " ", news_pree)
news_pree41
news_pree41 <- str_replace_all(news_pree41," 김태규 기자  한겨레 관련기사 ▶ 단독 이명박 내가 설립 광운대 강연 동영상 파문 ▶ 이 후보 해명과 정반대 육성선거막판 도덕성 논란 재점화 ▶  말바꾸기 어디까지동영상 해명 동업자 홍보과정서 나온 말 ▶  동영상 빅  캠프에 억 달라 차례로 접촉 ▶ 추가 자필메모동영상까지검찰발표 반박자료에 휘청 ▶ 한나라당 새로운 내용 없고 실체적 진실과 달라 ▶ 신당이회창쪽 이 후보 즉각 사퇴법의 심판 받아야 ▶ 검찰 곤혹수사결과에 하등의 영향없다 ▶ 김경준가족 수사발표  일전 통화 검찰이 협상 더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출관련기사심텍 회장 편지 내용은 탄핵안 긴장고조민변  수사 공정성 의심전면 재수사를이명박 회장이 직접 투자 권유해 ","")
news_pree41

#42--------------------------
url <- "http://www.hani.co.kr/arti/politics/politics_general/256212.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree42 <- gsub("\\d+", " ", news_pree)
news_pree42
news_pree42 <- str_replace_all(news_pree42,"한겨레  조계완 기자 한겨레 관련기사▶도덕성 그까이거 내 집값 올리면 도장 꽉 ▶ 이명박의 확인 사살 헌납 ▶ 이 후보의 진짜 전 재산은▶ 선거때만 찾는 정치인재래시장상인들차라리 오지마라▶ 대선후보들  만명 일터 재래시장 해법 더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출","")
news_pree42

#43--------------------------
url <- "http://www.hani.co.kr/arti/politics/bluehouse/257349.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree43 <- gsub("\\d+", " ", news_pree)
news_pree43
news_pree43 <- str_replace_all(news_pree43," 신승근 기자  한겨레 관련기사 ▶ 단독 이명박 내가 설립 광운대 강연 동영상 파문 ▶ 이 후보 해명과 정반대 육성선거막판 도덕성 논란 재점화 ▶  말바꾸기 어디까지동영상 해명 동업자 홍보과정서 나온 말 ▶  동영상 빅  캠프에 억 달라 차례로 접촉 ▶ 추가 자필메모동영상까지검찰발표 반박자료에 휘청 ▶ 한나라당 새로운 내용 없고 실체적 진실과 달라 ▶ 신당이회창쪽 이 후보 즉각 사퇴법의 심판 받아야 ▶ 검찰 곤혹수사결과에 하등의 영향없다 ▶ 김경준가족 수사발표  일전 통화 검찰이 협상 더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출이슈 대선이명박 당선자 강남 소망교회 인맥 급부상개혁 개혁 외쳤지만 서민아픔에 무관심했다남북협력 기존틀에 상호주의 결합러에 시베리아 공동개발 제안중국엔 한단계 높은 관계 희망이 당선자 참여정부는 권위주의돈정치 근절한 정부 ","")
news_pree43

#44--------------------------
url <- "http://www.hani.co.kr/arti/politics/politics_general/256878.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree44 <- gsub("\\d+", " ", news_pree)
news_pree44
news_pree44 <- str_replace_all(news_pree44," 이지은 기자  더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출","")
news_pree44

#45--------------------------
url <- "http://www.hani.co.kr/arti/politics/politics_general/257365.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree45 <- gsub("\\d+", " ", news_pree)
news_pree45
news_pree45 <- str_replace_all(news_pree45," 황준범 기자  한겨레 관련기사 ▶ 단독 이명박 내가 설립 광운대 강연 동영상 파문 ▶ 이 후보 해명과 정반대 육성선거막판 도덕성 논란 재점화 ▶  말바꾸기 어디까지동영상 해명 동업자 홍보과정서 나온 말 ▶  동영상 빅  캠프에 억 달라 차례로 접촉 ▶ 추가 자필메모동영상까지검찰발표 반박자료에 휘청 ▶ 한나라당 새로운 내용 없고 실체적 진실과 달라 ▶ 신당이회창쪽 이 후보 즉각 사퇴법의 심판 받아야 ▶ 검찰 곤혹수사결과에 하등의 영향없다 ▶ 김경준가족 수사발표  일전 통화 검찰이 협상 더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출","")
news_pree45

#46--------------------------
url <- "http://www.hani.co.kr/arti/politics/politics_general/257441.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree46 <- gsub("\\d+", " ", news_pree)
news_pree46
news_pree46 <- str_replace_all(news_pree46," 황준범 김소연 기자  더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출","")
news_pree46

#47--------------------------
url <- "http://www.hani.co.kr/arti/opinion/editorial/256791.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree47 <- gsub("\\d+", " ", news_pree)
news_pree47
news_pree47 <- str_replace_all(news_pree47," 더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출","")
news_pree47

#48--------------------------
url <- "http://www.hani.co.kr/arti/opinion/column/256047.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree48 <- gsub("\\d+", " ", news_pree)
news_pree48
news_pree48 <- str_replace_all(news_pree48," 여현호  논설위원  더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출연재아침햇발아침 햇발 살아있는 권력 수사와 영생 권력 검찰  손원제아침햇발 시진핑 방한보다 중요한 것박민희아침 햇발 친문 세력화 민주주의   성공의 조건  신승근아침 햇발 국회의사당에 원전을 짓자  안영춘아침햇발 재계 리더십의 부활 ","")
news_pree48

#49--------------------------
url <- "http://www.hani.co.kr/arti/opinion/column/256031.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree49 <- gsub("\\d+", " ", news_pree)
news_pree49
news_pree49 <- str_replace_all(news_pree49,"이태수꽃동네현도사회복지대 교수 더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출연재객원논설위원 칼럼객원논설위원칼럼 이명박 정부 일자리정책  년  김유선객원논설위원칼럼 정책 실패자 백서를 만들자  김상종객원논설위원칼럼 복지의 강을 따라 진보의 바다로  이태수객원논설위원칼럼  월 고용대란설의 허구  김유선객원논설위원칼럼 인터넷 재갈을 뿌리치자  김상종 ","")
news_pree49

#50--------------------------
url <- "http://www.hani.co.kr/arti/politics/politics_general/255628.html"
web <- GET(url)
html <- htmlTreeParse(web, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode <- xmlRoot(html)
news <- xpathSApply(rootNode, "//div[@class='article-text']", xmlValue)
news
news_pree <- gsub("[\r\n\t]", "", news)
news_pree <- gsub("[a-z]", "", news_pree)
news_pree <- gsub("[A-Z]", "", news_pree)
news_pree <- gsub("\\s+", " ", news_pree) # space 두 칸 이상 지우기.
news_pree <- gsub("[[:cntrl:]]", "", news_pree)
news_pree <- gsub("[[:punct:]]", "", news_pree)
news_pree <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_pree)
news_pree50 <- gsub("\\d+", " ", news_pree)
news_pree50
news_pree50 <- str_replace_all(news_pree50,"강희철 기자  더불어 행복한 세상을 만드는 언론 한겨레 구독신청              후원 노출 기사번호 후원노출이슈 대선이명박 당선자 강남 소망교회 인맥 급부상개혁 개혁 외쳤지만 서민아픔에 무관심했다남북협력 기존틀에 상호주의 결합러에 시베리아 공동개발 제안중국엔 한단계 높은 관계 희망이 당선자 참여정부는 권위주의돈정치 근절한 정부 ","")
news_pree50

# 나머지 50개 기사 병합(한겨례 신문)
news_preB <- c(news_pree1,news_pree2,news_pree3,news_pree4,news_pree5,news_pree6,
                   news_pree7,news_pree8,news_pree9,news_pree10,news_pree11,news_pree12,news_pree13,
                   news_pree14,news_pree15,news_pree16,news_pree17,news_pree18,news_pree19,news_pree20,
                   news_pree21,news_pree22,news_pree23,news_pree24,news_pree25,news_pree26,news_pree27,
                   news_pree28,news_pree29,news_pree30,news_pree31,news_pree32,news_pree33,news_pree34,
               news_pree35,news_pree36,news_pree37,news_pree38,news_pree39,news_pree40,news_pree41,
               news_pree42,news_pree43,news_pree44,news_pree45,news_pree46,news_pree47,news_pree48,
               news_pree49,news_pree50)
news_preB 

# 100개 기사 병합
news_preC <- unlist(c(news_preA, news_preB))

# 재 전처리
news_preC <- gsub("[\r\n\t]", "", news_preC)
news_preC <- gsub("[a-z]", "", news_preC)
news_preC <- gsub("[A-Z]", "", news_preC)
news_preC <- gsub("\\s+", " ", news_preC) # space 두 칸 이상 지우기.
news_preC <- gsub("[[:cntrl:]]", "", news_preC)
news_preC <- gsub("[[:punct:]]", "", news_preC)
news_preC <- gsub("\\d+", " ", news_preC)
news_preC <- gsub("[\U4E00-\U9FFF\U3000-\U303F]", "", news_preC)
news_preC <- gsub("[■△●▶○∼▼→▲▽>]", " ", news_preC)
news_preC <- gsub("[④③盧▷李]", "", news_preC)
news_preC <- as.list(news_preC)
news_preC

# 단어 추출
news_noun <- extractNoun(news_preC)
news_noun <- unlist(news_noun) 
news_noun <- str_replace_all(news_noun, "동영상", "")
news_noun <- str_replace_all(news_noun, "기사", "")
news_noun <- str_replace_all(news_noun, "포토", "")
news_noun <- str_replace_all(news_noun, "뉴스", "")
news_noun <- str_replace_all(news_noun, "일반", "")
news_noun <- str_replace_all(news_noun, "아래", "")
news_noun <- str_replace_all(news_noun, "중앙", "")
news_noun <- str_replace_all(news_noun, "일보", "")
news_noun <- str_replace_all(news_noun, "후보", "")
news_noun <- str_replace_all(news_noun, "이명", "이명박")
news_noun <- str_replace_all(news_noun, "이회", "이회창")
news_noun <- str_replace_all(news_noun, "정동", "정동영")
news_noun <- str_replace_all(news_noun, "대선", "")
news_noun <- str_replace_all(news_noun, "노무", "")
news_noun <- str_replace_all(news_noun, "대통령", "")
news_noun <- str_replace_all(news_noun, "비비", "비비케이")
news_noun <- str_replace_all(news_noun, "케이", "비비케이")
news_noun <- str_replace_all(news_noun, "추미애", "")
news_noun <- str_replace_all(news_noun, "들이", "")
news_noun <- str_replace_all(news_noun, "시간", "")
news_noun <- str_replace_all(news_noun, "이번", "")
news_noun <- str_replace_all(news_noun, "추천", "")
news_noun <- str_replace_all(news_noun, "하라김순덕", "")
news_noun <- str_replace_all(news_noun, "답변청와대", "")
news_noun <- str_replace_all(news_noun, "때문", "")
news_noun <- str_replace_all(news_noun, "관련", "")
news_noun <- str_replace_all(news_noun, "하기", "")
news_noun <- str_replace_all(news_noun, "뺑덕", "")
news_noun <- str_replace_all(news_noun, "닮았다한변", "")
news_noun <- str_replace_all(news_noun, "레닌", "")
news_noun <- str_replace_all(news_noun, "문재", "")
news_noun <- str_replace_all(news_noun, "장관한동수", "")
news_noun <- str_replace_all(news_noun, "빵장관", "")
news_noun <- str_replace_all(news_noun, "말라", "")
news_noun <- str_replace_all(news_noun, "이후", "")
news_noun <- str_replace_all(news_noun, "어미", "")
news_noun <- str_replace_all(news_noun, "오전", "")
news_noun <- str_replace_all(news_noun, "이상", "")
news_noun <- str_replace_all(news_noun, "오후", "")
news_noun <- str_replace_all(news_noun, "눈물김근식", "")
news_noun <- str_replace_all(news_noun, "이낙연", "")
news_noun <- str_replace_all(news_noun, "우려윤석열", "")
news_noun <- str_replace_all(news_noun, "최강욱", "")
news_noun <- str_replace_all(news_noun, "설전조은산", "")
news_noun <- str_replace_all(news_noun, "쓴소", "")
news_noun <- str_replace_all(news_noun, "단독조남관", "")
news_noun <- str_replace_all(news_noun, "창닫기를", "")
news_noun <- str_replace_all(news_noun, "박은정", "")
news_noun <- str_replace_all(news_noun, "이인제", "")
news_noun <- str_replace_all(news_noun, "패싱", "")
news_noun <- str_replace_all(news_noun, "이재", "")
news_noun <- str_replace_all(news_noun, "국어", "")
news_noun <- str_replace_all(news_noun, "않았다", "")
news_noun <- str_replace_all(news_noun, "조사하태경", "")
news_noun <- str_replace_all(news_noun, "때다", "")
news_noun <- str_replace_all(news_noun, "쉽지않", "")
news_noun <- str_replace_all(news_noun, "사설밀리면", "")
news_noun

# 말뭉치 생성
newsCorpus <- Corpus(VectorSource(news_noun))
TDM <- TermDocumentMatrix(newsCorpus, control=list(wordLengths=c(4,16)))
# 문자 4~16자리를 뽑아내기
tdm.df <- as.data.frame(as.matrix(TDM))

wordResult <- sort(rowSums(tdm.df), decreasing=T)
myNames <- names(wordResult)
df <- data.frame(word=myNames, freq=wordResult)
df

# WordCloud2
pal<-brewer.pal(12, "YlOrRd")
colorVec = rep(pal, length.out=nrow(demoFreq))
wordcloud2(df, color = colorVec, backgroundColor = "grey", minSize = 10, shape="circle", size=0.8)

# 3D PieChart
library(plotrix)
lab = paste(df$word[1:20],"\n",round(df$freq[1:20]/sum(df$freq[1:20])*100,1),"%")
pie3D(df$freq[1:20] ,labels = lab, explode = 0.1, main = "17th Presidential Election", labelcex=0.7)

# 연관어 분석(Igraph)
lword <- Map(extractNoun, news_preC)
lword <- unique(lword)
filter1 <- function(x){
  nchar(x) >=2 && nchar(x) <=4
}
filter2 <- function(x){
  Filter(filter1, x)
}
lword <- sapply(lword, filter2)
lword <- unique(lword)
head(lword)

i=1

while(i<=98){
  
  lword[[i]]<-str_replace_all(lword[[i]],"칼럼","")
  lword[[i]]<-str_replace_all(lword[[i]],"총장","")
  lword[[i]]<-str_replace_all(lword[[i]],"압수수색","")
  lword[[i]]<-str_replace_all(lword[[i]],"추미애","")
  lword[[i]]<-str_replace_all(lword[[i]],"추천","")
  lword[[i]]<-str_replace_all(lword[[i]],"정동","정동영")
  lword[[i]]<-str_replace_all(lword[[i]],"이회","이회창")
  lword[[i]]<-str_replace_all(lword[[i]],"들이","")
  
  i<-i+1
}

library(arules)
wordtran <- as(lword, "transactions")
wordtran

wordtable <- crossTable(wordtran)
wordtable

transrules <- apriori(wordtran, parameter = list(support=0.51, conf=0.51))
inspect(transrules)
rules <- labels(transrules, ruleSep=" ")
head(rules,20)
rules <- sapply(rules, strsplit, " ", USE.NAMES = F)
rules
class(rules)
rulemat <- do.call("rbind", rules)
rulemat <- rulemat[20:149,]
rulemat <- rulemat[-c(27,28,41,42,55,56,71,72,81,82,89,90,103,104,111,112,119,120,121,122,123,124),]
class(rulemat)
library(igraph)
relueg <- graph.edgelist(rulemat, directed=F)
relueg
plot.igraph(relueg, )

mergeUserDic(data.frame(c("이명박"), c("ncn"))) # deprecated
buildDictionary(ext_dic = "sejong", user_dic = data.frame(c("이명박"), c("ncn")))










