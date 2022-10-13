require 'rails_helper'

RSpec.describe Movie do
  before :each do 
    @attributes = {
      id: 17473,
      title: "The Room",
      vote_average: 4.08,
      genres: ["Drama", "Romance"],
      summary: "Johnny is a successful banker with great respect for and dedication to the people in his life, especially his future wife Lisa. The happy-go-lucky guy sees his world being torn apart when his friends begin to betray him one-by-one.",
      cast: [
        { name: "Tommy Wiseau", character: "Johnny" },
        { name: "Juliette Danielle", character: "Lisa" },
        { name: "Greg Sestero", character: "Mark" },
        { name: "Philip Haldiman", character: "Denny" },
        { name: "Carolyn Minnott", character: "Claudette" },
        { name: "Robyn Paris", character: "Michelle" },
        { name: "Dan Janjigian", character: "Chris R" },
        { name: "Kyle Vogt", character: "Peter" },
        { name: "Greg Ellery", character: "Steven" },
        { name: "Mike Holmes", character: "Mike" }
      ],
      reviews: [
        { author: "Gimly", content: "Everybody knows _The Room_ is bad. That's like, the whole thing. But anybody who says its badness is self-aware is a liar. It's regular bad. It's regular fucking awful. Genuinely, the movies my peers in film class were making when I was **fifteen** are better than _The Room_. Before you say it, yes I did watch The Room in a group, and no I didn't enjoy it.\r\n\r\n_Final rating:½ - So bad it’s offensive. I may never fully recover._" },
        { author: "Mr. J.", content: "After seeing the Disaster Artist, I had to see this movie! HORRIBLE! Laughing my ass off but HORRIBLE! Good for you Tommy! Live thendream!!! Still laughing that I'm really watching this! Kind of like a porn movie without the porn!!!" }
      ],
      image_path: "/r0pmDAWu2SvMAyPPIm4jzoYGwvB.jpg"
    }
  end

  it 'exists' do 
    the_room = Movie.new(@attributes)

    expect(the_room).to be_instance_of Movie
  end

  it 'has attributes' do
    the_room = Movie.new(@attributes)

    expect(the_room.id).to eq(17473)
    expect(the_room.title).to eq("The Room")
    expect(the_room.vote_average).to eq(4.08)
    expect(the_room.genres).to eq(["Drama", "Romance"])
    expect(the_room.summary).to eq("Johnny is a successful banker with great respect for and dedication to the people in his life, especially his future wife Lisa. The happy-go-lucky guy sees his world being torn apart when his friends begin to betray him one-by-one.")
    expect(the_room.cast).to be_an Array
    expect(the_room.cast.length).to eq(10)
    expect(the_room.cast.first).to eq({ name: "Tommy Wiseau", character: "Johnny" })
    expect(the_room.reviews).to be_an Array
    expect(the_room.reviews.first).to eq({ author: "Gimly", content: "Everybody knows _The Room_ is bad. That's like, the whole thing. But anybody who says its badness is self-aware is a liar. It's regular bad. It's regular fucking awful. Genuinely, the movies my peers in film class were making when I was **fifteen** are better than _The Room_. Before you say it, yes I did watch The Room in a group, and no I didn't enjoy it.\r\n\r\n_Final rating:½ - So bad it’s offensive. I may never fully recover._" })
    expect(the_room.image_path).to eq("/r0pmDAWu2SvMAyPPIm4jzoYGwvB.jpg")
  end
end