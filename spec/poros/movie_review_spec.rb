require 'rails_helper'

RSpec.describe MovieReview do
  before :each do
    data =      
  {
      "author": "Gurre",
      "author_details": {
          "name": "",
          "username": "Gurre",
          "avatar_path": nil,
          "rating": 9.0
      },
      "content": "\"The Greatest Movie of All Time!\" That's the general opinion of this movie, and I agree that it is a great movie, but I have seen better movies. \r\n\r\nThe story of Citizen Kane is simple, a newspaper tycoon named Charles Foster Kane (Orson Welles) dies, and his last word is \"Rosebud\". No one knows what it means, and a reporter starts interviewing people Kane knew, to see if they know the meaning of \"Rosebud\". Through flash-backs we get to see Kane's life.\r\n\r\nNow, as I said, I don't agree that it's the greatest movie of all time, however it's great. I love this movie. It's a daring and controversial movie of its time, and it introduced alot of new technices in filmmaking. The acting is superb! Orson Welles as Kane is breathtaking, Joseph Cotten as Jed Leland is great. There's one performance I can hardly stand though and that's Dorothy Comingore's performance as Susan Alexander. Hideous performance to say the least! The writing is amazing, and Welles' directing is out-of-this-world!\r\n\r\nIn conclusion, great movie (however not the greatest ever made). It's definitly a movie you need to watch!\r\n\r\nI give it a 9/10",
      "created_at": "2014-05-31T21:57:43.868Z",
      "id": "538a50570e0a2605ff000812",
      "updated_at": "2021-06-23T15:57:26.635Z",
      "url": "https://www.themoviedb.org/review/538a50570e0a2605ff000812"
  }

  @review = MovieReview.new(data)
  end

  it 'exists and has attributes' do
    expect(@review.author).to eq("Gurre")
    expect(@review.rating).to eq(9.0)
    expect(@review.content).to eq("\"The Greatest Movie of All Time!\" That's the general opinion of this movie, and I agree that it is a great movie, but I have seen better movies. \r\n\r\nThe story of Citizen Kane is simple, a newspaper tycoon named Charles Foster Kane (Orson Welles) dies, and his last word is \"Rosebud\". No one knows what it means, and a reporter starts interviewing people Kane knew, to see if they know the meaning of \"Rosebud\". Through flash-backs we get to see Kane's life.\r\n\r\nNow, as I said, I don't agree that it's the greatest movie of all time, however it's great. I love this movie. It's a daring and controversial movie of its time, and it introduced alot of new technices in filmmaking. The acting is superb! Orson Welles as Kane is breathtaking, Joseph Cotten as Jed Leland is great. There's one performance I can hardly stand though and that's Dorothy Comingore's performance as Susan Alexander. Hideous performance to say the least! The writing is amazing, and Welles' directing is out-of-this-world!\r\n\r\nIn conclusion, great movie (however not the greatest ever made). It's definitly a movie you need to watch!\r\n\r\nI give it a 9/10")
  end
end