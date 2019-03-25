module RedditHelper

  require 'net/http'
  require 'json'

  def fetch_reddit_data

    url = 'https://www.reddit.com/r/popular.json'
    uri = URI(url)
    response = Net::HTTP.get(uri)

    articles = JSON.parse(response)

    puts articles

    content_check(articles)

  end

    def content_check(articles)

      save_to_db(articles)

    end


  def save_to_db(articles)

    for i in 0..articles["data"]["children"].length-1 do

      subreddit = articles["data"]["children"][i]["data"]["subreddit"].titleize
      title = articles["data"]["children"][i]["data"]["title"]
      url = articles["data"]["children"][i]["data"]["url"]
      viewcount = articles["data"]["children"][i]["data"]["ups"]
      thumbnail = articles["data"]["children"][i]["data"]["thumbnail"]
      redditlink = articles["data"]["children"][i]["data"]["permalink"]

      if !Article.exists?(title: title)

          Article.create(
            subreddit: subreddit,
            title: title,
            url: url,
            viewcount: viewcount,
            thumbnail: thumbnail,
            redditlink: redditlink,
            isGif: false
           )

      end
   end

 end

end
