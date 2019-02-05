venta
  main
    .progress(if='{ loader }')
      .indeterminate
    .row
      .col.s12.m10
        .row
          .col.s12.m2(each='{ item in cards }')
            .card
              .card-image
                img(src='http://lorempixel.com/640/360')
                a.btn-floating.halfway-fab.waves-effect.waves-light.btn-large.blue.tooltipped(
                  data-position="top"
                  data-tooltip="Click para comprar ..."
                  onclick="{ addProduct }"
                )
                  i.material-icons shopping_cart
              .card-content
                span.card-title { item.name }
                p
                  | Stock: { item.cantidad }
      .col.s12.m2
        .row
          ul.collection
            li.collection-item.avatar(each='{ item in selected_products }')
              img.circle(src='http://lorempixel.com/640/360', alt='')
              span.title { item.name }
              p
                | Stock: { item.cantidad }
              a.secondary-content(href='#!')
                i.material-icons grade



  .fabStyle
    a.btn-floating.btn-large.waves-effect.waves-light.indigo
      i.material-icons add

  script(type="coffee").
    _self = this
    _self.cards = []
    _self.loader = true
    _self.selected_products = []

    _self.addProduct = (e) ->
      _self.selected_products.push(e.item.item)
      _self.update()


    @on 'mount', () ->
      DataOps.getInventario().then (r) ->
        _self.cards = r.data
        _self.loader = false
        _self.update()
        options =
          margin: 4
        elems = document.querySelectorAll('.tooltipped')
        instances = M.Tooltip.init(elems, options)



