tienda
  main
    .progress(if='{ loader }')
      .indeterminate
    .row
      .col.s12.m2(each='{ item in cards }')
        .card
          .card-image
            img(src='http://lorempixel.com/640/360')
            a.btn-floating.halfway-fab.waves-effect.waves-light.btn-large.blue
              i.material-icons visibility
          .card-content
            span.card-title { item.name }
            p
              | Stock: { item.cantidad }
          .card-action
            a(href='#') Enviar

  .fabStyle
    a.btn-floating.btn-large.waves-effect.waves-light.indigo
      i.material-icons add

  script(type="coffee").
    _self = this
    _self.cards = []
    _self.loader = true

    @on 'mount', () ->
      DataOps.getTiendas().then (r) ->
        _self.cards = r.data
        _self.loader = false
        _self.update()
