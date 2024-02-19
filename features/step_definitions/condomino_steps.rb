#rotas dos cenarios
Given('estou na pagina de cadastrar condomino') do
  visit '/condominos/new'
  expect(page).to have_current_path('/condominos/new')
end

Given('estou na pagina de editar cadastro de condomino') do
  #partindo da ideia de que para editar um cadastro deve ter um cadastro, vamos primeiro criar para depois acessar o cadastro e realizar a alteracao
  condomino = Condomino.create(nome: 'lucas melo', cpf: '12345678900', contato: 'teste@gmail.com')

  visit edit_condomino_path(condomino)
  expect(page).to have_current_path(edit_condomino_path(condomino))

end

Given('estou na pagina de visualizar condomino') do
  #partindo da ideia de que para editar um cadastro deve ter um cadastro, vamos primeiro criar para depois acessar o cadastro e realizar a alteracao
  condomino = Condomino.create(nome: 'lucas melo', cpf: '12345678900', contato: 'teste@gmail.com')

  visit condomino_path(condomino)
  expect(page).to have_current_path(condomino_path(condomino))
end


#clicar nos botoes
When('eu clico no botao create condomino') do
  click_button "Create Condomino"
end

When('eu clico no botao update Condomino') do
  click_button "Update Condomino"
end

When("eu clico no botao de excluir") do
  click_button "Destroy this condomino"
end

Then("o condomino com nome {string} não deve estar mais listado") do |nome|
  expect(page).to_not have_content(nome)
end


#preenchendo os dados

When("eu preencho nome {string}, cpf {string}, contato {string}") do |nome, cpf, contato|
  fill_in 'condomino[nome]', :with => nome
  fill_in 'condomino[cpf]', :with => cpf
  fill_in 'condomino[contato]', :with => contato
end


#mensagens

Then('vejo a mensagem {string} informando que o nome nao pode ser vazio') do |mensagem|
  expect(page).to have_content("Nome can't be blank")
end

Then('vejo a mensagem {string} confirmando que condomino foi cadastrado corretamente') do |mensagem|
  expect(page).to have_content(mensagem)
end

Then('vejo a mensagem {string} informando que cpf e invalido') do |mensagem|
  expect(page).to have_content(mensagem)
end

Then('vejo a mensagem {string} indicando que o cadastro foi atualizado') do |mensagem|
  expect(page).to have_content(mensagem)
end


Then('vejo a mensagem {string} confirmando a exclusao') do |mensagem|
  expect(page).to have_content(mensagem)
end
