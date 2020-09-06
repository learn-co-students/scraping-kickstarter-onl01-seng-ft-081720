require 'nokogiri'
require "pry"

def create_project_hash

  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  
  projects = {}

  kickstarter.css("li.project.grid_4").each do |project|
    title = project.css("h2.bbcard_name strong a").text
    projects[title.to_sym] = {
      :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
      :description => project.css("p.bbcard_blurb").text,
      :location => project.css("ul.project-meta span.location-name").text,
      :percent_funded => project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
    }
  end

  projects

end

create_project_hash


# projects: kickstarter.css("li.project.grid_4") "Moby Dick: An Oratorio"
# title: project.css("h2.bbcard_name strong a").text
# image link: project.css("div.project-thumbnail a img").attribute("src").value"https://s3.amazonaws.com/ksr/projects/845788/photo-little.jpg?1391022013"
# description: project.css("p.bbcard_blurb").text "\nFour young composers join forces with an indie orchestra to present this musical reflection on a literary masterpiece.\n"
#project.css("ul.project-stats li.first.funded strong").text
