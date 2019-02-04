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

# LOAD COMPONENTS
import './components/home/index.coffee'
import './components/app/index.coffee'

Riot.mount 'app-base'

M.AutoInit()
