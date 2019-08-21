require 'httparty'
require 'open-uri'

class DevOpsDaysOutput
  include HTTParty
  base_uri 'https://api.twitter.com'


  def initialize(submission)
    #puts submission['talk_talk_format']
    @submission = submission
    @talk_type = "talk" if submission['talk_talk_format'].include?('Talk')
    @talk_type = "ignite" if submission['talk_talk_format'].include?('Ignite')
    @reformat_name = submission['profile_name'].downcase.tr(" ", "-")
    @file_name = "#{@reformat_name}.md"
    @options = { screen_name: submission['profile_twitter'] }
    output_program
    output_speaker
    #puts submission['profile_twitter']
    #if submission['profile_twitter']
    #  download_twitter_image
    #else
    #  puts "no twitter profile for #{submission['profile_name']}, so did not attempt to download"
    #end
  end

  def output_program
    session_markdown = [
      "+++",
      "Talk_date = \"\"",
      "Talk_start_time = \"\"",
      "Talk_end_time = \"\"",
      "Title = \"#{@submission['talk_title']}\"",
      "Type = \"talk\"",
      "Speakers = [\"#{@reformat_name}\"]",
      "+++",
      "#{@submission['talk_description']}"
    ].join("\n") + "\n"

    File.open("program/#{@file_name}", 'w') do |f|
      f.puts session_markdown
    end
  end

  def output_speaker
    speaker_markdown = [
      "+++",
      "Title = \"#{@submission['profile_name']}\"",
      "Twitter = \"#{@submission['profile_twitter']}\"",
      "Website = \"#{@submission['profile_url']}\"",
      "type = \"speaker\"",
      "linktitle = \"#{@reformat_name}\"",
      "image = \"#{@reformat_name}.jpg\"",
      "+++",
      "#{@submission['profile_bio']}"
      ].join("\n") + "\n"

    File.open("speakers/#{@file_name}", 'w') do |f|
      f.puts speaker_markdown
    end

  end

  def download_twitter_image
    twitter_info = self.class.get('/1.1/users/show.json', @options)
    puts twitter_info
    twitter_image_url = twitter_info['profile_image_url_https']
    puts twitter_info['profile_image_url_https']
    download = open(URI.parse(twitter_image_url))
    # likely should honor the original format jpg/gif/png or whatever
    IO.copy_stream(download, "images/#{@reformat_name}.jpg")
    # if no twitter image, then should likely look to see if website is linked in then try to pull from there
  end


end