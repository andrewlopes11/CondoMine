# Visitar a página de cadastro de reservas
Given('estou na pagina de cadastro de reservas') do
  visit '/reservas/new'
end

# Criar um Condomino no sistema de reservas
When('existe um Condomino com o nome {string}, cpf {string}, contato {string} no sistema') do |nome, cpf, contato|
  Condomino.create!(
    nome: nome, cpf: cpf, contato: contato
  )
end

# Criar um Ambiente no sistema de reservas
Given('existe um Ambiente com nome {string}, tipo {string} no sistema de reservas') do |nome, tipo|
  Ambiente.create!(nome: nome, tipo: tipo)
end

# Criar uma reserva com base no Condomino e Ambiente especificados
Given('existe uma reserva do condomino {string}, ambiente {string}, data inicial {string}, data final {string}, hora inicial {string} e hora final {string}') do |nome_condomino, nome_ambiente, data_ini, data_fim, hora_ini, hora_fim|
  condomino = Condomino.find_by(nome: nome_condomino)
  ambiente = Ambiente.find_by(nome: nome_ambiente)
  Reserva.create!(
    data_ini: Date.parse(data_ini),
    data_fim: Date.parse(data_fim),
    hora_ini: hora_ini,
    hora_fim: hora_fim
  )
end

# Navegar para a página de cadastro de nova reserva
When('estou na pagina de cadastro de reserva') do
  visit '/reservas/new'
end

# Selecionar um Condomino da lista
When('seleciono o condomino {string} da lista de condominos') do |nome_condomino|
  Condomino = Condomino.find_by(nome: nome_condomino)
  select nome_condomino, from: 'reserva_condomino_id'
end

# Selecionar um Ambiente da lista
When('seleciono o ambiente {string} da lista de ambientes') do |nome_ambiente|
  Ambiente = Ambiente.find_by(nome: nome_ambiente)
  select nome_ambiente, from: 'reserva_ambiente_id'
end

# Preencher os campos de data e hora da reserva
When('preencho a data inicial {string}, data final {string}, hora inicial {string} e hora final {string}') do |data_ini, data_fim, hora_ini, hora_fim|
  fill_in 'reserva_data_ini_1i', with: data_ini.split('-')[0] # ano
  fill_in 'reserva_data_ini_2i', with: data_ini.split('-')[1] # mês
  fill_in 'reserva_data_ini_3i', with: data_ini.split('-')[2] # dia
  fill_in 'reserva_data_fim_1i', with: data_fim.split('-')[0] # ano
  fill_in 'reserva_data_fim_2i', with: data_fim.split('-')[1] # mês
  fill_in 'reserva_data_fim_3i', with: data_fim.split('-')[2] # dia
  select hora_ini, from: 'reserva_hora_ini_4i' # hora
  select hora_ini.split(':')[1], from: 'reserva_hora_ini_5i' # minuto
  select hora_fim, from: 'reserva_hora_fim_4i' # hora
  select hora_fim.split(':')[1], from: 'reserva_hora_fim_5i' # minuto
end

# Clicar no botão para criar a reserva
When('eu clico no botao de fazer reserva {string}') do |nome_do_botao|
  click_button nome_do_botao
end

# Verificar se foi redirecionado para a página de reserva com sucesso
Then('sou redirecionado para a pagina de reserva') do
  expect(page).to have_current_path(reserva_path(Reserva.last))
end

# Verificar a mensagem de sucesso
Then('eu vejo a mensagem de sucesso {string}') do |mensagem|
  expect(page).to have_content(mensagem)
end
