#Jammed
###A Ruby API wrapper for [This Is My Jam](http://www.thisismyjam.com/).

Note: The API for This Is My Jam is stil in beta, so if you'd like to use it please email the Jam team at api@thisismyjam.com to get on their mailing list.

## Installation

Add this line to your application's Gemfile:

    gem 'jammed'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jammed

## Usage

#### People Search

Returns people with the search string in their username, full name or Twitter name:

    $ Jammed::PeopleSearch.search_name('institute')

Returns people who have posted tracks by artists:

    $ Jammed::PeopleSearch.search_artist('beach boys')

Returns people who have posted a particular track (strict, case-insensitive matching).

    $ Jammed::PeopleSearch.search_track('Lana del Rey', 'Video games')

#### Popular Jams

Returns random sample (20 out of 40) of popular jams over the past 48 hours:

    $ Jammed::PopularJams.popular_jams

#### Suggested People

Returns list of suggested users:

    $ Jammed::SuggestedPeople.people

#### User

Provides methods to interact with user specific data through Jammed::User objects:

    user = Jammed::User.new('IFTFOM')
    user.profile
      # caches and returns API call to /IFTFOM.json?
    user.name
      # returns the attribute value if present in profile ('IFTFOM')
    user.followers(:order => :date)
      # caches and returns API call to /followers.json?order=date
    user.followers!
      # clears cache and returns API call to /followers.json

See source for all Jammed::User instance methods.

The user specific API calls can also be called directly:

    $ Jammed::Person.profile(:username => 'IFTFOM')
      #same as user.profile above
    $ Jammed::Followers.followers('IFTFOM', :order => :date)
      #same as user.followers(:order => :date) above

## Links

* [This Is My Jam](http://www.thisismyjam.com/)
* [This Is My Jam API Documentation](http://www.thisismyjam.com/developers)
* [This Is My Jam API Google Group](https://groups.google.com/forum/?fromgroups#!forum/thisismyapi)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
