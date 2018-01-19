require 'rubygems'
require 'nokogiri'   
require 'open-uri' 


#<====== Recupere L'adresse mail sur la page annuaire-des-mairies.com/95/vaureal.html ===>


#======== Va chercher les liens dans la balise ========

def get_all_the_urls_of_val_doise_townhalls


  page1 = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))  #ouvre la page ciblée
  $get_llinks = page1.css('a[href*="95"]').map{|link| link["href"]} #definie un array "get_llinks" cible la balise avec href 95 et prend toutes les fin d'url


end




#-------Recupere l'adresse email à Partir d'un tableau -------

def get_the_email_of_a_townhal_from_its_webpage(get_llinks)
  get_llinks.each {|get_llinks|
  
  get_llinks[0]="" # on enelve le "." mais optionnel je pense ?


  page2 = Nokogiri::HTML(open("http://www.annuaire-des-mairies.com"+get_llinks)) 
 

  puts link = page2.css('p:contains("@")').text} #mail
end


get_the_email_of_a_townhal_from_its_webpage(get_all_the_urls_of_val_doise_townhalls) #deux méthodes encastrées basé sur la variable generale $get_links 



#======== NOTE (je garde le code ci dessous en mémoire)==>> Ci dessous un premier code qui ne marche pas (très bien) la faute étant d'utiliser page1.xpath au lieu de page1.css =======>

=begin

require 'rubygems'
require 'nokogiri'  
require 'open-uri'
require 'pry'

 
#<====== Recupere L'adresse mail sur la page annuaire-des-mairies.com/95/vaureal.html ===>


#======== Va chercher les liens dans la balise avec la classe (class=lientxt) et imprime tout les liens dans la console ========

def get_all_the_urls_of_val_doise_townhalls

page1 = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))   #ouvre la page ciblée

$get_llinks = page1.xpath("//p/a[@class='lientxt']").map { |link| link['href'] }   #definie une fonctione "get_llinks" cible la balise (avec Xpath) ensuite definie une fonction "link" et applique ['href'] pour chaque de module du hash de la fonction Link

puts page1

end



#-------Recupere l'adresse email à Partir d'un tableau -------

def get_the_email_of_a_townhal_from_its_webpage(get_llinks)
  get_llinks.each {|get_llinks|}
  get_llinks[0]=""

  
page2 = Nokogiri::HTML(open("http://www.annuaire-des-mairies.com"+$get_llinks))
get_email = page2.xpath("//td[@class='style27']/p[@class='Style22']")[5].text  #cherche dans les sous-sections td avec la class=style27 et selectione le 5eme/texte


puts get_llinks
end

get_the_email_of_a_townhal_from_its_webpage(get_all_the_urls_of_val_doise_townhalls)


#puts get_the_email_of_a_townhal_from_its_webpage









#"http://annuaire-des-mairies.com/95/vaureal.html"













def scrap

  destination = "http://annuaire-des-mairies.com/" + get_all_the_urls_of_val_doise_townhalls
  
  go_to_destination = Nokogiri::HTML(open(destination))
  go_to_destination.each do |go|

  
  end

end


puts scrap

=end



