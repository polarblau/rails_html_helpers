# Rails HTML Helpers [![Build Status](https://travis-ci.org/polarblau/rails_html_helpers.png?branch=master)](https://travis-ci.org/polarblau/rails_html_helpers)

A bunch of frequently used HTML helpers for Rails apps.

## Installation

Run

```
gem install rails_html_helpers
```

or include the following in your Gemfile:

```
gem 'rails_html_helpers'
```

## Helpers

Currently the following helpers are included:

#### `title(partial = nil, separator = ' | ')`

Store page title partials and render them in your layout.

```erb
# view:
<% title('Article XY') %>

# layout:
<title><%= title('My Site') %></title>
# renders:
<title>Article XY | My Site</title>
```

**Parameters:**

* `partial` (String|Array) — Partial page title
* `path` (String) — Separator used to join partials

***

#### `body_class(partial = nil)`

Store CSS classes for the body tag and render them in your layout.
Includes the controller name by default.

```erb
# view:
<% body_class('important') %>

# layout:
<body class="<%= body_class %>

# given the current controller is the ArticlesController, renders:
<body class="articles foo">
```

**Parameters:**

* `partial` (String|Array) — Classes

***

#### `html_tag(attrs = {}, &block)`

Renders conditional tags around the `<html>` tag for IE as [suggested by Paul Irish](http://paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither
) and used in the HTML5 boilerplate.

If Haml is used a block can be passed to wrap the rest of the page.

```erb
<%= html_tag(:lang => 'en') %>
# renders:
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
```

**Parameters:**

* `attrs` (Hash) — Additonal HTML attributes
