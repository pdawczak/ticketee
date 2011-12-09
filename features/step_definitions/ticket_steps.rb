Given /^that project has a ticket:$/ do |table|
  table.hashes.each do |attributes|
    @project.tickets.create! attributes
  end
end

Given /^"([^\"]*)" has created a ticked for this project:$/ do |email, table|
  table.hashes.each do |attributes|
    attributes = attributes.merge! :user => User.find_by_email!(email)
    @project.tickets.create! attributes
  end
end

