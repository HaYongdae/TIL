# stringr

## 1. install / importing

```R
install.packages("stringr")
library(stringr)
```

## 2. 사용 예시

```R
x <- c("why", "video", "cross", "extra", "deal", "authority")

# 길이 반환
str_length(x) 
#> [1] 3 5 5 5 4 9

# collapse로 구분해 문자 하나를 만듦
str_c(x, collapse = ", ")
#> [1] "why, video, cross, extra, deal, authority"

# (데이터, 시작indes, 끝index)
str_sub(x, 1, 2)
#> [1] "wh" "vi" "cr" "ex" "de" "au"

# 패턴에 해당하는 문자열이 있는 것만 반환
str_subset(x, "[aeiou]")
#> [1] "video"     "cross"     "extra"     "deal"      "authority"

# 패턴에 해당하는 횟수 반환
str_count(x, "[aeiou]")
#> [1] 0 3 1 2 2 4

# 패턴 해당 여부 T/F로 반환
str_detect(x, "[aeiou]")
#> [1] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE

# 패턴 해당 여부 단어별로 (처음 해당 index), (끝 해당 index) 반환
str_locate(x, "[aeiou]")
#>      start end
#> [1,]    NA  NA
#> [2,]     2   2
#> [3,]     3   3
#> [4,]     1   1
#> [5,]     2   2
#> [6,]     1   1

# 패턴 해당하는 대상 글자 반환
str_extract(x, "[aeiou]")
#> [1] NA  "i" "o" "e" "e" "a"

# 패턴 해당하는 대상 반환
str_match(x, "(.)[aeiou](.)")
#>      [,1]  [,2] [,3]
#> [1,] NA    NA   NA  
#> [2,] "vid" "v"  "d" 
#> [3,] "ros" "r"  "s" 
#> [4,] NA    NA   NA  
#> [5,] "dea" "d"  "a" 
#> [6,] "aut" "a"  "t"

# 패턴 해당 대상을 "지정된 문자"로 변경
str_replace(x, "[aeiou]", "?")
#> [1] "why"       "v?deo"     "cr?ss"     "?xtra"     "d?al"      "?uthority"

# 구분자로 구분
str_split(c("a,b", "c,d,e"), ",")
#> [[1]]
#> [1] "a" "b"
#> 
#> [[2]]
#> [1] "c" "d" "e"
```





