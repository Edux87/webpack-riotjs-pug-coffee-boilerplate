import './styles/main.scss'
import 'riot'
import route from 'riot-route/tag'




# DATA ENPOINT OPS
# ###################
import DataOps from './data/ops.coffee'

window.DataOps = DataOps

# ROUTER ##################
route.base('#!/')
window.route = route


requireAll = (r) ->
  r.keys().map (f) ->
    module_name = f.split('/').slice(-1).pop().split('.')[0]
    riot.mount module_name
    return
requireAll require.context './components', true, /\.(tag)$/
require.context './components', true, /\.(scss)$/


# MOUNT ROUTER ############
# riot.mount 'app-base'
# riot.mount 'home'
