# Viewing Party

This is the base repo for the [Viewing Party Lite project](https://backend.turing.io/module3/projects/viewing_party_lite) used for Turing's Backend Module 3.

### About this Project

Viewing Part Lite is an application in which users can explore movie options and create a viewing party event for themselves and other users of the application.

## Setup for the use of the project

1. A conveyor belt link will be sent out at project kickoff so that you can both fork and copy the project board on this base repo. 

## Local Setup for any other use

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:{drop,create,migrate,seed}`


## Versions

- Ruby 2.7.2

- Rails 5.2.6

Example wireframes to follow are found [here](https://backend.turing.io/module3/projects/viewing_party_lite/wireframes)

## Database Schema
![image](https://user-images.githubusercontent.com/54329737/197135855-a9a1405d-80ea-4d98-9762-7d85dc8cd9a2.png)


## Wire Frames
### users/1/movies/index?utf8=✓&name=tom+and+&commit=Search+for+movies
![image](https://user-images.githubusercontent.com/54329737/197136351-75104891-659e-4e2d-99e7-bcbef671045a.png)
### /users/1/discover?
![image](https://user-images.githubusercontent.com/54329737/197136550-936dafba-31c0-471b-a975-49fa3b6b13b7.png)

![image](https://user-images.githubusercontent.com/54329737/197136351-75104891-659e-4e2d-99e7-bcbef671045a.png)

 ## GETTING STARTED

<p><b>1. </b> Create a new directory on your computer where you'd like the program to live.</p>
<pre><code>$ mkdir /your_folder/viewing_party_lite</code></pre>

<p><b>2. </b> Navigate into the recently created directory.</p>
<pre><code>$ cd /your_folder/viewing_party_lite</code></pre>
<p><b>3. </b> Copy the repository by clicking on the code button on Github repo page (using SSH).</p>

![image](https://user-images.githubusercontent.com/54329737/197137944-e8b3813b-c312-461a-b034-ee8926dd3c1c.png)

<p><b>4. </b> Clone the recently copied repository information into your currenty directory.</p>
<pre><code>$ git clone git@github.com:wes30303/viewing_party_lite</code></pre>

<p><b>5. </b> Open the repository in your preferred IDE.  If you are using VSCode, use the code command shown below:</p>
<pre><code>$ code .</code></pre>

<p><b>6. </b> Install dependencies found in Gemfile</a>.</p>
<pre><code>$ bundle install</code></pre>

<p><b>7. </b> Inside your project directory, install <a href="https://github.com/laserlemon/figaro"> Figaro</a> via your terminal.</p>
<pre><code>$ bundle exec figaro install</code></pre>

<p><b>8. </b> Install <a href="https://lostisland.github.io/faraday/"> Faraday</a>.</p>
<pre><code>$ bundle exec faraday install</code></pre>

<p><b>9. </b> Add API key to config/applicalion.yml</a>.</p>
<pre><code>$ api_key: XXXXX</code></pre>

<p><b>10. </b> Run migrations</p>
<pre><code>$ rails db:{create,migrate,seed}</code></pre>

# Credit
<h3>Wesley Miranda</h3>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/wes30303)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/wesley-miranda-80a725196/)

<h3Thomas Turner</h3>
[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/EagleEye5085)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/thomasturner482/)

