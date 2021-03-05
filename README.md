# ROR Artwork Gallery

An artwork gallery website written in Ruby on Rails.

The live demo is available at [artrails.herokuapp.com](https://artrails.herokuapp.com/) (it may take a moment for the page to load due to Heroku's app sleeping policy).

The website's homepage:

![Artrails homepage](https://trello-attachments.s3.amazonaws.com/5fe5e36c56184658ec8d31b0/6041cabba75e6b215259fbc3/5cd9bb600ae5725a771ad583d927592e/image.png)


## Requirements

* Ruby 2.7.2
* Ruby on Rails 6.0
* PostgreSQL 12.6
* Bootstrap v4.5


## Installation (for Ubuntu 18.04+)

*(Full instructions can be found on [TOP website](https://www.theodinproject.com/courses/ruby-on-rails/lessons/your-first-rails-application-ruby-on-rails))*

1. Install packages/libraries
    ```
    sudo apt update

    sudo apt upgrade

    sudo apt install gcc make libssl-dev libreadline-dev zlib1g-dev libsqlite3-dev
    ```
2. Install Ruby

    Install rbenv
    ```
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv

    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc

    echo 'eval "$(rbenv init -)"' >> ~/.bashrc

    exit
    ```
    ```
    mkdir -p "$(rbenv root)"/plugins

    git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

    rbenv -v
    ```
    Install Ruby
    ```
    rbenv install 2.7.2 --verbose

    rbenv global 2.7.2

    ruby -v
    ```
3. Install Rails
    ```
    gem install rails

    rails -v
    ```
4. Install Yarn
    ```
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -

    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

    sudo apt update && sudo apt install yarn

    yarn --version
    ```
5. Install PostgreSQL ([Detailed instructions here](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04))
    ```
    sudo apt update

    sudo apt install postgresql postgresql-contrib libpq-dev
    ```
    Then create a database.
6. Create a .env file with the contents below
    ```
    POSTGRES_DB="<your PostgreSQL database name>"

    POSTGRES_USER="<your PostgreSQL username>"

    POSTGRES_PASSWORD="<your PostgreSQL password>"

    # POSTGRES_HOST="localhost"

    RAILS_ENV="development"

    CLOUD_NAME="<your Cloudinary cloud name>"

    API_KEY="<your Cloudinary API key>"

    API_SECRET="<your Cloudinary API secret>"
    ```
6. Move to your directory of choice and clone this project
    ```
    git clone git@github.com:HienM7/artwork_gallery.git
    ```
7. Run bundle and rake
    ```
    bundle install

    rails db:setup

    rails db:migrate

    rails db:seed
    ```
8. If you make it here, you should have the website up and running locally when entering this in your terminal:
    ```
    rails s
    ```


## Design notes

The website uses [Cloudinary](https://cloudinary.com/) as the image management service.


## Features

* Upload and manage artworks

* Search, favorite, download (and buy using points), share artworks

* View user profiles

* View transaction list (feature in progress)


## Contributors

* [KhoaDLuu](https://github.com/khoaDLuu)
* [HienM7](https://github.com/HienM7)
