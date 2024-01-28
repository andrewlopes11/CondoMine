#rotas dos cenarios
Given('estou na pagina de cadastar condomino') do
  visit '/condominos/new'
end

Given('estou na pagina de editar condomino') do
  visit '/condominos/edit/(condomino_id)'
end

Given('estou na pagina de deletar condomino') do
  visit '/condominos/delete/(condomino_id)'
end


#clicar nos botoes
And('clico no botao {string}') do |botao_salvar|
  click_button botao_salvar
end

And('clico no botao {string}') do |botao_editar|
  click_button botao_editar
end

And('clico no botao {string}') do |botao_deletar|
  click_button botao_deletar
end


#preenchendo os dados
When("eu preencho nome {string}, cpf {string}, contato {string}") do |nome, cpf, contato|
  fill_in 'condomino_nome', with: nome
  fill_in 'condomino_cpf', with: cpf
  fill_in 'condomino_contato', with: contato
end


#mensagens
Then('vejo a mensagem {string} informando que condomino foi cadastrado com sucesso') do |mensagem|
  assert_text(mensagem)
end

Then('vejo a mensagem {string} informando que condomino foi deletado com sucesso') do |mensagem|
  assert_text(mensagem)
end

Then('vejo a mensagem {string} informando que condomino foi editado com sucesso') do |mensagem|
  assert_text(mensagem)
end

Then('vejo a mensagem {string} informando que o cpf nao pode ter letras') do |mensagem|
  assert_text(mensagem)
end
