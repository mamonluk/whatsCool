require 'open-uri'
require 'nokogiri'
 
 
links= Hash.new
title= Hash.new
i=0
doc = Nokogiri::HTML(open("http://reddit.com"))
doc.xpath("//div[@class='entry unvoted']/p[@class='title']/a[@class='title ']/@href").each do |node|
  #puts node.text
  links[i]=node.text
  #puts links[i]
  i=i+1
end

i=0
doc.xpath("//div[@class='entry unvoted']/p[@class='title']/a[@class='title ']").each do |node|
  #puts node.text
  title[i]=node.text
  #puts links[i]
  i=i+1
end


#puts title.size
p=0
#title.size.times	 do 
 # puts "#{p} - #{title[p]}"
#  puts links[p]
#  puts "\n"
#  p=p+1
#end


p=10

builder = Nokogiri::HTML::Builder.new do |doc|
    doc.html {
      doc.body(:onload => 'some_func();') {
       
        (title.size-10).times	 do 
           if links[p] =~ /http:/
              doc.a('href'=> "#{links[p]}"){ doc.text "#{title[p]}" }
           else
              doc.a('href' => "http://www.reddit.com#{links[p]}"){doc.text "#{title[p]}" }
           end
         doc.br
         p=p+1
        end
        
        doc.span.bold {
          doc.text "Hesfsdfssllo worlddddd"
        }
      }
    }
  end
 # puts builder.to_html
  File.open("public/index.html", 'w') {|f| f.write(builder.to_html) }


