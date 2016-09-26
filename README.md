# TODO BDD
So now you've allowed displaying task completion. However, our todo list is still useless if we can't update this field. For this next feature, we'll be making the checkbox/checkmark clickable, so we can toggle its display.

To start off, we'll probably want to set up the database again:
```bash
rake db:migrate
rake db:seed
```

Note: If you are using the same branch as before run `rake db:drop` before, to restart the database.

## Writing New Tests
Create a new file called `features/task_update.feature` and fill out the "Feature" and "Background" sections just like `features/task_display.feature`.

This time, however, our scenarios will be different. Instead of simply displaying the completion, we want to be able to update it. Specifically, we want to be able to click that cute icon that you wrote and toggle it. We should remain on the same page; the only update should be to that task's checkbox/checkmark.

Try to think of some scenarios. What should happen if we click a completed task? What should happen if we click an incomplete task? What should happen if we click an incomplete task, then click it again?

*Note:* There are some new step definitions to help you! See them in `features/step_definitions/todo_steps.rb`.
- `When I click the check[mark/box] next to "[task name]"` clicks any element of type `button` in the same table row as the task specified.
- `Then I should be on [pagename]` checks to see if the current page matches.

## Writing the Features
Now we can begin to write the feature.

To start off, we'll probably need a new route. In `config/routes.rb`, add a PUT route to a method in your Todo controller. This route represents a toggle; it should perform the operation on the model and immediately redirect to the index page. Your route should take in an `:id` parameter that represents the ID of the Todo object.

Next, we have to write the controller logic for the Todo controller method. This method should toggle the `completed` field in the Todo model that is passed in by `:id`. Grab the object, update its `completed` field, and save the object. Finally, use `redirect_to` to go back to the index page.

Lastly, we have to update the view. Specifically, we have to make the checkbox/checkmark element from a static span into a button. The easiest way to do this is to surround the block in a `form_tag` and put the span in `button_tag`. This way we can link the form to our route that we just defined in a PUT request.

If everything seems to work out in `rails s`, run:
```bash
rake cucumber
```
All your defined tests should be green!
