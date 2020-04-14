# Call Ajax
window.callCustomAjax = do ->
  call_ajax = (options) ->
    $.ajax(
      url: options.url
      method: options.method or 'GET'
      data: options.data
      beforeSend: options.functions.beforeSend or ->
    ).done(
      options.functions.done or ->
    ).fail(
      options.functions.fail or ->
    )

  {
    ajax_request: call_ajax
  }