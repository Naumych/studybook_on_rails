# frozen_string_literal: true

json.array! @trains, partial: 'trains/train', as: :train
