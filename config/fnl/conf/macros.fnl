(lambda highlight! [name attributes colors]
  (let [name (tostring name)
        colors (collect [_ v (ipairs attributes) :into colors] (tostring v) true)]
    `(vim.api.nvim_set_hl 0 ,name ,colors)))

{: highlight!}
