UpAndDown::Application.routes.draw do                                                                                                                                          
  devise_for :users, :path => "usuarios", :path_names => { :sign_up => "cadastrar", :sign_in => "entrar", 
    :sign_out => "sair", :edit_user => "alterar", :password => "senha" }   
  
  resources :stockholder_base_reports, :path => "relatorio_de_movimentacao_dos_acionistas", :path_names =>  { :new => "cadastrar" }
  post "/relatorio_de_movimentacao_dos_acionistas/cadastrar" => "stockholder_base_reports#create", :as => :create_stockholder_base_report

  root :to => "stockholder_base_reports#index"
end