Then /^I should see the "([^\"]*)" link$/ do |text|
  page.should(have_css("a", :test => text), "Expected to see the #{text.inspect} link, but did not.")
end

Then /^I should not see the "([^\"]*)" link$/ do |text|
  page.should_not(have_no_css("a", :test => text), "Expected not to see the #{text.inspect} link, but did.")
end
