app-header
  .navbar-fixed
    nav
      .nav-wrapper
        a.brand-logo(href='/')
          i.material-icons save
          | MyWebApp
        ul.right.hide-on-med-and-down
          li
            a(href='sass.html')
              i.material-icons search
          li
            a(href='badges.html')
              i.material-icons view_module
          li
            a(href='collapsible.html')
              i.material-icons refresh
          li
            a(href='mobile.html')
              i.material-icons more_vert

  script(type="coffee").
    _self = this
    _self.on 'mount', ->
      true

    @goHome = (e) ->
      Route('/')
