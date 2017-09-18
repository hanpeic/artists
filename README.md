## Artists

A demo page to search artists by country.

You can visit on:

http://artist-dev.us-west-2.elasticbeanstalk.com/

## Features

Rails 5 in the backend, cache recently search results to avoid call last.fm API frequently.

React in the frontend.

The results are paginated and display 5 results per page.

## Installation

1 Install ruby 2.3

2 Download code

3 Run: bundle install

4 Start the server: rails s

5 Open http://localhost:3000

## Test

Run: rspec

## Problem

Last.fm API's pagination info is not accurate, sometimes when you click last pages you will see an empty list.
