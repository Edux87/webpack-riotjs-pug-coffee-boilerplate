import fetch from 'isomorphic-fetch'

ENDPOINT_URL = __CONFIG_APP.services.endpoint
STORAGE = window.sessionStorage

validateAccount = (username, password) ->
  graphQLParams = """
    mutation DoLogin {
      accountLogin (
        input: {
          password: "#{ password }"
          username: "#{ username }"
        }
        ) {
          account_id
          account_username
        }
      }
  """
  fetch(ENDPOINT_URL,
    method: 'post'
    headers: 'Content-Type': 'application/graphql'
    body: graphQLParams)

startSession = (data) ->
  console.log data
  STORAGE.setItem "account_id", data.account_id
  STORAGE.setItem "account_username", data.account_username

clearSession = () ->
  STORAGE.clear()

validateSession = () ->
  STORAGE.getItem("account_id") != null

validateSession = () ->
  STORAGE.getItem("account_id") != null


export {
  validateAccount
  startSession
  clearSession
  validateSession
}
