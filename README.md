# Rusic landing page theme

A landing theme for Rusic, allowing for simple email signup.

## Prerequisites

You will need the following installed before working with this project.

#### Javascripts

- `node` and `npm`
- `bower`
- `gulp`
- `coffee-script`

#### Rubies

- `ruby`
- `sass`
- `rusic`

## Setup

Copy `.rusic.yml.example` to `.rusic.yml` and fill out the required details. See the [Rusic gem](https://github.com/rusic/rusic-gem#deploy-using-a-rusic-file) docs for further documentation if you're unsure on what goes where.

Now you can install some dependencies!

```
$ npm install && bower install
```

This is all you should need to get up and running.

## Development

During development you will need `gulp` running to compile the Sass and Coffeescript. You can do this by simply running:

```
$ gulp
```

This will watch for any changes and process everything automatically including any assets installed with Bower.

You will also need to watch with the `rusic` to the environment your developing in by running:

```
$ rusic deploy <environment> --watch
```

Once these are both running you should be able to see the compiled scripts, styles and liquid templates by visting your space. 

## Deployment

First, compile the latest assets.

```
$ gulp build
```

Then you can deploy using the [Rusic gem](https://github.com/rusic/rusic-gem).

```
$ rusic deploy <environment>
```

## Custom attributes

The landing page theme has the following custom attribtues available: 

- `google_analytics`
	- Default value: `<!-- GA code -->`
	- Help text: `Insert your full Google Analytics code`
- `logo`
	- Default value: `//rusic-landing-theme.s3.amazonaws.com/logo.svg`
	- Help text: `Full link to your logo`
- `heading`
	- Default value: `Our website is coming soon`
- `sub_heading`
	- Default value: `praesent ornare elit leo, non bibendum metus`
- `signup_message`
	- Default value: `Keep up to date by signing up with Twitter <em>or</em> Facebook`
	- Help text: `A message to prompt users to sign up`
- `thank_you_message`
	- Default value: `Thank you for signing up!`
	- Help text: `A message to display after they sign up`
- `background_color`
	- Help text: `Specfiy a hex colour for your background e.g. #757F9A`
- `background_image`
	- Help text: `Specify a background image, e.g. url(foo.jpg) or linear-gradient(90deg, #FFF 0%, #000 100%)` 
- `text_color`
	- Help text: `Specify a hex colour for your text e.g. #111`

You can output these calling them from the `space` object.

```
{{ space.attribute_name }}
```

## tl;dr


![](http://media.giphy.com/media/a2YMh46Z2ZScE/giphy.gif)