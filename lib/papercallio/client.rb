
require 'httparty'
class PaperCallClient
  include HTTParty
  base_uri 'www.papercall.io'

  def initialize(api_token, query_options)
    @query = { 
      # page: page,
      # TODO: for first iteration, just going to hardcode to 9999
      per_page: 9999
    }
    @query[:state] = query_options[:state] if query_options[:state]
    @query[:keywords] = query_options[:keywords] if query_options[:keywords]
    @query[:needs_rating] = query_options[:needs_rating] if query_options[:needs_rating]
    @query[:order] = query_options[:order] if query_options[:order]
    @options = { query: @query, headers: { 'Authorization' => api_token } }
  end

  def event
    self.class.get("/api/v1/event", @options)
  end

  def submissions
    self.class.get("/api/v1/submissions", @options)
  end

  def submission(id)
    self.class.get("/api/v1/submissions/#{id}", @options)
  end

  def rating(id)
    self.class.get("/api/v1/submissions/#{id}/ratings", @options)
  end

  def feedback(id)
    self.class.get("/api/v1/submissions/#{id}/feedback", @options)
  end
end