`import {QueryUtils} from 'autox'`
`import moment from 'moment'`
`import _ from 'lodash/lodash'`

{flow, partial} = _

start = (params, query) -> 
  query ?= new QueryUtils()
  {query, params}
macros = ({query, macro, params}) ->
  now = moment()
  switch macro ? params?.macro
    when "live", "today"
      query
      .filterBy "goliveAt", "<", now
      .filterBy "unliveAt", "!<", now
      .orderBy "goliveAt", "desc"
    when "future"
      query
      .filterBy "goliveAt", ">", now
      .orderBy "goliveAt", "desc"
    when "past"
      query
      .filterBy "unliveAt", "<", now
      .orderBy "unliveAt", "desc"
    when "all"
      query
      .orderBy "goliveAt", "desc"
    else query
  query: query
  macro: macro
  params: params
paginate = ({query, params}) -> 
  query.pageBy(params)
  {query, params}
finish = ({query}) -> query.toParams()

isLive = (model) -> 
  now = moment()
  liveAt = model.get("goliveAt")
  killAt = model.getWithDefault("unliveAt", moment().add(1, "year"))
  liveAt < now < killAt

processMacro = flow start, macros, finish
processQuery = flow start, macros, paginate, finish

`export {processMacro, processQuery, isLive}`
`export default processQuery`
