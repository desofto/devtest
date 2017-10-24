# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


## The application should have:
# 3 Panel Providers
panel_provider1 = PanelProvider.create!(code: 'Provider1')
panel_provider2 = PanelProvider.create!(code: 'Provider2')
panel_provider3 = PanelProvider.create!(code: 'Provider3')

# 3 Countries, each with different panel provider
country1 = Country.create!(country_code: 'pl', panel_provider: panel_provider1)
country2 = Country.create!(country_code: 'en', panel_provider: panel_provider2)
country3 = Country.create!(country_code: 'nl', panel_provider: panel_provider3)

# 20 Locations of any type (city, region, state, etc.)
20.times do |n|
  Location.create!(name: "location_#{n}", external_id: n, secret_code: n)
end

# 4 Location Groups, 3 of them with different provider and 1 would belong to any of them
LocationGroup.create!(name: 'Group1', country: country1, panel_provider: country1.panel_provider)
LocationGroup.create!(name: 'Group2', country: country2, panel_provider: country2.panel_provider)
LocationGroup.create!(name: 'Group3', country: country3, panel_provider: country3.panel_provider)
LocationGroup.create!(name: 'Group4', country: country2, panel_provider: country2.panel_provider)

# 4 root Target Groups and each root should start a tree which is minimium 3 levels deep (3 of them with different provider and 1 would belong to any of them)
build_tree = lambda do |root, name, level, panel_provider|
  return if level >= (3..10).to_a.sample

  group = TargetGroup.create!(
    name: name,
    external_id: 0,
    parent: root,
    secret_code: 0,
    panel_provider: panel_provider
  )

  if group.parent.blank?
    country = [country1, country2, country3].sample
    group.countries = [country]
  end

  puts "#{TargetGroup.count} : #{name} : #{level}"

  children_count = (1..5).to_a.sample

  (1..children_count).each do |n|
    panel_provider = [panel_provider1, panel_provider2, panel_provider3].sample
    build_tree.call(group, "#{name}-#{n}", level + 1, panel_provider)
  end

  group
end

root1 = build_tree.call(nil, '1', 0, panel_provider1)
root2 = build_tree.call(nil, '2', 0, panel_provider2)
root3 = build_tree.call(nil, '3', 0, panel_provider3)
root4 = build_tree.call(nil, '4', 0, panel_provider1)
