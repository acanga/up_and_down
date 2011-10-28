UpAndDown::Application.routes.draw do                                                                                                                                          
  devise_for :users, :path => "usuarios", :path_names => { :sign_up => "cadastrar", :sign_in => "entrar", :sign_out => "sair", :edit_user => "alterar", :password => "senha" }   
  
  resources :stockholder_base_reports

  # root :to => 'welcome#index'
end