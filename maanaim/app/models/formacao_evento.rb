class FormacaoEvento < ApplicationRecord
  belongs_to :pessoa
  belongs_to :equipe
  belongs_to :evento
end
