#Basically, you set up a folder with everything as such. Only git init the section in "website folder" -> "public"
#Before putting into mltconsecol.github.io, make sure desired files are in public? Or at least think through how that'll work

#Useful links: https://tclavelle.github.io/blog/blogdown_github/; https://bookdown.org/yihui/blogdown/a-quick-example.html 
#Check out the blackburn theme https://themes.gohugo.io/blackburn/

install.packages("blogdown")
blogdown::install_hugo()
install.packages("later")


blogdown::new_site()
setwd("~/Dropbox/Blogdown_Exploration1/")
getwd()
#blogdown::new_site(dir = "Blogdown_site_files")
getwd()
setwd("Blogdown_site_files/")

blogdown::build_site()
file.edit(".Rprofile")
blogdown::serve_site()

yoshiharuyamashita/blackburn

#blogdown::new_site(dir = "BlackburnExperiment_1", 
#                   theme = 'yoshiharuyamashita/blackburn',
#                   format = 'toml')
setwd("BlackburnExperiment_1/")
blogdown::build_site()
blogdown::serve_site()
