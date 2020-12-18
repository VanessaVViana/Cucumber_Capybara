Quando("eu faco login com {string} e {string}") do |email, password|
    visit '/'
    find("#emailId").set email
    find("#passId").set password
  end
  
E("Clico no botao {string}") do |string|
    click_button "Entrar"
  end
  
E("devo ser autenticado") do
    js_script = 'return window.localStorage.getItem("default_auth_token");'
    token = page.execute_script(js_script)
    expect(token.length).to be 147
  end

Então("sistema exibe {string} na área logada") do |expect_name|
    user = find('.sidebar-wrapper .user .info span')
    expect(user.text).to eql expect_name
  end

E("nao devo ser autenticado") do
  js_script = 'return window.localStorage.getItem("default_auth_token");'
  token = page.execute_script(js_script)
  expect(token).to be nil
  end

Então('Sistema exibe mensagem {string}') do |expect_message|
    alert = find(".alert")
    expect(alert.text).to eql expect_message
  end
  