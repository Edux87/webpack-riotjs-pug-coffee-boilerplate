home
  app-sub-header(text='Boards')
  .content
    .sub-title
      .left
        h1 Boards
      .right
        app-button-link(to-route="overview", text="Create Board", type="primary")
    .loader(if='{ loader }')
    .cards
      home-card-dashboard(each='{ card in cards }', name='{ card.name }', context_id='{ card.context_id }', series='{ card.series }')

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
