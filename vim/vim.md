设置显示行号
```
set nu
```


设置TAB为4个空格
```
set ts=4
set expandtab
```


nerdtree关闭主窗口时，自动退出vim
```
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
function! s:CloseIfOnlyNerdTreeLeft()
    if exists("t:NERDTreeBufName")
        if bufwinnr(t:NERDTreeBufName) != -1
            if winnr("$") == 1
                q
            endif
        endif
    endif
endfunction
```

编辑文件，自动打开nerdtree
```
autocmd vimenter * NERDTree
wincmd w
autocmd VimEnter * wincmd w
```

打开文件自动跳到上次位置

```
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
```