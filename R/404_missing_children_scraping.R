# web scrapping ####
pacman::p_load("rvest","httr","ggmap","dplyr","imager","magick")

url <- "http://www.fmca.kr/menu01/"

html <- read_html(url, encoding="UTF-8")
html %>% html_node(xpath="//*[@id="wrap"]/center/table[2]/tbody/tr/td[3]/print/table[2]/tbody/tr[5]/td/table/tbody/tr[1]/td[1]/table") %>% html_table()

sess <- html_session(url)

imgsrc <- sess %>%
  read_html() %>%
  html_node(".result_missing")


# image read ####

image_read("https://avatars1.githubusercontent.com/u/28377612?s=460&v=4") %>% image_scale("x100")



# map ####

seoul <- enc2utf8("서울") %>%
  geocode() %>%
  as.numeric() %>%
  get_googlemap(maptype="roadmap",zoom=12) %>%
  ggmap()
