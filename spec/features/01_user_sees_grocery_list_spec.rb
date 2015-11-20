require "spec_helper"

feature "user sees a list of favorite things" do
  scenario "user views favorites" do
    CSV.open("favorites_list.csv", "a", headers: true) do |file|
      thing = "Ruby"
      file.puts([thing])
    end

    visit "/favorites-list"
    expect(page).to have_content("Ruby")
  end

  scenario "user sees all favorites at root path" do
    CSV.open("favorites_list.csv", "a", headers: true) do |file|
      thing = "Psyduck"
      file.puts([thing])
    end
    visit "/"
    expect(page).to have_content("Psyduck")
  end
end
