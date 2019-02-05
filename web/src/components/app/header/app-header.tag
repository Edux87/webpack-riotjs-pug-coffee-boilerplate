app-header
  nav
    .nav-wrapper
      a.brand-logo(href='#') Logo
      ul#nav-mobile.right.hide-on-med-and-down
        li
          a(onclick='{ goVentas }') Ventas
        li
          a(onclick='{ goTiendas }') Tiendas
        li
          a(onclick='{ goInventario }') Inventario


  script(type="coffee").
    _self = this
    _self.on 'mount', ->
      true

    @goHome = (e) ->
      Route('/')

    @goInventario = (e) ->
      Route('/inventario')

    @goTiendas = (e) ->
      Route('/tienda')

    @goVentas = (e) ->
      Route('/ventas')
