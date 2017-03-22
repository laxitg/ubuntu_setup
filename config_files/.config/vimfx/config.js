let {commands} = vimfx.modes.normal
vimfx.addCommand({
    name: 'search_tabs',
      description: 'Search tabs',
        category: 'tabs',
          order: commands.tab_new_after_current.order + 1,

}, (args) => {
    commands.focus_location_bar.run(args)
        args.vim.window.gURLBar.value = '% '

})
vimfx.set('custom.mode.normal.search_tabs', 'b')
