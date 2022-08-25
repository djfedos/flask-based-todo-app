describe('root page', () => {
  it('todo_app_is_up', () => {
    cy.visit('http://flask-todo:5000')

    cy.get('a').should('contain', 'Login')

    cy.get('a').click()

    cy.get('h1').should('contain', 'Stay Organized!')
  })
})

describe('login, add, edit task', () => {
  it('function test', () => {
    cy.visit('http://flask-todo:5000/register')
    cy.get('input#first_name').type('Tester')
    cy.get('input#last_name').type('Tester')
    cy.get('input#email').type('test@test.test')
    cy.get('input#password').type('t4e2s3t0')
    cy.get('input#submit').click()
    

    cy.visit('http://flask-todo:5000/login')

    cy.get('#email').type('test@test.test')
    cy.get('#password').type('t4e2s3t0')
    cy.get('#submit').click()
    
    cy.get('button.add_button').should('contain', 'Add New Task').click()
    cy.get('#task_name').type('Test task')
    cy.get('#due_date').type('2022-12-12')
    cy.get('select').select('Not Started')
    cy.get('#submit').click()

    cy.visit('http://flask-todo:5000/edit_task/1')
    cy.get('#task_name').clear().type('Edited task')
    cy.get('#due_date').type('2022-12-24')
    cy.get('select').select('Complete')
    cy.get('#submit').click()

  })
})


