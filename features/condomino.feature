Feature: gerenciamento de condomino
  as a usuario do sistema
  I want to registrar, editar e remover um condomino
  So that eu mantenha o registro dos moradores do condominio atualizado

  Scenario: cadastrar condomino com nome vazio
    Given estou na pagina de cadastrar condomino
    When eu preencho nome ''
    And eu clico no botao 'salvar alteracoes'
    Then vejo a mensagem "Nome can't be blank" informando que o nome nao pode ser vazio

  Scenario: cadastrar novo condomino corretamente
    Given estou na pagina de cadastar condomino
    When eu preencho nome 'rafael', cpf '12345678910', contato 'blablabla@blablabla.com'
    And eu clico no botao 'Cadastrar condomino'
    Then vejo a mensagem 'condomino was successfully created.' confirmando que condomino foi cadastrado corretamente

  Scenario: Cadastrar novo condomino com cpf invalido
    Given estou na pagina de cadastar condomino
    When eu preencho nome 'josue', CPF 'abc45678910', email 'blablabla@blablabla.com'
    And eu clico no botao 'Cadastrar condomino'
    Then vejo a mensagem 'Cpf is not a number' informando que cpf e invalido

  Scenario: editar nome de condomino
    Given estou na pagina de editar cadastro
    When eu preencho o nome 'eduardo'
    And eu clico no botao 'salvar alteracoes'
    Then eu vejo a mensagem 'cadastro was successfully updated' indicando que o cadastro foi atualizado

  Scenario: apagar cadastro de condomino
    Given estou na pagina de visualizar condominos
    When eu vejo o condomino nome 'rafael', cpf '12345678910', contato 'blablabla@blablabla.com'
    And eu clico no botao 'apagar condomino'
    Then vejo a mensagem 'cadastro was successfully deleted' informando que o cadastro foi apagado

