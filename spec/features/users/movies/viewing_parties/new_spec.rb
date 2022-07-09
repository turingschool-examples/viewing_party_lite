require 'rails_helper'

RSpec.describe 'Viewing Party New Page' do
  it 'displays movie attributes' do
    user = User.create!(name: 'User', email: 'user@email.com')
    movie = MoviesFacade.movie(550)

    visit new_user_movie_viewing_party_path(user_id: user.id, movie_id: movie.movie_id)
    expect(page).to have_content('Fight Club')
    expect(page).to have_content('Vote Average: 8.4')
    expect(page).to have_content('Runtime: 2:19')
    expect(page).to have_content('Genre: Drama')
    expect(page).to have_content('Summary Description: "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground "fight clubs" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion."')
  end

  it 'displays the first ten cast members' do
    user = User.create!(name: 'User', email: 'user@email.com')
    movie = MoviesFacade.movie(550)

    visit new_user_movie_viewing_party_path(user_id: user.id, movie_id: movie.id)

    within '#castMembers' do
      expect(page).to have_content('Edward Norton')
      expect(page).to have_content('Brad Pitt')
      expect(page).to have_content('Helena Bonham Carter')
      expect(page).to have_content('Meat Loaf')
      expect(page).to have_content('Jared Leto')
      expect(page).to have_content('Zach Grenier')
      expect(page).to have_content('Holt McCallany')
      expect(page).to have_content('Eion Bailey')
      expect(page).to have_content('Richmond Arquette')
      expect(page).to have_content('David Andrews')
      expect(page).to_not have_content('Christina Cabot')
      expect(page).to_not have_content('Tim DeZarn')
    end
  end

  it 'displays the review count' do
    user = User.create!(name: 'User', email: 'user@email.com')
    movie = MoviesFacade.movie(550)

    visit new_user_movie_viewing_party_path(user_id: user.id, movie_id: movie.id)

    within '#reviews' do
      expect(page).to have_content('7')
    end
  end

  it 'displays the review count' do
    user = User.create!(name: 'User', email: 'user@email.com')
    movie = MoviesFacade.movie(550)

    visit new_user_movie_viewing_party_path(user_id: user.id, movie_id: movie.id)

    within '#reviews' do
      expect(page).to have_content('Goddard')
      expect(page).to have_content('"Pretty awesome movie.  It shows what one crazy person can convince other crazy people to do.  Everyone needs something to believe in.  I recommend Jesus Christ, but they want Tyler Durden."')
      expect(page).to have_content('Brett Pascoe')
      expect(page).to have_content('"In my top 5 of all time favourite movies. Great story line and a movie you can watch over and over again."')
      expect(page).to have_content('MSB')
      expect(page).to have_content('"If you enjoy reading my Spoiler-Free reviews, please follow my blog @\r\nhttps://www.msbreviews.com\r\n\r\nDavid Fincher’s new film, Mank, is coming soon on Netflix, released six years after his latest installment, Gone Girl. Therefore, this week I’m reviewing five of Fincher’s movies. Se7en was the first one, and now it’s time for one of the most culturally impactful films of the 90s, Fight Club. This is another rewatch of another filmmaking classic, one that I was never able to absolutely adore like most people. When this movie came out in 1999, critics were extremely divided, and the film failed at the box office. With time, it gained a cult following through home media, but it’s still considered a very controversial piece of cinema. So, nothing new, having in mind Fincher is at the helm.\r\n\r\nDespite this being my third or fourth time experiencing this story, I never really changed my opinion about it, which is a bit uncommon in my viewing history. Usually, after multiple rewatches, my overall thoughts about a movie slightly vary, but Fight Club is one of the few exceptions. I believe my opinion remains intact from the very first watch. I really enjoy this film, but I can’t state that I absolutely love it. Since this is a special case, I’m going to start with what still bothers me after so many viewings, something I also rarely do in my reviews since I always leave the bad stuff to the end of the article.\r\n\r\nWithout spoiling anything, of course, there’s a vital plot twist that comes later in the movie that I could only appreciate by its execution, but never by its impact on the narrative. Jim Uhls’ screenplay relies on the main characters’ friendship to carry the story forward, and throughout the first two acts, Fincher leaves not-that-subtle hints to a massive revelation, which eventually triggers the beginning of the third act. This major plot point is brilliantly executed, and I still feel incredibly fascinated by its delivery, both in terms of the dialogue and the performances. However, its impact on any lightly focused, observant viewer is close to zero due to the clear evidence that pointed towards this development.\r\n\r\nNow, I don’t want to sound like that stereotypical moviegoer that says, “I guessed the twist before its revelation, hence it all sucks”. Like I insinuate above, I was still wholly captivated during the entirety of the third act. Nevertheless, Fight Club’s runtime is far from being short, and Fincher spends a lot of time building up an idea that loses its surprise factor even before the film’s midpoint. It changes the protagonist’s perspective, it takes the viewer through a predictable yet entertaining path, setting up a powerful, meaningful ending. However, personally, I don’t feel like the time spent in the first two acts was satisfyingly compensated in the end… at least, not in its entirety.\r\n\r\nThe second act also has a short period where it loses a bit of steam due to some repetitive sequences and an unnecessary amount of flashbacks. Again, I feel like Fincher didn’t completely trust the audience back then, contrary to his procedure in Se7en. In the latter flick, Fincher left the biggest responsibility to the viewer’s imagination, leaving the murder scenes for the audience to picture in their minds. In Fight Club, that ambiguity and implicit dialogue are still present, sure, but even before the third act, there’s already an attempt to explain too much certain portions of the narrative that I wish would stay vaguer.\r\n\r\nWithout spoiling anything, of course, there’s a vital plot twist that comes later in the movie that I could only appreciate by its execution, but never by its impact on the narrative. Jim Uhls’ screenplay relies on the main characters’ friendship to carry the story forward, and throughout the first two acts, Fincher leaves not-that-subtle hints to a massive revelation, which eventually triggers the beginning of the third act. This major plot point is brilliantly executed, and I still feel incredibly fascinated by its delivery, both in terms of the dialogue and the performances. However, its impact on any lightly focused, observant viewer is close to zero due to the clear evidence that pointed towards this development.\r\n\r\nNow, I don’t want to sound like that stereotypical moviegoer that says, “I guessed the twist before its revelation, hence it all sucks”. Like I insinuate above, I was still wholly captivated during the entirety of the third act. Nevertheless, Fight Club’s runtime is far from being short, and Fincher spends a lot of time building up an idea that loses its surprise factor even before the film’s midpoint. It changes the protagonist’s perspective, it takes the viewer through a predictable yet entertaining path, setting up a powerful, meaningful ending. However, personally, I don’t feel like the time spent in the first two acts was satisfyingly compensated in the end… at least, not in its entirety.\r\n\r\nThe second act also has a short period where it loses a bit of steam due to some repetitive sequences and an unnecessary amount of flashbacks. Again, I feel like Fincher didn’t completely trust the audience back then, contrary to his procedure in Se7en. In the latter flick, Fincher left the biggest responsibility to the viewer’s imagination, leaving the murder scenes for the audience to picture in their minds. In Fight Club, that ambiguity and implicit dialogue are still present, sure, but even before the third act, there’s already an attempt to explain too much certain portions of the narrative that I wish would stay vaguer.\r\n\r\nDon’t worry, I’m done with the negatives, and don’t forget: I really, really like this movie. Obviously, Fincher and Uhls created a story packed with underlying themes and social commentary. From the whole consumerism theory to the more psychological component regarding Edward Norton’s mental state, every message is seamlessly communicated to the audience. I’ve also been through a point in my life where I wish I’d be someone else, someone who had already achieved every dream of mine successfully with an overwhelming feeling of fulfillment. Coping with the inability to become that perfect someone can become an excruciating, sad, depressing process, and it varies drastically from person to person.\r\n\r\nFight Club approaches mental health and people’s acceptance of who they truly are in a groundbreaking manner, capturing Edward Norton’s emotions perfectly and broadcasting his thoughts through some of the best narration in the history of cinema. Its take on the world of consumerism is undoubtedly interesting and plays a big part in the climax of the film. Despite the issues described above, Uhls’ screenplay is very well-written, elevating the conversations between Norton and Brad Pitt (Ad Astra, Once Upon a Time in Hollywood), which are indeed remarkably entertaining. Predictable or not, the main story is wonderfully executed by Fincher, who continues to demonstrate his impressive technical attributes.\r\n\r\nOnce again, the pre-production phase is proved here to be as important as any other stage in the filmmaking process. Fincher’s dedication to his features is palpable and visible on-screen through every single technical aspect. This time, Fincher brought in Jeff Cronenweth as the director of photography, and both worked together to not only create that desaturated, realistic atmosphere that Fincher loves so much but also to deliver the brutal, violent, bloody fight scenes that keep the entertainment levels at their highest. With clean, consistent, coherent editing from James Haygood, the movie flows beautifully despite its lengthy runtime. The Dust Brothers’ score is quite alternative, which suits the also unconventional storytelling.\r\n\r\nLast but not least, Edward Norton and Brad Pitt. I know it’s incredibly cliche to write that two actors share impeccable chemistry, but Norton and Pitt take it to a whole other level. In two physically-demanding displays, both actors deliver award-worthy performances that marked their careers. Pitt offers one of his most underrated portrayals, being extremely funny throughout the entire film, but also astonishingly badass, carrying his fight sequences as amazing as he does with his dialogues. On the other hand, seeing Norton go all-out is a terrific experience. I lack words to describe such an emotionally compelling interpretation, filled with powerful character moments. A final word of praise to Helena Bonham Carter (Enola Holmes), who also delivers an exceptional performance.\r\n\r\nIn the end, Fight Club is and will probably remain David Fincher’s most controversial movie for a long, long time. With an absolutely brilliant direction and execution, Fincher uses Jim Uhls’ captivating, layered, unconventional screenplay to tackle themes such as consumerism, society’s behavior, and mental health, seamlessly transmitting meaningful yet contentious messages. Once again, the filmmaking in display is technically flawless, going from the trademark authentic cinematography and production design to the unique score, all flowing superbly through excellent editing. Unfortunately, I don’t belong to the group of people who utterly love this film. The excessive (sometimes unnecessary) use of flashbacks doesn’t help, but it’s the enormous build-up packed with overly explicit clues to a significant (yet unsurprising) plot twist that ends up partially ruining the viewing for me. I also wish that the script developed a few plot points more ambiguously, but Brad Pitt and Edward Norton elevate the whole movie so much with their ridiculously outstanding performances that these small issues don’t keep me away from highly recommending one of the most memorable, iconic films of all-time.\r\n\r\nRating: A-"')
      expect(page).to have_content('r96sk')
      expect(page).to have_content('rsanek')
      expect(page).to have_content('Wuchak')
      expect(page).to have_content('katch22')
    end
  end
end
