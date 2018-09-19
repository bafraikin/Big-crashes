# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'net/http'
require 'pry'
require 'json'

url = File.open("URL", "r")
$type = [
  ["Collision contre obstacle", "Collision+contre+obstacle"],
  ["Collision entre train ou elements de trains", "Collision+entre+trains+ou+%C3%A9l%C3%A9ments+de+trains"],
  ["Collision contre obstacle à un passage à niveau","Collision+contre+obstacle+%C3%A0+un+passage+%C3%A0+niveau"],
  ["Collision avec enfoncement de heurtoir", "Collision+avec+enfoncement+de+heurtoir"],
  ["Collision", "Collision"],
  ["Collision par prise en echarpe", "Collision+par+prise+en+%C3%A9charpe", "Lorsque un train est percuté sur le flanc"],
  ["Collision contre un obstacle à un passage à niveau", "Collision+contre+un+obstacle+%C3%A0+un+passage+%C3%A0+niveau"],
  ["Reception intempestive à un passage à niveau", "R%C3%A9ception+intempestive+sur+voie+occup%C3%A9e", "Lorsqu'un train arrive en gare et est aiguillé sur une voie déjà occupé"],
  ["Derive", "D%C3%A9rive", "Lorsqu'un element du train n'est pas attaché et dérive"],
  ["Deraillement sans engagement de la voie principale","D%C3%A9raillement+sans+engagement+de+la+voie+principale"],
  ["Franchissement de signal", "Franchissement+de+signal", "Le train depasse une limite où il auait du s'arreter"],
  ["Accident de travail", "Accident+du+travail", "Peut concerner ou non un train"],
  ["Acte de malveillance", "Acte+de+malveillance"],
  ["Deraillement", "D%C3%A9raillement"],
  ["Acostage brutal","Accostage+brutal"],
  ["Collision contre obstacle et deraillement", "Collision+contre+obstacle+et+deraillement"],
  ["Derive et collision","D%C3%A9rive+et+collision", "Voir Derive"],
  ["Desordre d'ouvrage en terre","D%C3%A9sordre+d%E2%80%99ouvrage+en+terre", "Roche sur la voie"],
  ["Engagement de gabarit avec collision", "Engagement+de+gabarit+avec+collision", "Un element accroché au train depasse et heurte autre chose"],
  ["Erreur d'initeraire","Erreur+d%E2%80%99itin%C3%A9raire"],
  ["Erreur grave de procedure","Erreur+grave+de+proc%C3%A9dure"],
  ["Incident grave","Incident+grave"],
  ["Nez à nez","Nez+%C3%A0+nez", "Deux train se retrouve nez à nez"],
  ["Non conformité du materiel roulant", "Non+conformit%C3%A9+du+mat%C3%A9riel+roulant"]
]

base = "https://data.sncf.com/api/records/1.0/search//?dataset=incidents-securite&sort=date&q=collision&refine.type="


def hebdomadaire
  url.each_with_index do | hebdo, index |
    unless index == 0
      Hebdo.create(url: hebdo.split("!")[1].chomp, name: hebdo.split("!")[0])
    end
  end
end

def add_types
  $type.each do |typ|
    Type.create(name: typ[0], url: typ[1], description: typ[2])
  rescue
    puts "#{typ[0]} been rescued" && next
  end
end

def fill_types
res1 = Net::HTTP.get_response(try)

response = ""
if res1.is_a?(NET::HTTPSuccess)
  response = JSON.parse(res.body)
  if response["nhits"] > 10

  end
end
end

add_types
