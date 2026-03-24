require 'nokogiri'
require 'open-uri'

# Méthode 1 : Récupère l'email sur la page d'une ville précise
def get_townhall_email(townhall_url)
  page = Nokogiri::HTML(URI.open(townhall_url))
  
  # On cherche le texte qui contient un "@" dans le tableau de la page
  # Souvent, l'email est dans le 4ème <td> de la table
  email = page.xpath('//section[2]//dd[4]').text
  
  return email.empty? ? "Email non trouvé" : email
end

# Méthode 2 : Récupère tous les liens des mairies du Val d'Oise
def get_townhall_urls
  root_url = "http://annuaire-des-mairies.com/val-d-oise.html"
  page = Nokogiri::HTML(URI.open(root_url))
  
  urls = []
  
  # On récupère tous les liens qui ont la classe 'lientxt'
  links = page.css('a.lientxt')
  
  links.each do |link|
    # On reconstruit l'URL complète
    # Les liens sont du type "./95/avernes.html", on remplace le "." par l'adresse du site
    url = "http://annuaire-des-mairies.com" + link['href'].delete_prefix('.')
    urls << url
  end
  
  return urls
end

def mairie_christmas
  final_data = []
  urls = get_townhall_urls
  
  puts "Scrapping en cours... Cela peut prendre une minute."
  
  urls.each do |url|
    # On récupère le nom de la ville depuis l'URL (ex: avernes.html -> AVERNES)
    town_name = url.split('/').last.sub('.html', '').capitalize
    
    email = get_townhall_email(url)
    
    final_data << { town_name => email }
    print "." # Petit indicateur de progression
  end
  
  puts "\nTerminé !"
  return final_data
end