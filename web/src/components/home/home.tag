home
  .content
    .row
      .col.s12.m3(each="{ item in cards }")
        .card
          .card-image
            img(src='https://dummyimage.com/600x400/000/fff')
            span.card-title Card Title
            a.btn-large.btn-floating.halfway-fab.waves-effect.waves-light.blue
              i.material-icons visibility
          .card-content
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
