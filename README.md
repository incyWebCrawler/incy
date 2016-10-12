incyWebCrawler
---
A basic web crawler / scraper that can be used to map a site.

Installation
---
- Clone this repo
- ```bundle install```
- ```rake db:create db:migrate```
- ```rails s```

Usage
---
- Visit ```localhost:3000/pages/new``` to get started
- Type in a URL, for example ```http://www.makersacademy.com```
  - Be sure to include ```http://``` and remove any trailing ```/```
- Set the number of pages to crawl
- Search!

Notes about functionality
---
In order to keep our crawling and scraping under control, we decided to set some restrictions.

1. Only able to search single domains
2. Only able to search x number of pages within the domain (this is the links limit)
3. Only able to scrape links that are part of the domain - i.e. any external links will not be scraped.

Heroku link
---
This project has been deployed to Heroku, and can be accessed [here](https://incy-wincy.herokuapp.com/).
