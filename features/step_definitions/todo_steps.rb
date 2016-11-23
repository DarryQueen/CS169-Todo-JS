Given /^the following tasks:$/ do |tasks|
  tasks.hashes.each do |task|
    Todo.create(task)
  end
end

When /^(?:|I )click the check?(?:.*) next to "([^"]*)"$/ do |task|
  button = page.first('tr', :text => task).first('td button')
  assert(!button.nil?, "No clickable button found next to \"#{task}\"!")
  button.click
end

When(/^I click the edit?(?:.*) next to "([^"]*)"$/) do |task|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I click the delete button next to "([^"]*)"$/) do |task|
  link = page.first('tr', :text => task).first('td a')
  assert(!link.nil?, "No clickable link found next to \"#{task}\"!")
  link.click
end


Then /^(?:|I )should see a check?(.*) next to "([^"]*)"$/ do |check_type, task|
  check_class = nil

  case check_type
  when 'box'
    check_class = 'unchecked'
  when 'mark'
    check_class = 'check'
  else
    check_class = 'check'
  end
  assert(page.body =~ /<tr>.*#{check_class}(?:(?!<\/tr>).)*?#{task}.*?<\/tr>/m, "No check#{check_type} next to \"#{task}\"!")
end

When(/^I add text "([^"]*)"$/) do |text|
  pending # Write code here that turns the phrase above into concrete actions
end