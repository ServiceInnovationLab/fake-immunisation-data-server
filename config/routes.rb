# frozen_string_literal: true

Rails.application.routes.draw do
  get 'immunisation_records', to: 'immunisation_records#show'
end
