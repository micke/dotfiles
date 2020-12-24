augroup hubbleDirectory
   autocmd!
   autocmd BufRead,BufNewFile **/hubble/* let g:test#ruby#rspec#executable = 'docker-compose exec web bundle exec rspec'
augroup END
