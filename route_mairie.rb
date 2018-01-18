require 'rubygems'
require 'nokogiri'
require 'open-uri'


# return the townhall email adress from its annuaire-des-mairies.com url
def get_the_email_of_a_townhal_from_its_webpage(url_townhall)
  email_townhall = ""
  page_townhall = Nokogiri::HTML(open(url_townhall))

  # get email
  page_townhall.xpath("//p[@class=\"Style22\"]").each do |node|
    node_content = node.text
    if node_content.include? "@"
    
      email_townhall = node_content[1, node_content.size]
    end
  end

  return email_townhall
end

# return tous les URL
def get_all_the_urls_of_val_doise_townhalls(url_department)

  list_info_townhall = []

  page_department = Nokogiri::HTML(open(url_department))

  page_department.xpath("//a[@class=\"lientxt\"]").each do |node|

 #Clean hash for CEO get email corp
    list_info_townhall << { name: node.text, url:  "http://annuaire-des-mairies.com/" + node[:href][1, node[:href].size - 1]}
  end

  return list_info_townhall
end

url_department = "http://annuaire-des-mairies.com/val-d-oise.html"
townhall_list = []

#regroupe les deux methodes ensemble. Gosh ! 
get_all_the_urls_of_val_doise_townhalls(url_department).each do |info_townhall|
  email_townhall = get_the_email_of_a_townhal_from_its_webpage(info_townhall[:url])
  if email_townhall != ""
    townhall_list << { :name => info_townhall[:name], :email=> email_townhall }
  end
end

# La commande qui fait apparaitre la liste d'email
townhall_list.each do |townhall|
  puts townhall[:name].to_s + " (" + townhall[:email].to_s + ")"
end