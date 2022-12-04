<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![LinkedIn][linkedin-shield]][linkedin-url]
[![LinkedIn][linkedin-shield2]][linkedin-url2]



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/AMSterling/viewing_party_lite">
  </a>

<h1 align="center">Viewing Party Lite</h1>

  <p align="center">
    Viewing Party Lite is an application in which users can explore movie options and create 
    a viewing party event for themselves and other users of the application.
    <br />
    <a href="https://github.com/AMSterling/viewing_party_lite"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/AMSterling/viewing_party_lite">View Demo</a>
    ·
    <a href="https://github.com/AMSterling/viewing_party_lite/issues">Report Bug</a>
    ·
    <a href="https://github.com/AMSterling/viewing_party_lite/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

# <img src="app/assets/images/ViewingPartyHome.png"> 

Example wireframes are found [here](https://backend.turing.io/module3/projects/viewing_party_lite/wireframes)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

* [![Rails][Rails]][Rails-url]
* [![Ruby][Ruby]][Ruby-url]
* [![RSpec][RSpec]][RSpec-url]
* [![Atom][Atom]][Atom-url]
* [![Visual Studio Code][Visual Studio Code]][Visual Studio Code-url]
* [![CSS][CSS]][CSS-url]
* [![HTML5][HTML5]][HTML5-url]
* [![JavaScript][JavaScript]][JavaScript-url]
* [![PostgreSQL][PostgreSQL]][PostgreSQL-url]
* [![Heroku][Heroku]][Heroku-url]
* [![jQuery][jQuery]][jQuery-url]
* [![RuboCop][RuboCop]][RuboCop-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

Follow installation instructions below. Push to your preferred production server or in your terminal run 
  ```sh 
  rails server
  ``` 
Then open [http://localhost:3000](http://localhost:3000) in your browser.

### Prerequisites

This is an example of how to list things you need to use the software and how to install them.
* ruby
  ```sh
  rbenv install 2.7.4
  gem install rails --version 5.2.8
  ```

### Installation

1. Get a free API Key at [https://www.themoviedb.org/settings/api](https://www.themoviedb.org/settings/api)
2. Clone the repo
   ```sh
   git clone https://github.com/AMSterling/viewing_party_lite.git
   ```
3. Install gem packages
   ```sh
   rails db:{drop,create,migrate}
   bundle install
   bundle exec figaro install
   bundle update
   ```
4. Enter your API in `config/application.yml`
   ```js
   movie_api_key: 'ENTER YOUR API';
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

Create Movie Viewing Parties with friends. Search movies from [The Movie Database](https://www.themoviedb.org), select a day, time, and invite other users.

_For more examples, please refer to the [Documentation](https://example.com)_

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ROADMAP -->
## Roadmap

- [ ] Feature 1
- [ ] Feature 2
- [ ] Feature 3
    - [ ] Nested Feature

See the [open issues](https://github.com/AMSterling/viewing_party_lite/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [AMSterling](https://github.com/AMSterling)
* [blakesaylor](https://github.com/blakesaylor)
* [Turing School](https://github.com/turingschool-examples/viewing_party_lite)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



## Heroku

- heroku restart
- heroku pg:reset DATABASE
- heroku run rails db:migrate
- git push heroku main
- heroku buildpacks:set heroku/ruby
- heroku stack:set heroku-20
<!-- - heroku ps:scale web=1 -->

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/AMSterling/viewing_party_lite.svg?style=for-the-badge
[contributors-url]: https://github.com/AMSterling/viewing_party_lite/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/AMSterling/viewing_party_lite.svg?style=for-the-badge
[forks-url]: https://github.com/AMSterling/viewing_party_lite/network/members
[stars-shield]: https://img.shields.io/github/stars/AMSterling/viewing_party_lite.svg?style=for-the-badge
[stars-url]: https://github.com/AMSterling/viewing_party_lite/stargazers
[issues-shield]: https://img.shields.io/github/issues/AMSterling/viewing_party_lite.svg?style=for-the-badge
[issues-url]: https://github.com/AMSterling/viewing_party_lite/issues
[license-shield]: https://img.shields.io/github/license/AMSterling/viewing_party_lite.svg?style=for-the-badge
[license-url]: https://github.com/AMSterling/viewing_party_lite/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/sterling-316a6223a/
[linkedin-shield2]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url2]: https://linkedin.com/in/blake-saylor
[product-screenshot]: 

[Atom]: https://img.shields.io/badge/Atom-66595C?style=for-the-badge&logo=Atom&logoColor=white
[Atom-url]: https://atom.io/

[Bootstrap]: https://img.shields.io/badge/bootstrap-%23563D7C.svg?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com/

[CircleCI]: https://img.shields.io/badge/circle%20ci-%23161616.svg?style=for-the-badge&logo=circleci&logoColor=white
[CircleCI-url]: https://circleci.com/developer

[CSS]: 	https://img.shields.io/badge/CSS-239120?&style=for-the-badge&logo=css3&logoColor=white
[CSS-url]: https://en.wikipedia.org/wiki/CSS

[Fly]: https://custom-icon-badges.demolab.com/badge/Fly-DCDCDC?style=for-the-badge&logo=fly-io
[Fly-url]: https://fly.io/

[GitHub Badge]: https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white
[GitHub-url]: https://github.com/<Username>/

[Heroku]: https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white
[Heroku-url]: https://www.heroku.com/

[HTML5]: https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white
[HTML5-url]: https://en.wikipedia.org/wiki/HTML5

[JavaScript]: https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E
[JavaScript-url]: https://www.javascript.com/

[jQuery]: https://img.shields.io/badge/jquery-%230769AD.svg?style=for-the-badge&logo=jquery&logoColor=white
[jQuery-url]: https://github.com/rails/jquery-rails

[LinkedIn Badge]: https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white
[LinkedIn-url]: https://www.linkedin.com/in/<Username>/

[Miro]: https://img.shields.io/badge/Miro-050038?style=for-the-badge&logo=Miro&logoColor=white
[Miro-url]: https://miro.com/

[PostgreSQL]: https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white
[PostgreSQL-url]: https://www.postgresql.org/

[Postman]: https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=postman&logoColor=white
[Postman-url]: https://web.postman.co/

[Rails]: https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white
[Rails-url]: https://rubyonrails.org/

[RSpec]: https://custom-icon-badges.demolab.com/badge/RSpec-fffcf7?style=for-the-badge&logo=rspec
[RSpec-url]: https://rspec.info/

[RuboCop]: https://img.shields.io/badge/RuboCop-000?logo=rubocop&logoColor=fff&style=for-the-badge
[RuboCop-url]: https://docs.rubocop.org/rubocop-rails/index.html

[Ruby]: https://img.shields.io/badge/Ruby-000000?style=for-the-badge&logo=ruby&logoColor=CC342D
[Ruby-url]: https://www.ruby-lang.org/en/

[Visual Studio Code]: https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white
[Visual Studio Code-url]: https://code.visualstudio.com/

[bcrypt-docs]: https://github.com/bcrypt-ruby/bcrypt-ruby
[capybara-docs]: https://github.com/teamcapybara/capybara
[factory_bot_rails-docs]: https://github.com/thoughtbot/factory_bot_rails
[faker-docs]: https://github.com/faker-ruby/faker
[faraday-docs]: https://lostisland.github.io/faraday/
[figaro-docs]: https://github.com/laserlemon/figaro
[jsonapi-serializer-docs]: https://github.com/jsonapi-serializer/jsonapi-serializer
[launchy-docs]: https://www.rubydoc.info/gems/launchy/2.2.0
[omniauth-google-oauth2-docs]: https://github.com/zquestz/omniauth-google-oauth2
[orderly-docs]: https://github.com/jmondo/orderly
[pry-docs]: https://github.com/pry/pry
[rspec-rails-docs]: https://github.com/rspec/rspec-rails
[shoulda-matchers-docs]: https://github.com/thoughtbot/shoulda-matchers
[simplecov-docs]: https://github.com/simplecov-ruby/simplecov
[vcr-docs]: https://github.com/vcr/vcr
[webmock-docs]: https://github.com/bblimke/webmock
