describe 'angularjs homepage todo list', ->
  it 'should add a todo', ->
    browser.get 'http://www.angularjs.org'

    element `by`.model 'todoText'
      .sendKeys 'write a protractor test'
    element `by`.css '[value="add"]'
      .click()

    todoList = element.all `by`.repeater 'todo in todos'
    expect todoList.count()
      .toEqual(3);
    expect todoList.get(2).getText()
      .toEqual 'write a protractor test'
    return

  return
