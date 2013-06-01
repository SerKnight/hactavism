Hactavism::Application.routes.draw do
  resources :links

  root :to => "links#root"
 
  get 'hactavists' => 'links#hactavists'

end
