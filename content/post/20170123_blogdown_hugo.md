---
title: "Getting Going with Blogdown & Hugo"
author: "Mike Treglia"
date: 2018-01-23
categories: ["Web Development"]
tags: ["blogdown", "web dev", "R Markdown", "R", "Rmd"]
---

## Why Blogdown?

As I've [noted before](../time-for-webpage-update/), my previous website was pretty basic. While it was largely simple to make updates, it wasn't particularly elegant. It was functional, and definitely looked reasonable when it was first created. Editing it wasn't too difficult, but took some forethought if I wanted to make updates across the website. I'm not at all trained in web development, and just I picked up a few things by working off a template a friend created for me, and toying around with some .js code in leaflet maps (and lots of googling of course); thus, I might have missed some things that would have made my life a lot easier, but here I am.

In the middle/end of grad school I picked up a suite of tools which I now use regularly - namely [R](https://cran.r-project.org/), [Git](https://git-scm.com/) (and [Github](https://github.com/)), and [markdown](https://en.wikipedia.org/wiki/Markdown), among others. The R package, [Blogdown](https://blog.rstudio.com/2017/09/11/announcing-blogdown/), which was only developed in recent years, facilitates using R/R markdown/Markdown to make a better-looking website that is easier to update. Blogdown relies on [Hugo](https://gohugo.io/), a static page generator that can compile markdown files with templates into full webpages.

This post is intended to summarize some aspects of Blogdown, Hugo, and getting it all set up with GitHub Pages as I figured it out, as well as highlight some things I learned.

## Getting Started with Blogdown

Thankfully, I'm far from the first person who's used Blogdown to get a website going, and there's even a [free e-book](https://bookdown.org/yihui/blogdown/) by [Yihui Xie](https://yihui.name), [Amber Thomas](https://amber.rbind.io), and [Alison Presmanes Hill](https://alison.rbind.io) on the topic. There are also numerous blogs, including [this one](https://tclavelle.github.io/blog/blogdown_github/) I've found useful. If you're just getting started, definitely go through the first  chapters of the e-book and try to get something going on your local machine before getting your site online.

### Choosing a Hugo Theme and Making some Minor Changes

An important step in setting up your site that will be generated via Hugo is choosing a Theme - i.e., a template that you'll adjust and feed your content into for rendering. You can think through what your needs are, and filter by different characteristics. For example, I wanted my site to be responsive, so I only looked at [themes that were tagged as such](https://themes.gohugo.io/tags/responsive/). Then, I browsed through some of the demos, and saw what elements they had. Having clear links to social media pages and such seemed useful, as well as having a way to create a fairly straightforward blog. As indicated on the left panel of this page, I went with the [Blackburn theme](https://themes.gohugo.io/blackburn/) developed by [Yoshiharu Yamashita](http://yoshiharuyamashita.com/). It was aesthetically pleasing, had fairly recent commits in the GitHub repo (indicating it is still maintained), and seemed fairly customizable.

I started by following the workflow suggested in the aforementioned e-book, adjusting configuration settings (in the configuration file, *config.toml*) that comes with the template to make sure I could adjust some things I wanted, and went from there. In particular, below is my initial code, run in [RStudio](https://www.rstudio.com/).

```
# Install packages and dependencies
install.packages("blogdown")
blogdown::install_hugo()
install.packages("later")

# Set up web project
blogdown::new_site(dir = "blackburnFiles", #New Directory within working directory where web content will be stored
                   theme = 'yoshiharuyamashita/blackburn', #theme information
                   format = 'toml') #specify toml instead of yaml
				   
#To build and view default page
setwd("blackburnFiles")
blogdown::build_site()
blogdown::serve_site()
```

There were a few particular things that I wanted to adjust in the config file - some were pretty self-explanatory and others were a matter of trial and error. Particular things I edited in the config.toml file (which can easily be done within RStudio or any text editor) are noted below, followed by the original config file with notes included after hashtags [Note: Some comments were already included]. Also, I'll add that some of these edits might be very specific to the Blackburn theme, but I honestly haven't done enough exploration at this point to verify. (Any quick insights are welcome.) The LiveReload functionality was handy, as every time I'd save an edit to the config.toml file, I'd see the result pretty much immediately. More details on configuration files are [here](https://bookdown.org/yihui/blogdown/configuration.html); I didn't make a ton of adjustments, mostly focusing on making it work for my immediate purposes.

1. Brand (Blackburn -> MikeTreglia)

2. baseurl ("https://www.example.com/" -> "https://mltconsecol.github.io/")

3. High level page listing.

	* I wasn't sure where the icons next to the label came from, but from googling the code snippet preceding the name of the pages in the config file, found these were [Font Awesome](http://fontawesome.io/) icons You can find a whole bunch of alternatives to use as you see appropriate.
		
		* *Because Font Awesome is pulling from a remote source, if you're testing without  internet the icons will be lacking. (There are other elements in the theme that seem to rely on remote info, such as the font, so if you're testing without internet access, don't freak out about strange appearances yet.)*
		
4. Updated info for Social Media links/remove irrelevant ones. You can conveniently comment out irrelevant ones by simply prefacing them with a #.
5. I also updated a few other things, mostly pretty self-explanatory so I won't go into further detail at this point.

```
baseurl = "https://www.example.com/" #updated this appropriately for my own page
languageCode = "en-us"
title = "Blackburn Theme Demo" #Changed to the title for my site (my name))
theme = "blackburn"
author = "Yoshiharu Yamashita" #Adjusted appropriately
copyright = "&copy; 2016. All rights reserved." #Changed to 2018
canonifyurls = true
paginate = 10

#This was added as per suggestion/warning in R upon build:
ignoreFiles = ["\\.Rmd$", "\\.Rmarkdown$", "_files$", "_cache$"] 


[indexes]
  tag = "tags"
  topic = "topics"

[params]
  # Shown in the home page
  subtitle = "A Hugo Theme" #Updated as appropriate for my own descriptors
  brand = "Blackburn" #Brand corresponds to the 'MikeTreglia' in the upper-left of the side-bar
  googleAnalytics = "Your Google Analytics tracking ID" #Fill this in as desired
  disqus = "Your Disqus shortname"
  # CSS name for highlight.js
  highlightjs = "androidstudio"
  dateFormat = "02 Jan 2006, 15:04" #This drives how date/time will be displayed with blog posts. I eliminated the time from mine.

#You can add/remove elements in the side menu here; weight adjusts the ordering.
[menu]
  # Shown in the side menu.
  [[menu.main]]
    name = "Home"
    pre = "<i class='fa fa-home fa-fw'></i>"
    weight = 1
    identifier = "home"
    url = "/"
  [[menu.main]]
    name = "Posts"
    pre = "<i class='fa fa-list fa-fw'></i>"
    weight = 2
    identifier = "post"
    url = "/post/"
  [[menu.main]]
    name = "About"
    pre = "<i class='fa fa-user fa-fw'></i>"
    weight = 3
    identifier = "about"
    url = "/about/"
  [[menu.main]]
    name = "Contact"
    pre = "<i class='fa fa-phone fa-fw'></i>"
    weight = 4
    url = "/contact/"
#I added a few more as you'll see here.

[social]
  # Link your social networking accouns to the side menu
  # by entering your username or ID.
  twitter = "*"
  facebook = "*"
  instagram = "*"
  github = "yoshiharuyamashita"
  stackoverflow = "*"
  linkedin = "*"
```

There are still one or two things I would consider editing, which might not have been as obvious to do and simply weren't a high priority. For example, it would be great to add, with the social media links, a link to my Google Scholar profile (likely of interest for lots of academics).

### Editing Pages

You'll see that in the config file that comes with the Blackburn template, the high level page listing in the side menu directs to specific folders (e.g., "/About/" for the *About* page). However, at least when starting everything from blogdown, there is a folder within 'content' called 'post', where blog posts are saved (as Markdown/R Markdown files, to be compiled on website build), but then there are simply 'about.md' and 'contact.md' files. For my own organization, I decided to set up folders for each main page, such that I could keep my content organized with any related files. Thus, in my 'content' folder, I have folders for each relevant page, with an index.md file, and all associated files, such as images. When the site is built, all content gets organized appropriately in the 'public' folder.

From RStudio, there are add-ins you can use to make life a bit easier in creating new blog posts and such. These are detailed [here](https://bookdown.org/yihui/blogdown/rstudio-ide.html). I'll note that at this point, I'm just starting with new text files, filling in an appropriate yaml header (based on the template md/Rmd files) and going from there, though we'll see how/if I adjust in the future. I definitely recommend checking out the [relevant section of the Blogdown book on R Markdown vs Markdown](https://bookdown.org/yihui/blogdown/output-format.html) to better think through when you might use each in this context. And if you're not familiar with either, definitely do some googling.


### Hosting on Github

There are multiple ways to host a site created via blogdown, detailed in the [deployment](https://bookdown.org/yihui/blogdown/deployment.html) section of the e-book. Since I already had experience with [GitHub Pages](https://pages.github.com/) and had a site there already, it made sense for me to stick with it, realizing it might not be the easiest way to host blogdown/hugo pages, and figuring I'll learn a thing or two.

If you're new to github pages, you'll need to set up a repository titled [username].github.io, add your content, and initialize the page through settings for your repo. (Lots of online resources are out there for getting started.)

GitHub Pages is set up to work with another static site generator, Jekyll, but can work with Hugo-driven pages without too much trouble (or plain old html files). I give an overview of how I did things in the steps below - this is what made sense to and worked, though definitely check out the [relevant section of the blogdown e-book for more](https://bookdown.org/yihui/blogdown/github-pages.html), as well as a [hugo page about hosting on GitHub Pages](https://gohugo.io/hosting-and-deployment/hosting-on-github/)

1. Set up a [repository for all of my web files, "WebsiteFiles"](https://github.com/mltConsEcol/WebsiteFiles). Basically I created the repo via the GitHub website, cloned it to my local machine. I had already been testing things locally, so just copied the files created from blogdown::newsite() with the edits I made, and after using ```blogdown::build_site()```.
2. I copied the contents of the 'public' folder to the repository associated with GitHub Pages(mltconsecol.github.io), and deleted the contents from the 'public' folder in the 'WebsiteFiles' folder/repository (but leave the actual folder - just leave it empty). In the GitHub Pages repo, simply put these files in the highest level (i.e., **do not put them in a folder within the repo called 'public'**).
	1. I also added a blank file called .nojekyll to the 'public' folder (now in the GitHub Pages repo), which can help avoid problems of GitHub pages trying to rebuild a page via Jekyll (which won't work, resulting in an error).
3. After pushing all of the content you just moved to your GitHub Pages repo, you can copy this content back into the WebsiteFiles/public as a git submodule. This was entirely new to me, but basically allows you to maintain a Git-tracked directory within another one. The basic git command for this is ```git submodule add -b master git@github.com:[username]/[username].github.io.git public```.
	1. In my case, this required setting up an ssh key, which I had never done before with Git. (It also reminded me to set up two-factor authentication for GitHub - important and easy for added security.) The error I received included "```Error: Permission denied (publickey)```." Thankfully there are [great docs on how to deal with this](https://help.github.com/articles/error-permission-denied-publickey/).
4. As you edit your content and rebuild the site, you can commit and push your changes to your high-level folder/repository (WebsiteFiles, in my case), as well as the *public* folder, needed for the changes to take shape on your actual website.


### Other notes
There are a few other notes worth raising before wrapping up. 

* It's important that users realize the themes are often times being updated through time. How should I, as somebody with a website keep up with such changes? A quick post to the [twitter-verse](https://twitter.com/pjs_228/status/950095675961864194) indicated to set up the theme using a git submodule framework. A quick google around this yields some useful results, such as [this post](http://choomnuan.com/blog/2015/07/18/how-to-setup-hugos-theme-using-git-submodule/), among others. At this point I haven't done this - but might be good practice for the future, or might add it's own complexities.

* If you keep your files in Dropbox folders or similar and sync across multiple computers, make sure you don't mess up your syncing! Ideally, make sure your computers are synced before making changes. This caused me some issues at some point, and I had to restore an earlier version of my work after wondering why nothing was rendering right. Because there can be a bunch of files that get re-created upon each build, it might take a minute or two for syncing to complete, depending on your content, connection, etc.

* For testing purposes, I tried to simply set up the new website as a new page-enabled github repo on the same account my website is hosted from. I ended up running into some issues, in which I had problems with links to internal pages breaking, or strangely the sidebar not popping up on mobile/narrow screens. (I messed around with options to adjust the 'baseurl' as seemingly appropriate and such, but never got everything working.) Thus, I ended up testing a bit more completely by running the website from another GitHub account, and didn't actually fix the issues I was facing in running as another GitHub project. At this point I'm just saving that for another time, when an actual need comes up. I was more worried about getting this site to be functional and live, and apparently I've gotten there.

* At this point I've decided to add a [Disqus](https://disqus.com/) comments section. Googling around about disqus and hugo, it seems a lot of folks aren't the biggest fans (see [here](https://discourse.gohugo.io/t/alternative-to-disqus-needed-more-than-ever/5516)). That said, as I've noted before, I'm interested in getting this site up and running functionally, and especially for posts like this I see functionality in having a comment section. Thus, I've added disqus-based comments here, realizing I can always disable it if I need. And I conveniently just stumbled upon [this useful blog post](https://portfolio.peter-baumgartner.net/2017/09/10/how-to-install-disqus-on-hugo/).