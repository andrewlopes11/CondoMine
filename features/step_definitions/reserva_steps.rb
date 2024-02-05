Given('estou na pagina de cadastro de reserva') do
  visit '/reservas/new'
end

Given('existe um Condomino com o nome {string}, cpf {string}, contato {string} no sistema') do |nome, cpf, contato|
  Condomino.find_or_create_by!(nome: nome, cpf: cpf.gsub(/^0-9/, ''), contato: contato)
end

Given('existe um Ambiente com nome {string}, tipo {string} no sistema de reservas') do |nome, tipo|
  Ambiente.find_or_create_by!(nome: nome, tipo: tipo)
end

Given('estou na pagina de editar uma reserva') do
  reserva = Reserva.create(condomino: 'Marcos Teste', ambiente: 'Quadra', data_ini: '2024-03-10', data_fim: '2024-04-15', hora_ini: '09:00', hora_fim: '13:00')
  visit reserva_path(reserva)
  expect(page).to have_current_path(edit_reserva_path(reserva))
end

Given('estou na pagina de visualizar as reservas') do
  visit reservas_path
end

When('seleciono o condomino {string} da lista de condominos') do |nome_condomino|
  select nome_condomino, from: 'reserva_condomino_id'
end

When('seleciono o ambiente {string} da lista de ambientes') do |nome_ambiente|
  select nome_ambiente, from: 'reserva_ambiente_id'
end

When('preencho a data inicial {string}, data final {string}, hora inicial {string} e hora final {string}') do |data_ini, data_fim, hora_ini, hora_fim|
  fill_in 'reserva_data_ini', with: data_ini
  fill_in 'reserva_data_fim', with: data_fim
  fill_in 'reserva_hora_ini', with: hora_ini
  fill_in 'reserva_hora_fim', with: hora_fim
end


Then('eu vejo a mensagem de sucesso {string}') do |mensagem|
  expect(page).to have_content(mensagem)
end

When('preencho com o condomino {string}, ambiente {string}, data inicial {string}, data final {string}, hora inicial {string} e hora final {string}') do |nome_condomino, nome_ambiente, data_ini, data_fim, hora_ini, hora_fim|
  select reserva_condomino_id, from: nome_condomino
  select reserva_ambiente_id, from: nome_ambiente
  fill_in 'reserva_data_ini', with: data_ini
  fill_in 'reserva_data_fim', with: data_fim
  fill_in 'reserva_hora_ini', with: hora_ini
  fill_in 'reserva_hora_fim', with: hora_fim
end

Then('eu vejo a mensagem de erro {string}') do |mensagem|
  expect(page).to have_content(mensagem)
end

When('eu vejo os dados da reserva condomino {string}, ambiente {string}, data inicial {string}, data final {string}, hora inicial {string} e hora final {string}') do |nome_condomino, nome_ambiente, data_inicial, data_final, hora_inicial, hora_final|
  expect(page).to have_content(nome_condomino)
  expect(page).to have_content(nome_ambiente)
  expect(page).to have_content(data_inicial)
  expect(page).to have_content(data_final)
  expect(page).to have_content(hora_inicial)
  expect(page).to have_content(hora_final)
end

When('eu clico no botao de {string}') do |botao_update|
  click_button botao_update
end

When('eu clico no botao {string} para a reserva do condomino {string}') do |botao, condomino|
  reserva = Reserva.find_by(condomino: condomino)
  visit reserva_path(reserva)
  click_button botao
end

When('eu clico no botao {string}') do |botao|
  click_button botao
end

Then('eu vejo a mensagem de sucesso {string}') do |mensagem|
  expect(page).to have_content(mensagem)
end

When('eu clico no botao {string} para a reserva do condomino {string}') do |botao, condomino|
  reserva = Reserva.find_by(condomino: condomino)
  visit reserva_path(reserva)
  click_button botao
end


When('eu clico no botao {string} apagando a reserva') do |botao_apagar|
  click_button botao_apagar
end

When('eu edito os dados da reserva condomino {string}, ambiente {string}, data inicial {string}, data final {string}, hora inicial {string} e hora final {string}') do |nome_condomino, nome_ambiente, data_inicial, data_final, hora_inicial, hora_final|
  condomino = Condomino.find_by(nome: nome_condomino)
  ambiente = Ambiente.find_by(nome: nome_ambiente)

  expect(page).to have_content(data_inicial)
  expect(page).to have_content(data_final)
  expect(page).to have_content(hora_inicial)
  expect(page).to have_content(hora_final)
end