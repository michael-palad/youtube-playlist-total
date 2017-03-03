Rails.application.routes.draw do
  root "pages#index"
  get 'playlist-total', to: "pages#playlist_total", as: :playlist_total
end
