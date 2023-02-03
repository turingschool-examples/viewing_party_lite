require 'rails_helper'

RSpec.describe Movie, type: :poro do
  describe '#initialize' do
    it 'exists and has attributes' do
      data = { author: 'Patrick E. Abe',
               author_details: { name: 'Patrick E. Abe', username: 'Otokichi786', avatar_path: nil,
                                 rating: 8.0 },
               content: "Described by Roger Ebert as a \"trapped in a haunted house\" movie, this movie set the bar for Horror in the Summer. \r\n\r\nThe \"Nostromo,\" like \"Star Wars\" spacecraft, looks worn and in use, compared to the \"just out of the box\" look of \"Star Trek\" spacecraft. (And I'm a fan of the \"Star Trek\" universe!) The claustrophobic feel of the \"Nostromo\" is due to \"filming inside of a tube\" location shooting next seen in \"Das Boot.\" \r\n\r\nA band of \"space truckers\" are awakened from hibernation, and are shocked to find that they are only half way home. The Company orders them to investigate an Alien transmission, which sets up a descent into Hell as the crew finds themselves being stalked by an opportunistic \"Exomorph.\" As the crew is picked off one by one, the true nature of the beast and the odd attitude of the Science officer, Ash, raise the anxiety level over 100%.\r\n\r\nWhat sets this tale apart from other \"space monster\" films is the character of Third officer Ripley, who raises uncomfortable questions to Capt. Dallas about company policy in general and Science officer Ash in particular. After Capt. Dallas disappears, take-charge-female-Ripley discovers Ash's true intentions and leads her diminished crew to action.\r\n\r\n The level of violence has been described as \"near pornographic,\" which is helped along by H.R. Giger's \"worst nightmare\" mature Alien. This is the first of a memorable franchise, featuring a strong female leader that continues into the \"Prometheus\" prequel.(?)",
               created_at: '2016-09-21T08:25:53.208Z',
               id: '57e24411c3a3681a50003114',
               updated_at: '2021-06-23T15:57:51.110Z',
               url: 'https://www.themoviedb.org/review/57e24411c3a3681a50003114' }
      review = Review.new(data)

      expect(review).to be_a Review
      expect(review.author).to eq('Patrick E. Abe')
      expect(review.content).to eq("Described by Roger Ebert as a \"trapped in a haunted house\" movie, this movie set the bar for Horror in the Summer. \r\n\r\nThe \"Nostromo,\" like \"Star Wars\" spacecraft, looks worn and in use, compared to the \"just out of the box\" look of \"Star Trek\" spacecraft. (And I'm a fan of the \"Star Trek\" universe!) The claustrophobic feel of the \"Nostromo\" is due to \"filming inside of a tube\" location shooting next seen in \"Das Boot.\" \r\n\r\nA band of \"space truckers\" are awakened from hibernation, and are shocked to find that they are only half way home. The Company orders them to investigate an Alien transmission, which sets up a descent into Hell as the crew finds themselves being stalked by an opportunistic \"Exomorph.\" As the crew is picked off one by one, the true nature of the beast and the odd attitude of the Science officer, Ash, raise the anxiety level over 100%.\r\n\r\nWhat sets this tale apart from other \"space monster\" films is the character of Third officer Ripley, who raises uncomfortable questions to Capt. Dallas about company policy in general and Science officer Ash in particular. After Capt. Dallas disappears, take-charge-female-Ripley discovers Ash's true intentions and leads her diminished crew to action.\r\n\r\n The level of violence has been described as \"near pornographic,\" which is helped along by H.R. Giger's \"worst nightmare\" mature Alien. This is the first of a memorable franchise, featuring a strong female leader that continues into the \"Prometheus\" prequel.(?)")
    end
  end
end
