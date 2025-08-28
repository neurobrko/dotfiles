return {
  -- A snippet that expands the trigger "hi" into the string "Hello, world!".
  require("luasnip").snippet({ trig = "debug" }, {
    t({
      "",
      "DEBUG = True",
      "if DEBUG:",
      "    from time import sleep",
      "    try:",
      "        import debugpy",
      "    except ModuleNotFoundError:",
      "        _LOGGER.warning(",
      "            \">>>>> REMOTE DEBUG: 'debugpy' module not found! Debugger not running!\"",
      "        )",
      "        _LOGGER.warning(",
      '            ">>>>> REMOTE DEBUG: Startup will resume in 3 seconds..."',
      "        )",
      "        sleep(3)",
      "    else:",
      "        _LOGGER.warning(",
      "            \">>>>> REMOTE DEBUG: Debugger listening on local port '5678'.\"",
      "        )",
      "        debugpy.listen(5678)",
      '        _LOGGER.warning(">>>>> REMOTE_DEBUG: Waiting for client connection...")',
      "        debugpy.wait_for_client()",
      "",
    }),
  }),
}
