UpAndDown::Application.routes.draw do                                                                                                                                          
  devise_for :users, :path => "usuarios", :path_names => { :sign_up => "cadastrar", :sign_in => "entrar", 
    :sign_out => "sair", :edit_user => "alterar", :password => "senha" } do
      post "/usuarios/cadastrar" => "devise/registrations#create", :as => :create_user
  end
  
  resources :stockholder_base_reports, :actions => [ :new, :create, :index ], :path => "relatorio_de_movimentacao_dos_acionistas", 
    :path_names =>  { :new => "cadastrar" }

  root :to => "stockholder_base_reports#index"
end