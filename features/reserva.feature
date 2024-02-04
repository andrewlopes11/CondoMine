Feature: Reservar ambiente
  As a Condomino do condominio
  I want to reservar um ambiente em horario e data especificos
  So that eu possa usar o ambiente de forma privada

  Background:
    Given estou na pagina de cadastro de reservas
    When existe um Condomino com o nome 'Marcos Test', cpf '12345678875', contato 'marcosteste@teste.com' no sistema
    And existe um Ambiente com nome 'Quadra', tipo 'Poliesportiva' no sistema de reservas
    Given existe uma reserva do condomino 'Rafael', ambiente 'Quadra', data inicial '2024-02-06', data final '2024-02-20', hora inicial '08:00' e hora final '14:00'

  Scenario: fazer uma nova reserva
    Given estou na pagina de cadastro de reserva
    When seleciono o condomino 'Rafael' da lista de condominos
    And seleciono o ambiente 'Quadra' da lista de ambientes
    And preencho a data inicial '2024-03-10', data final '2024-04-20', hora inicial '09:00' e hora final '13:00'
    And eu clico no botao de fazer reserva 'Create Reserva'
    Then sou redirecionado para a pagina de reserva
    Then eu vejo a mensagem de sucesso 'Reserva was successfully created.'

