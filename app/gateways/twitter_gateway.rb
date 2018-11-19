class TwitterGateway
  def search(query, options = {})
    client.search(query, options)
  rescue Twitter::Error::Unauthorized => e
    Rails.logger.error("Twitter API Unauthorized Error: #{e.inspect}")
    raise e
  end

  private

  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET_KEY']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end
  end
end
