Given /^the following tasks:$/ do |tasks|
  tasks.hashes.each do |task|
    Todo.create(task)
  end
end

When /^I add description "([^"]*)"$/ do |description|
  steps %{
    When I fill in "todo[description]" with "#{description}"
    And I press "New Task"
    }
end

When /^(?:|I )click the check?(?:.*) next to "([^"]*)"$/ do |task|
  button = page.first('tr', :text => task).first('td button')
  assert(!button.nil?, "No clickable button found next to \"#{task}\"!")
  button.click
end

Given(/^I change description "([^"]*)" for "([^"]*)"$/) do |text, task|
  bip_text(Todo, :descrption, text)
end

When(/^I click the delete button next to "([^"]*)"$/) do |task|
  link = page.first('tr', :text => task).first('td a')
  assert(!link.nil?, "No clickable link found next to \"#{task}\"!")
  link.click
end

Then(/^I should not see task "([^"]*)"$/) do |task|
  within ("html > body") do
    step 'should not see "#{task}"'
  end
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