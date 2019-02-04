app-lateral-nav
  .navbar
    ul
      li
        button(onclick='{ goHome }')
          i.material-icons dashboard
          br
          | Dashboard
      li
        button
          i.material-icons edit
          br
          | Edit
      li
        button.active
          i.material-icons visibility
          br
          | Overview
      li
        button(onclick='{ goClustering }')
          i.material-icons device_hub
          br
          | Clustering Analysis
      li
        button
          i.material-icons place
          br
          | Geo Listening

  script(type="coffee").
    _self = this

    _self.on 'mount', ->
      true

    _self.goHome = (e) ->
      route('/')

    _self.goClustering = (e) ->
      console.log 'go cls'
      route('/clustering/1')

    _self.goOverview = (e) ->
      console.log 'go cls'
      route('/overview/1')
