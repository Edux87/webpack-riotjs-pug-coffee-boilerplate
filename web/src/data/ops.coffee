import fetch from 'isomorphic-fetch'

ENDPOINT_URL = __CONFIG_APP.services.endpoint


gRnd = (min, max) ->
  parseInt Math.random() * (max - min) + min

kstr = (number) ->
  k = 1000
  value = parseInt number
  if number < k
    return value.toLocaleString()
  if number < k*k
    return parseInt(value/k).toLocaleString() + 'K'
  if number > k*k
    return value.toLocaleString() + 'M'

getModelsByPublic = () ->
  graphQLParams = """
    query getModelsByPublic {
      getModelsByPublic (
        is_public: true
        ) {
          model_id
          model_name
          model_desc
          model_input_type
          model_output_type
          created_at_str
          model_count_samples
          model_count_features
        }
      }
  """

  fetch(ENDPOINT_URL,
    method: 'post'
    headers: 'Content-Type': 'application/graphql'
    body: graphQLParams)

getInventario = () ->
  new Promise (resolve, reject) ->
    setInterval ()->
      resolve(
        data: [
          (name: 'Producto 1', product_id: 'aa', cantidad: 4)
          (name: 'Producto 2', product_id: 'ab', cantidad: 5)
          (name: 'Producto 3', product_id: 'ac', cantidad: 3)
          (name: 'Producto 4', product_id: 'ac', cantidad: 2)
          (name: 'Producto 5', product_id: 'ac', cantidad: 2)
        ]
      )
      true
    , 2000
    return

getTiendas = () ->
  new Promise (resolve, reject) ->
    setInterval ()->
      resolve(
        data: [
          (name: 'Tienda 1', product_id: 'aa', cantidad: 4)
          (name: 'Tienda 2', product_id: 'ab', cantidad: 5)
          (name: 'Tienda 2', product_id: 'ab', cantidad: 5)
          (name: 'Tienda 2', product_id: 'ab', cantidad: 5)
          (name: 'Tienda 2', product_id: 'ab', cantidad: 5)
          (name: 'Tienda 3', product_id: 'ac', cantidad: 3)
          (name: 'Tienda 4', product_id: 'ac', cantidad: 2)
          (name: 'Tienda 5', product_id: 'ac', cantidad: 2)
        ]
      )
      true
    , 2000
    return

getOverviewSample = (start_date, end_date, context_id, drivers) ->
  new Promise (resolve, reject) ->
    setInterval ()->
      resolve(
        data:
          count_str: kstr(gRnd(100, 10000))
          count: gRnd(1000, 10000)
          tendencie: 'neutral'
          dist: [1300, 1555, 1654, 1258, 1000, 5166, 1223, 1112, 999, 788, 653, 1115, 1555, 1444, 1333]
      )
      true
    , 3000
    return

getOverviewSampleDist = (start_date, end_date, context_id, drivers) ->
  new Promise (resolve, reject) ->
    setInterval ()->
      resolve(
        data:
          samples_count: gRnd(1000, 10000)
          samples_avg_type: 'day'
          samples_avg_value: gRnd(100, 1000)

          labels: [1..8]
          series: [
            [gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100)]
            [gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100)]
            [gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100)]
            [gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100)]
            [gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100)]
          ]
      )
      true
    , 3000
    return

getOverviewSentimentShareDist = (start_date, end_date, context_id, drivers) ->
  new Promise (resolve, reject) ->
    setInterval ()->
      resolve(
        data:
          sentiment:
            positive: gRnd(10, 100)
            negative: gRnd(10, 100)
            neutral: gRnd(10, 100)
          labels: [1..8]
          series: [
            [gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100)]
            [gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100)]
            [gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100), gRnd(10, 100)]
          ]
      )
      true
    , 3000
    return

# REGISTRAR FUNCIONES AQUI ######
Ops = {
  getInventario
  getTiendas
}

export default Ops
