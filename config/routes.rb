# frozen_string_literal: true

Rails.application.routes.draw do
  get 'immunisation_records/:feijoa_id', to: 'immunisation_records#show'
end
