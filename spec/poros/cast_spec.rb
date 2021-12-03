require 'rails_helper'

RSpec.describe Cast do
  it 'has attributes' do
    cast = cast_data[:cast].map do |data|
      Cast.new(data)
    end

    expect(cast.first.name).to eq('Marlon Brando')
    expect(cast.first.role).to eq('Don Vito Corleone')
  end
end
