# frozen_string_literal: true

json.extract! poste, :id, :titulo, :descricao, :created_at, :updated_at
json.url poste_url(poste, format: :json)
