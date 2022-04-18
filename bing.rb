require 'sinatra'
require 'http'
require 'nokogiri'

get '/' do
  response = HTTP.timeout(2).get("https://www.bing.com/HPImageArchive.aspx?idx=0&n=1&mkt=en-US")
  xml_doc  = Nokogiri::XML(response.body)

  img_url = xml_doc.css('urlBase').text
  domain = 'https://www.bing.com'
  suffix = '_UHD.jpg'

  return domain + img_url + suffix
  #puts(domain + img_url + suffix)
end