days =
  1:
    title: "Get a free ebook"
    description: """Get the free ebook "Efficiency in Development Workflows"."""
    callToAction: "Download ebook"
    link: "http://ebooks.codeship.io/efficiency-in-development-workflows-by-codeship"
  2:
    title: "Vagrant Machines with Packer"
    description: "Learn how to build Vagrant Machines with Packer"
    callToAction: "Read blog post"
    link: "http://blog.codeship.io/2013/11/07/building-vagrant-machines-with-packer.html"
  3:
    title: "Unit testing with Angular JS"
    description: "Learn Unit Testing best practices in AngularJS"
    callToAction: "Read blog post"
    link: "http://blog.codeship.io"
  4:
    title: "Free Codeschool course"
    description: "Get a video at Codeschool for free!"
    callToAction: "Watch video"
    link: "http://blog.codeship.io"
  5:
    title: "Free Codeschool course"
    description: "Get a video at Codeschool for free!"
    callToAction: "Watch video"
    link: "http://blog.codeship.io"

# calculate today's window
dec24 = new Date(2013, 11, 24)
now = new Date()
now = new Date(2013, 11, 3);
days_till_xmas = Math.ceil (dec24 - now) / (24 * 60 * 60 * 1000)
todays_window = 24 - days_till_xmas
todays_window= Math.max 1, todays_window
todays_window = Math.min 24, todays_window

render = (template_name, data) ->
  template = $("##{template_name}_template").html()
  $element = $("##{template_name}")
  rendered = Mustache.render(template, data)
  $element.html rendered

# Render today
todays_data = days[todays_window]
todays_data.day = todays_window
render "today", todays_data

# Render calendar
days_list = for day, text of days
  text.day = day
  text.open = true if todays_window >= day
  text
render "days", days: days_list
