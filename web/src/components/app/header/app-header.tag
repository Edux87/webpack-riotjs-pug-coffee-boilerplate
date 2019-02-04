app-header
  .navbar-fixed
    section
      .left
        .brand
          a(href="/")
            img(src='{ opts.brand_base64 }')
        .links
          ul
            li.active(onclick='{ goHome }')
              a
                |  Listening
            li
              a(href='badges.html')
                |  Campaigns
            li
              a(onclick='{ goLogin }')
                |  Addons
            li
              a(onclick='{ goLogin }')
                |  Publish
      .right
        .settings
          a(href="/")
            i.material-icons settings
        .welcome
          .person
            i.material-icons person
          .text
            | Welcome back,
            = " "
            span { opts.username }

  script(type="coffee").


    _self = this

    _self.on 'mount', ->
      true

    @goHome = (e) ->
      route('/')
