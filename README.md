# Cleanups

A Ruby on Rails app that enables the logging and viewing of data from cleanup events organized by individuals or groups. Cleanup records are organized at the state, city, and individual cleanup level.  

# System dependencies

Before using Cleanups you will need:

* The Ruby language (version 2.6.5p114)
* Rails (version 5.2.4.4)

# Installation 

The [make_it_so gem](https://github.com/LaunchAcademy/make_it_so) was used for setting up this project.

To clone this repository and cd into it, run: 
    
    $ git clone https://github.com/AlexDeLucas/cleanups.git
    $ cd cleanups

# Development

Run the following to install dependences:

    $ bundle

Set up the database:

    $ rake db:setup

Start the development server:

    $ rails s

Launch http://localhost:3000/ in the browser.

For checking email in development, mailcatcher is used. To get started, run `gem install mailcatcher` and then `mailcatcher` to start the server. Please refer to the [mailcatcher documentation](https://mailcatcher.me) for more information.

# Deployment?

# TODO

* Build a community cleanups event dashboard, a virtual space where users can plan future cleanups or post information about established upcoming cleanup events.
* Modify the UI of the cleanups#index views page by replacing the list of states and territories with an interactive map infographic.
* Make improvements to the color scheme and other UI design elements.      

# Contribution Guidelines

1. Fork the repository ( https://github.com/[my-github-username]/cleanups/fork )
2. Create your own feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -m 'Added a feature')  
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request  