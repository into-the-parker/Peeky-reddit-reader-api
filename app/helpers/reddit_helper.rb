module RedditHelper

  require 'net/http'
  require 'json'

  def fetch_reddit_data

    url = 'https://www.reddit.com/r/popular.json'
    uri = URI(url)
    response = Net::HTTP.get(uri)

    articles = JSON.parse(response)

    content_check(articles)

  end

    def content_check(articles)

      if articles.length < 1
        fetch_reddit_data()
      end

      save_to_db(articles)

    end


  def save_to_db(articles)

    for i in 0..articles.length do
    Article.create(
      subreddit: articles["data"]["children"][i]["data"]["subreddit"],
      title: articles["data"]["children"][i]["data"]["title"],
      url: articles["data"]["children"][i]["data"]["url"],
      viewcount: articles["data"]["children"][i]["data"]["view_count"],
      thumbnail: articles["data"]["children"][i]["data"]["thumbnail"],
      redditlink: articles["data"]["children"][i]["data"]["permalink"]
     )
   end

 end

end
