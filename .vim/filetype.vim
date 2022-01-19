if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
    au BufRead,BufNewFile *.gql setfiletype graphql
augroup END
