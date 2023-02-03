require 'rails_helper'

RSpec.describe Movie, type: :poro do
  describe '#initialize' do
    it 'exists and has attributes' do
      data = { adult: false,
               gender: 1,
               id: 10_205,
               known_for_department: 'Acting',
               name: 'Sigourney Weaver',
               original_name: 'Sigourney Weaver',
               popularity: 38.615,
               profile_path: '/flfhep27iBxseZIlxOMHt6zJFX1.jpg',
               cast_id: 4,
               character: 'Lt. Ellen Louise Ripley',
               credit_id: '52fe423bc3a36847f800e125',
               order: 1 }

      cast = Cast.new(data)

      expect(cast).to be_a Cast
      expect(cast.name).to eq('Sigourney Weaver')
      expect(cast.character).to eq('Lt. Ellen Louise Ripley')
    end
  end
end
