home
  .content
    .row
      .col.s12.m2(each="{ item in cards }")
        .card
          .card-image
            img(src='https://placeimg.com/640/480/tech')
            a.btn-floating.halfway-fab.waves-effect.waves-light.btn-large.blue
              i.material-icons send
          .card-content
            span.card-title Card Title
            p
              | I am a very simple card. I am good at containing small bits of information. I am convenient because I require little markup to use effectively.
  .fabStyle
    a.btn-floating.btn-large.waves-effect.waves-light.indigo
      i.material-icons add


  script(type="coffee").
    _self = this
    _self.cards = []
    _self.loader = true

    @on 'mount', () ->
      DataOps.getContextBoards().then (r) ->
        _self.cards = r.data
        _self.loader = false
        _self.update()
        console.log r
