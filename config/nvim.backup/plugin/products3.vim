augroup products3Directory
   autocmd!
   autocmd BufRead,BufNewFile **/products3/* let g:test#elixir#exunit#executable = 'docker-compose exec backend mix test'
augroup END
