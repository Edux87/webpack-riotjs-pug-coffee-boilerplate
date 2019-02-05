# MAIN FRAMEWORK
import M from './materialize.js'
# #######################

import './styles/main.scss'
import DataOps from './data/ops.coffee'
import Riot from 'riot'
import Route from 'riot-route/tag'
import './router.tag'

# GLOBAL RESOURCES
window.DataOps = DataOps
window.Riot = Riot
window.Route = Route
window.M = M

# LOAD COMPONENTS
import './components/home/index.coffee'
import './components/app/index.coffee'
import './components/inventario/index.coffee'
import './components/tienda/index.coffee'
import './components/venta/index.coffee'


Riot.mount 'app-base'

M.AutoInit()

