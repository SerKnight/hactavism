Hactavism::Application.routes.draw do
  resources :links

  root :to => "links#root"

  match "/auth/twitter/callback" => "sessions#create", via: [:get, :post]
 
  get 'hactavists' => 'links#hactavists'

  get 'links/:id/upvote'  => 'links#upvote', as: "upvote"
  get 'links/:id/downvote'  => 'links#downvote', as: "downvote"

end
