library(rvest)

google_st <- "GOOGL"

google_page <- html_session("https://uk.finance.yahoo.com/q?s=" + google_st + "&ql=0")

headlines <- google_page %>%
  html_nodes("#yfi_headlines a") %>%
  html_attr("href")
  

tabel <- data.frame(headlines)

#go through my yahoo portfolio and get headlines
portfolio <- html_session("https://uk.finance.yahoo.com/portfolio/pf_1/view/v1")


