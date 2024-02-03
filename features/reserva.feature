Feature: Reservar ambiente
  As a Condomino do condominio
  I want to reservar um ambiente em horario e data especificos
  So that eu possa usar o ambiente de forma privada

  Background:
    Given estou na pagina de cadastro de reservas
    And existe um Condomino com o nome 'Marcos Test', cpf '12345678875',contato 'marcosteste@teste.com' no sistema de reservas
    And existe um Ambiente com nome 'Quadra', tipo 'Poliesportiva' no sistema de reservas
    Given existe uma reserva do condomino 'Rafael', ambiente 'Quadra', data inicial '2024-02-06', data final '2024-02-20', hora inicial '08:00' e hora final '14:00'

  Scenario: fazer uma nova reserva
    When estou na pagina de cadastro de reserva
    And seleciono o condomino 'Rafael' da lista de condominos
    And seleciono o ambiente 'Quadra' da lista de ambientes
    And preencho a data inicial '2024-03-10', data final '2024-04-20', hora inicial '09:00' e hora final '13:00'
    And eu clico no botao de fazer reserva 'Create Reserva'
    Then sou redirecionado para a pagina de reserva
    Then eu vejo

  Scenario: tentar fazer uma reserva sem um condomino
    When estou na pagina de reservas
    And selecino o ambiente 'Quadra' da lista de ambientes
    And preencho da data inicial '2024-04-21', data final '2024-04-29', hora inicial '06:00' e hora final '08:00'
    And eu clico no botao para criar uma nova reserva 'Create Reserva'
    Then eu vejo a mensagem de erro 'Condomino must exist'

  Scenario: tentar fazer uma reserva sem o ambiente
    When estou na pagina de reservas
    And seleciono o condomino 'Rafael'
    And preencho a data inicial '2025-01-01', data final '2024-01-02, data inicial '10:00' e data final '16:00'
    And eu clico no botao para criar uma nova reserva 'Create Reserva'
    Then eu vejo a mensagem de erro 'Ambiente must exist'

  Scenario: editar uma reserva
    When estou na pagina de editar uma reserva
    And eu clico em 'Editar esta reserva'
    And eu vejo os dados da reserva condomino 'Rafael', ambiente 'Quadra', data inicial '2024-03-10', data final '2024-04-20', hora inicial '09:00' e hora final '13:00'
    And eu modifico a data final '2024-04-15'
    And eu clico em 'Update Reserva'
    Then eu vejo a mensagem de sucesso 'Reserva was successfully updated'

  Scenario: apagar uma reserva
    When eu estou na pagina de visualizar as reservas
    And eu clico no botao 'Mostrar esta reserva' para a reserva do condomino 'Rafael'
    And eu clico no botao 'Apagar esta reserva'
    Then eu vejo a mensagem de sucesso 'Reserva was successfully destroyed'