require 'open-uri'
class PagesController < ApplicationController
  def home
   
   if Time.now.min % 2 == 0
    @links= Hash.new
            @title= Hash.new
            
            doc = Nokogiri::HTML(open("http://reddit.com"))
             i=0
              doc.xpath("//div[@class='entry unvoted']/p[@class='title']/a[@class='title ']").each do |node|
                #puts node.text
                @title[i]=node.text
                #puts links[i]
                i=i+1
              end
              
            i=0
            doc.xpath("//div[@class='entry unvoted']/p[@class='title']/a[@class='title ']/@href").each do |node|
              #puts node.text
              @links[i]=node.text
              #puts links[i]
              i=i+1
            end
    end   
    
    @days=[1,2]
  
    
  end

end
