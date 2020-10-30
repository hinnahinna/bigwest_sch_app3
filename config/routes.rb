# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home'
  get  'users/adminsettings'
  get  'schedules/workschedule'
  get  'schedules/requestschedule'
  get  'schedules/approveschedule'
  get  'schedules/editschedule'
  patch 'schedules/:id/update2' => 'schedules#update2'

  devise_for :users
  resources :users, :only => [:update] # adminsettings用
  resources :schedules
  resources :stores
end
