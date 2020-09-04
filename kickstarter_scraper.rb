# require libraries/modules here
require 'nokogiri'
require 'pry'
def create_project_hash
  # write your code here
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  projects = {}

  #iterate through the projects
  kickstarter.css("li.project.grid_4").each {|project| title = project.css("h2.bbcard_name strong a").text
    projects[title.to_sym] = {
      :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
      :description => project.css("p.bbcard_blurb").text,
      :location => project.css("ul.project-meta span.location-name").text,
      :percent_funded => project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
    }

  }
  #returns the projects hash
  projects
#binding.pry
end

create_project_hash
#getting the file
# projects: kickstarter.css("li.project.grid_4")

#setting the file to a variable
# title: project.css("h2.bbcard_name strong a").text

#pulling the image link
# image link: project.css("div.project-thumbnail a img").attribute("src").value

#grabs the description on the image or project?
# description: project.css("p.bbcard_blurb").text

#grabs the location of the file that is being recieved
# location: project.css("ul.project-meta span.location-name").text

#converts the percentage takes out all the extra other than the numbers because it is not converted to an integer
# percent_funded: project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i