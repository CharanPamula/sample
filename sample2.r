
for(i in 1:270){
webpage1 <- read_html(webpages[i])

name <- webpage1 %>%
  html_nodes("h1") %>%
  html_text()

summarys <- webpage1 %>%
  html_nodes(".single-post-content-textproject-content-text p") %>%
  html_text()

description <- webpage1 %>%
  html_nodes(".wpb_wrapper p") %>%
  html_text()

description <- stringr::str_c(description,collapse = " ")

p_meta <- webpage1 %>%
  html_nodes(".item-meta-value")  %>%
  html_text()

date_founded <- p_meta[1]
founders <- p_meta[2]
HQ <- p_meta[3]
locations <- p_meta[4]
website <- p_meta[5]
linkedin <- p_meta[6]
twitter <- p_meta[7]
facebook <- p_meta[8]
contact <- p_meta[9]

cdata1 <- cbind(name, description, date_founded, founders, HQ, locations, website, linkedin, twitter, facebook, contact)
cdata <- rbind(cdata, cdata1)
}